# # encoding: utf-8

# Inspec test for recipe wsus::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service('WsusService') do
  it { should be_installed }
  it { should be_running }
  its ('startmode') { should eq 'Auto' }
end

describe service('w3svc') do
    it { should be_installed }
    it { should be_running }
    its ('startmode') { should eq 'Auto' }
end

describe iis_site('WSUS Administration') do
  it { should exist }
  it { should be_running }
end
