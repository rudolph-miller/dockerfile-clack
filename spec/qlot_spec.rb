require "spec_helper"

set :backend, :exec

describe command("qlot") do
  its (:stdout) { should match /Usage/ }
end
