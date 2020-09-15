# frozen_string_literal: true

control 'Systemd Journald' do
  title 'should match desired lines'

  describe file('/etc/systemd/journald.conf') do
    its('type') { should eq :file }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }

    its('content') { should include '[Journal]' }
    its('content') { should include 'Storage = auto' }
    its('content') { should include 'Compress = yes' }
    its('content') { should include 'Seal = yes' }
    its('content') { should include 'SplitMode = uid' }
    its('content') { should include 'SyncIntervalSec = 5m' }
    its('content') { should include 'RateLimitIntervalSec = 30s' }
    its('content') { should include 'RateLimitBurst = 10000' }
    its('content') { should include 'SystemMaxUse = 2g' }
    its('content') { should include 'SystemKeepFree = 3g' }
    its('content') { should include 'SystemMaxFileSize = 4g' }
    its('content') { should include 'SystemMaxFiles = 100' }
    its('content') { should include '#RuntimeMaxUse=' }
    its('content') { should include '#RuntimeKeepFree=' }
    its('content') { should include '#RuntimeMaxFileSize=' }
    its('content') { should include 'RuntimeMaxFiles = 100' }
    its('content') { should include '#MaxRetentionSec=' }
    its('content') { should include 'MaxFileSec = 1month' }
    its('content') { should include 'ForwardToSyslog = yes' }
    its('content') { should include 'ForwardToKMsg = no' }
    its('content') { should include 'ForwardToConsole = no' }
    its('content') { should include 'ForwardToWall = yes' }
    its('content') { should include 'TTYPath = /dev/console' }
    its('content') { should include 'MaxLevelStore = debug' }
    its('content') { should include 'MaxLevelSyslog = debug' }
    its('content') { should include 'MaxLevelKMsg = notice' }
    its('content') { should include 'MaxLevelConsole = info' }
    its('content') { should include 'MaxLevelWall = emerg' }
    its('content') { should include 'LineMax = 48K' }
    its('content') { should include 'ReadKMsg = yes' }
    its('content') { should include 'Audit = no' }
  end

  describe service('systemd-journald.service') do
    it { should be_enabled }
    it { should be_running }
  end
end
