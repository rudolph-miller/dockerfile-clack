require 'spec_helper'

describe file('/usr/local/bin/ros') do
    it { should be_executable }
end

describe command('ros list installed sbcl-bin') do
  its (:stdout) { should match /sbcl-bin/ }
end
