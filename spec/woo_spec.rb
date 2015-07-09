require "spec_helper"

describe file('/usr/local/bin/woo') do
    it { should be_executable }
end
