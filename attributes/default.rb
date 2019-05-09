default['wsus']['win-features'] = [
  'UpdateServices',
  'Web-Server',
  'UpdateServices-WidDB',
  'UpdateServices-services',
  'UpdateServices-RSAT',
  'UpdateServices-API',
  'UpdateServices-UI'
]
default['wsus']['classifications'] = "
  'Critical Updates',
  'Definitation Updates',
  'Security Updates',
  'Updates'
"

default['wsus']['products'] = "
  'Office 2013',
  'Office 2016',
  'Office 2019',
  'Microsoft SQL Server 2012',
  'Microsoft SQL Server 2014',
  'Microsoft SQL Server 2016',
  'Microsoft SQL Server 2017',
  'Microsoft SQL Server Management Studio v17',
  'SQL Server Feature Pack',
  'Windows 10',
  'Windows 10 Feature on Demand',
  'Windows Server 2012 R2',
  'Windows Server 2016',
  'Windows Server 2019'
"
