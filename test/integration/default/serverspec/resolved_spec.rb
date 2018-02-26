require 'serverspec'

set :backend, :exec

describe file('/etc/systemd/resolved.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/resolv.conf') do
  it { should be_symlink }
end

describe service('systemd-resolved') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
