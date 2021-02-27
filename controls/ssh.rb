
control 'SSH daemon ' do
  impact 1.0
  title 'Ensure that SSH is running'
  desc 'Check SSH port settings'
  describe port(22) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
    its('addresses') { should include '0.0.0.0' }
    its('processes') { should include 'sshd' }
  end
end

control 'Secure SSHD config' do
  impact 4.0
  title 'Ensures that SSH is setup securely'
  desc 'Peridically check SSHD config file for secure settings'
  describe sshd_config do
    its('PermitRootLogin') { should cmp 'yes' }
    its('PermitEmptyPasswords') { should cmp 'no' }
    its('PasswordAuthentication') {should cmp 'yes' }
    its('UsePrivilegeSeparation') { should cmp 'yes' }
  end
end
