require "spec_helper"

describe command("qlot") do
  its (:stdout) { should match /Usage/ }
end
