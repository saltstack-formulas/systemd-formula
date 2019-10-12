# frozen_string_literal: true

control 'Systemd Networkd' do
  title 'should match desired lines'

  describe file('/etc/systemd/network') do
    its('type') { should eq :directory }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/etc/systemd/network/99-default.link') do
    it { should_not exist }
  end

  describe file('/etc/systemd/network/eth0.network') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/etc/systemd/network/br0.netdev') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/etc/systemd/network/10-dmz.link') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/etc/systemd/network/10-internet.link') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
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
