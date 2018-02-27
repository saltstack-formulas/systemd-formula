require 'serverspec'

set :backend, :exec

describe file('/etc/systemd/network') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe service('systemd-networkd') do
  it { should be_enabled }
  it { should be_running }
end

describe service('systemd-networkd-wait-online') do
  it { should be_enabled }
end
