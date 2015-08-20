require 'spec_helper'

describe file('/usr/local/bin/clackup') do
  it { should be_executable }
end
