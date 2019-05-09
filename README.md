WSUS
===================
This cookbook sets up a WSUS server. 

Requirments
-------------------
2016 Windows Server

Cookbooks
-------------------

#### default
Installs: 
- WSUS roles with post-install
- IIS
- Sets a windows task to clean up WSUS weekly
- Sets Classifications to sync
- Sets Products to sync

#### classification
- Sets which classifications to check 

#### products
- Removes any currently check marked products
- Sets which products to check

Attributes
-----------------------------------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['wsus']['win-features']</tt></td>
    <td></td>
    <td>Needed Windows Features for WSUS</td>
    <td><tt>'UpdateServices',
    'Web-Server',
    'UpdateServices-WidDB',
    'UpdateServices-services',
    'UpdateServices-RSAT',
    'UpdateServices-API',
    'UpdateServices-UI'</tt></td>
  </tr>
  <tr>
    <td><tt>['wsus']['classifications']</tt></td>
    <td>string</td>
    <td>Classifications for WSUS to sync</td>
    <td><tt>'Critical Updates',
    'Definitation Updates',
    'Security Updates',
    'Updates'</tt></td>
  </tr> 
    <tr>
    <td><tt>['wsus']['products']</tt></td>
    <td>string</td>
    <td>Products for WSUS to sync</td>
    <td><tt>'Office 2013',
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
    'Windows Server 2019'</tt></td>
  </tr> 
</table>


