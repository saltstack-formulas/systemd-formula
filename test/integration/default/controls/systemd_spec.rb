control 'Systemd package' do
  title 'should be installed'

  describe package('systemd') do
    it { should be_installed }
  end
end
