# Install which classifications for WSUS to sync
powershell_script 'classifications' do
  code <<-EOH
    $class = #{node['wsus']['classifications']}
    Get-WsusClassification |Where-object -filterscript {$_.Classification.Title -in ($class)}|Set-WsusClassification -Verbose
    EOH
end
