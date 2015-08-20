require 'spec_helper'

describe file('/usr/local/bin/qlot') do
  it { should be_executable }
end
