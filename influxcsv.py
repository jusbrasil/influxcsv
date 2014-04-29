import os
import json
import csv
import cStringIO
import requests
from flask import Flask
from flask import Response
from flask import request

app = Flask(__name__)

def get_blobs(url, auth):
  headers = {}
  if auth:
    headers['Authorization'] = auth
  r = requests.get(url, stream=True, headers=headers)
  buff = ''
  for c in r.iter_content():
    buff += c
    if c == '}':
      try:
        yield json.loads(buff.strip())
        buff = ''
      except ValueError:
        pass

def write_blobs(blobs_it):
  need_to_write_header = True
  for b in blobs_it:
    csv_handle = cStringIO.StringIO()
    csvwriter = csv.writer(csv_handle)
    if need_to_write_header:
      csvwriter.writerow(b['columns'])
      need_to_write_header = False
    csvwriter.writerows(b['points'])
    yield csv_handle.getvalue()

@app.route('/influx')
def proxy_influx():
  q = request.args.get('q')
  db = request.args.get('db')
  host = request.args.get('host')
  port = request.args.get('port')
  proto = request.args.get('proto')
  auth = request.headers['Authorization']
  url = '%(proto)s://%(host)s:%(port)s/db/%(db)s/series?chunked=true&q=%(q)s' %\
        {"q": q, "db": db, "host": host, "port": port, "proto": proto}
  return Response(write_blobs(get_blobs(url, auth)), mimetype='text/csv')

@app.route('/')
def help():
  return app.send_static_file('influxcsv.1.html')

if __name__ == '__main__':
    app.run(debug=True)
