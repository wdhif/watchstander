class DockerController < ApplicationController
  def home
    @docker_version = Docker.version
    @docker_info = Docker.info
    container = Docker::Container.all(:all => true)
    images = Docker::Image.all
    @container_data = container
    @images_data = images
  end
end
