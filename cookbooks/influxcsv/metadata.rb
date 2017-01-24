name             'influxcsv'
maintainer       'JusBrasil'
maintainer_email 'dev@jusbrasil.com.br'
license          'All rights reserved'
description      'Installs/Configures influxcsv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'git', '~> 0.10.0'
depends 'supervisor', '~> 0.4.2'
depends 'nginx', '~> 1.4.0'
depends 'ohai', '< 4.0.0' # hack to make it works with chef 12.x
