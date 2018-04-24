require 'spec_helper'

# describe package('httpd'), :if => os[:family] == 'redhat' do
#   it { should be_installed }
# end
#
# describe package('apache2'), :if => os[:family] == 'ubuntu' do
#   it { should be_installed }
# end
#
# describe service('httpd'), :if => os[:family] == 'redhat' do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe service('apache2'), :if => os[:family] == 'ubuntu' do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe port(80) do
#   it { should be_listening }
# end

describe command("su - vagrant -c 'ruby --version'") do
  its(:stdout) { should contain /2.4.2p198/ }
end
describe command("su - vagrant -c 'rails --version'") do
  its(:stdout) { should contain /5.1.6/ }
end
describe command("su - vagrant -c 'rvm version'") do
  its(:stdout) { should contain /1.29.3/ }
end
