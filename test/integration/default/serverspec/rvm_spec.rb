require 'spec_helper'

rvm_init_script = File.join('', 'etc', 'profile.d', 'rvm.sh' )
rvm_default_ruby = 'ruby-2.2.2'

describe file( rvm_init_script ) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
  its(:content) { should match /RVM/ }
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