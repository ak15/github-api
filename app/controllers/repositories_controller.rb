class RepositoriesController < ApplicationController
  def index
    response = Github::Respository.new(current_user).list
    render json: { data: response }, status: :ok
  end

  def create
    response = Github::Respository.new(current_user).create(repository_params)
    render json: { data: response }, status: :ok
  end

  def update
    reponse = Github::Respository.new(current_user).update(repository_name, repository_params)
    render json: { data: reponse }, status: :ok
  end

  def destroy
    Github::Respository.new(current_user).delete(repository_name)
    render json: { message: 'Delete' }, status: :ok
  end

  private

  def repository_params
    # as of now limited since not specified
    params.permit(:repository).permit(:name, :description)
  end

  def repository_name
    params[:repository_name]
  end
end
