require "spec_helper"

describe command("clackup") do
  its (:stdout) { should match /Usage/ }
end
