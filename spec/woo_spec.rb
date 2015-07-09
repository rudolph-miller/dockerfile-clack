require "spec_helper"

describe command("woo") do
  its (:stderr) { should match /Woo/ }
end
