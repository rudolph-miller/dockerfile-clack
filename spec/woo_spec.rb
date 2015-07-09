require "spec_helper"

set :backend, :exec

describe command("woo") do
  its (:stderr) { should match /Woo/ }
end

describe port(5000) do
  it { should be_listening.with('tcp') }
end
