require 'serverspec'

set :backend, :exec

describe package('systemd') do
  it { should be_installed }
end
