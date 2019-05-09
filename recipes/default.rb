#
# Cookbook:: wsus
# Recipe:: default
#
# Copyright:: 2019, TAMU, All Rights Reserved.

return unless platform?('windows')

# install needed windows features
windows_feature [node['wsus']['win-features']] do
  action :install
  management_tools true
  install_method :windows_feature_powershell
  not_if '(Get-WindowsFeature -Name UpdateServices).Installed'
end

# Set scheduled task for server cleanup
windows_task 'wsussync' do
  command 'Get-WsusServer | Invoke-WsusServerCleanup -CleanupObsoleteComputers –CleanupObsoleteUpdates'
  run_level :highest
  frequency :weekly
  day 'Sun'
  action :create
end

# Create dir for updates to be stored in
directory 'C:\wsus' do
  action :create
  not_if { ::File.directory?('C:\wsus') }
end

# Set content location; set where updates will be stored
powershell_script 'contentdir' do
  cwd 'C:\\Program Files\\Update Services\\Tools'
  code <<-EOH
    .\\wsusutil.exe postinstall -accepteula CONTENT_DIR=C:\\wsus
    EOH
end

powershell_script 'postinstall' do
  code <<-EOH
        $wsus = Get-WSUSServer
        $wsusConfig = $wsus.GetConfiguration()
        Set-WsusServerSynchronization -SyncFromMU
        $wsusConfig.AllUpdateLanguagesEnabled = $false
        $wsusConfig.SetEnabledUpdateLanguages("en")
        $wsusConfig.Save
    EOH
end
# syncs categories to reflect all new ones
powershell_script 'categorysync' do
  code <<-EOH
    $wsus = Get-WSUSServer
    $subscription = $wsus.GetSubscription()
    $subscription.StartSynchronizationForCategoryOnly()
    While ($subscription.GetSynchronizationStatus() -ne 'NotProcessing') {
        Write-Host "." -NoNewline
        Start-Sleep -Seconds 5
        }
    EOH
end

include_recipe 'wsus::classifications'
include_recipe 'wsus::products'
