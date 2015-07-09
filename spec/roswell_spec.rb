require 'spec_helper'

describe file('/usr/local/bin/ros') do
    it { should be_executable }
end
