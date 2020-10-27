class AuthenticationError < StandardError

  class Unauthorized < AuthenticationError
    def message
      # change the message
      "Invalid credentials"
    end
  end

end
