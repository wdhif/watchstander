class DockerController < ApplicationController

  helper_method :start_container
  helper_method :stop_container
  helper_method :kill_container
  helper_method :delete_container

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

  def start_container()
    if params.has_key?(:id)
      Docker::Container.get(params['id']).start
      redirect_to '/containers'
    end
  end

  def stop_container()
    if params.has_key?(:id)
      Docker::Container.get(params['id']).stop
      redirect_to '/containers'
    end
  end

  def kill_container()
    if params.has_key?(:id)
      Docker::Container.get(params['id']).kill
      redirect_to '/containers'
    end
  end

  def delete_container()
    if params.has_key?(:id)
      Docker::Container.get(params['id']).delete(:force => true)
      redirect_to '/containers'
    end
  end
end
