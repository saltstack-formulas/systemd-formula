control 'Systemd units' do
  title 'should match desired lines'

  describe file('/etc/systemd/system/syncthing-someuser.service') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe service('syncthing-someuser.service') do
    it { should be_enabled }
  end
end
