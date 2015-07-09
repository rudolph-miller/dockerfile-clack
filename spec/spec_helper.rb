require 'docker'
require 'serverspec'

if ENV['CIRCLECI']
  class Docker::Container
    def remove(options={}); end
    alias_method :delete, :remove
  end
end

set :backend, :docker
set :docker_url, ENV['DOCKER_HOST']
set :docker_image, 'rudolphm/clack-test'

Excon.defaults[:ssl_verify_peer] = false
