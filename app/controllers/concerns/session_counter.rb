module SessionCounter

  private

    # Initialize visit counter if not existing else increment it
    def set_counter
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end

    # Reset visits counter
    def reset_counter
      session[:counter] = 0
    end

end