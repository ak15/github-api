module Github
  class Base
    include HTTParty

    base_uri 'https://api.github.com'

    attr_reader :user, :query

    def initialize(user)
      @user = user
    end

    def authenticated_get_request(uri, query = {})
      return nil if user.blank?

      response = self.class.get(uri, query: query, headers: header)
      JSON.parse(response.body)
    end

    def authenticated_post_request(uri, body = {})
      return nil if user.blank?

      response = self.class.post(uri, body: body.to_json, headers: header)
      JSON.parse(response.body)
    end

    def authenticated_delete_request(uri)
      return nil if user.blank?

      self.class.delete(uri, headers: header)
    end

    def authenticated_patch_request(uri, body = {})
      return nil if user.blank?

      response = self.class.patch(uri, body: body.to_json, headers: header)
      JSON.parse(response.body)
    end

    def authenticated_put_request(uri, body = {})
      return nil if user.blank?

      response = self.class.post(uri, body: body.to_json, headers: header)
      JSON.parse(response.body)
    end

    private

    def header
      @_header ||= { 'Authorization' => "Basic #{user.encoded_token}" }
    end
  end
end
