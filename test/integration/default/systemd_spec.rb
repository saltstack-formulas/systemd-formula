%w{
  systemd
}.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end
