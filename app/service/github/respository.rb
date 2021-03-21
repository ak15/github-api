module Github
  class Respository < Base
    def list
      authenticated_get_request('/user/repos')
    end

    def create(body)
      authenticated_post_request('/user/repos', body)
    end

    def delete(repo_name)
      authenticated_delete_request("/repos/#{user.username}/#{repo_name}")
    end

    def update(repo_name, body)
      authenticated_patch_request("/repos/#{user.username}/#{repo_name}", body)
    end
  end
end
