require 'spec_helper'

describe file('/usr/local/lib/libmysqlclient_r.so') do
  it { should be_exists }
end
