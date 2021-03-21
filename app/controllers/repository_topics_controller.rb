class RepositoryTopicsController < RepositoriesController
  def update
    reponse = Github::RespositoryTopic.new(current_user).update(repository_name, repository_params)
    render json: { data: reponse }, status: :ok
  end
end
