# frozen_string_literal: true

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
    it { should_not be_running }
  end

  describe file('/etc/systemd/system/rsync.service') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('content') { should_not include '[status]' }
    its('content') { should_not include '[enabled]' }
    its('content') { should_not include '[dropin]' }
    its('content') { should include 'Documentation=man:rsync(1) man:rsyncd.conf(5)' }
    its('content') { should include 'ConditionPathExists=/etc/rsyncd.conf' }
    its('content') { should include 'ConditionPathExists=/etc/passwd' }
    its('content') { should include 'ExecStart=/usr/bin/rsync --daemon --no-detach' }
    its('content') { should include '[Install]' }
    its('content') { should include 'WantedBy=multi-user.target' }
  end

  describe service('rsync.service') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/systemd/system/systemd-journald.service.d/salt-override.conf') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('content') { should_not include '[status]' }
    its('content') { should_not include '[enabled]' }
    its('content') { should_not include '[dropin]' }
    its('content') { should include '[Unit]' }
    its('content') { should include 'Description=Fancy new description' }
    its('content') { should include '[Service]' }
    its('content') { should include 'WatchdocSec=2min' }
    its('content') { should include 'RestartSec=2' }
    its('content') { should_not include '[Install]' }
  end
end
