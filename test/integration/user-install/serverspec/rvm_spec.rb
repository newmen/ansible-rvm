require 'spec_helper'

rvm_init_script = File.join('', 'home', 'vagrant', '.rvm', 'scripts', 'rvm' )
rvm_home_profile = File.join('', 'home', 'vagrant', '.profile' )
rvm_default_ruby = 'ruby-2.2.2'

[ rvm_init_script,
  rvm_home_profile
].each do |rvm_file|
  describe file( rvm_file ) do
    it { should be_file }
    it { should be_owned_by 'vagrant' }
    it { should be_grouped_into 'vagrant' }
    its(:content) { should match /RVM/ }
  end
end

describe command("su - vagrant -c 'rvm version'") do
  its(:stdout) { should match /^rvm\s+[\d.-_]+/ }
end

describe command("su - vagrant -c 'rvm list strings'") do
  its(:stdout) { should contain( rvm_default_ruby ) }
end

describe command("su - vagrant -c 'ruby --version'") do
  its(:stdout) { should contain( rvm_default_ruby.split('-')[-1].to_s ) }
end