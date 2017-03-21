class DockerController < ApplicationController
  def dashboard
    @docker_version = Docker.version
    @docker_info = Docker.info
  end

  def containers
    @containers = Docker::Container.all(:all => true)
  end

  def images
    @images = Docker::Image.all
  end
end
