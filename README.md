influxcsv(1) -- wrapper to present InfluxDB query results as CSV
================================================================

## SYNOPSIS

    https://influxcsv.herokuapp.com/influx?host=sandbox.influxdb.com&port=8086&proto=http&db=mydatabase&q=select%20*%20from%20my-series%20limit%201000

## DESCRIPTION

A simple wrapper service to proxy an InfluxDB database and present query results as CSV.
Only queries that return a single series will give expected results.

Useful for things like the Quantopian data fetcher, or any other system that can only
consume CSV format data, and needs access to timeseries data stored in Influx.

No data is stored by this service, and it is very easy to set up inside your own infrastructure.

## OPTIONS

All options are specified as HTTP GET parameters

 * `proto` <http[s]>: the protocol to use to connect to the InfluxDB server (eg, `http` or `https`)
 * `host` <string>: the hostname of your InfluxDB server
 * `port` <integer>: the port number your InfluxDB server is listening on
 * `db` <string>: the name of the database you wish to query
 * `q` <string>: the actual query

Additionally, authorization is only handled over HTTP Basic Auth. (I.E., you cannot specify credentials as GET parameters.)
Send your `Authorization` header to this service, and it will be forwarded, unchanged, to your InfluxDB.

## SECURITY CONSIDERATIONS

No data or authorization credentials are logged or saved by this application.  If you would rather run
it on your own infrastructure, it is very easy:

    python influxcsv.py

Or, if you prefer to run it with `foreman` (as it is run on Heroku):

    foreman start

## AUTHOR

[Patrick Kaeding](http://kaeding.name)

## SEE ALSO

 * [InfluxDB](http://influxdb.org)
 * [Quantopian](https://www.quantopian.com)
