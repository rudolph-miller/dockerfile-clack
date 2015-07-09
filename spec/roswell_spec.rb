require "spec_helper"

describe command("ros --version") do
    its (:stderr) { should match /roswell/ }
end

describe command("ros list installed sbcl-bin") do
  its (:stdout) { should match /sbcl-bin/ }
end
