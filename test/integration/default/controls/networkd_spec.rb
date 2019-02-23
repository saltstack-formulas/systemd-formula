control 'Systemd Networkd' do
  title 'should match desired lines'

  describe file('/etc/systemd/network') do
    its('type') { should eq :directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
  
  describe service('systemd-networkd') do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe service('systemd-networkd-wait-online') do
    it { should be_enabled }
  end
end
