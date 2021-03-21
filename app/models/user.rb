class User < ApplicationRecord
    def encoded_token
      Base64.strict_encode64(token)
    end
end
