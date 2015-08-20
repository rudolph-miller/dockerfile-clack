require "spec_helper"

describe command('ros -e "(or (ignore-errors (and (ql:quickload :woo) (uiop:quit 0)) (uiop:quit -1))"') do
  its(:exit_status) { should eq 0 }
end
