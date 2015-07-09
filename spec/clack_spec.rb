require "spec_helper"

set :backend, :exec

describe command("clackup") do
  its (:stdout) { should match /Usage/ }
end
