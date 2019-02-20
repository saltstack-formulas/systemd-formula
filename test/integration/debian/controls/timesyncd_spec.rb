control 'Timesysnc config' do
  title 'should match desired lines'

  describe command('systemctl is-enabled systemd-timesyncd.service') do
    its('stdout') { should eq "enabled\n" }
  end
  
  describe command('systemctl is-active systemd-timesyncd.service') do
    its('stdout') { should eq "active\n" }
  end
  
  describe command('timedatectl | grep "NTP synchronized"') do
    its('stdout') { should match /yes/ }
  end
  
  describe command('timedatectl | grep "Time zone"') do
    its('stdout') { should match /UTC/ }
  end
end
