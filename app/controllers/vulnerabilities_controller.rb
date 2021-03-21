class VulnerabilitiesController < RepositoriesController
  def index
    response = Github::Vulnerability.new(current_user).list(repository_name)
    render json: { data: response }
  end
end
