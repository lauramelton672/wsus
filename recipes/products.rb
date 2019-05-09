# Install which products for WSUS to sync
powershell_script 'disable' do
  code <<-EOH
    Get-WSUSProduct | Set-WSUSProduct -Disable
    EOH
end

powershell_script 'syncprod' do
  code <<-EOH
    $prod = #{node['wsus']['products']}
    Get-WsusProduct | Where-Object {$_.product.title -in ($prod)} | Set-WsusProduct
    EOH
end
