class AuthenticationError < StandardError
  class MissingRequiredHeader < AuthenticationError

    def message
      # change the message
      "Missing required Authentication HTTP Header."
    end
  end


  class Unauthorized < AuthenticationError
    def message
      # change the message
      "Invalid credentials"
    end
  end

end
