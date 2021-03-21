module Github
  class RespositoryTopic < Base
    def update(repo_name, body)
      authenticated_put_request("/repos/#{user.username}/#{repo_name}", body)
    end
  end
end
