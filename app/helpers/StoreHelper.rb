class StoreController < App
    blacklist = {}
    require_relative 'order'


    def login?
      if session[:username].nil?
        false
      else
        true
      end
    end

    def username
      session[:username]
    end


    def authenticate!
      user_q = User.find_by(email: params[:email])
      if user_q.nil? then return 'Oops, looks like something went wrong!'.to_json end
      if user_q[:email] === params[:email] && (user_q[:password] === BCrypt::Engine.hash_secret(params[:password], user_q[:salt_password]))
        @username = session[:username] = user_q[:username]
        @userid = session[:userid] = user_q[:id]
        'Logged in'.to_json
      else
        "Oopps..Sorry! You're definately doing something wrong".to_json
      end
    end

    def current_user
      @username
      @userid
    end

    def do_signup
      username = params[:username]
      email = params[:email]
      lastname = params[:lastname]
      firstname = params[:firstname]
      password = params[:password]
      password2 = params[:password2]

      if password != password2
        return "Passwords don't Match!".to_json
      end

      if User.exists?(email: email) || User.exists?(username: username)
        return 'User Already Exist'.to_json
      end

      confirmed_pass = password
      password_salt = BCrypt::Engine.generate_salt
      password_hash = BCrypt::Engine.hash_secret(confirmed_pass ,password_salt)
      User.create(
              :username => username,
              :first_name => firstname,
              :last_name => lastname,
              :email => email,
              :password => password_hash,
              :salt_password => password_salt
              )
            'Account Created'.to_json
      end
end



