class UserController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do 

        if params[:username] == "" && params[:password] == ""
            redirect "/users/signup"
        else
            @user = User.new(
            username: params[:username], 
            password: params[:password]
        )
            if @user.save
                session[:user_id] = @user.id
                redirect "/users"
            else
                redirect to "/users/signup"
            end
        end
    end

    get '/users/login' do
        if !logged_in?
            erb :'/users/login'
        else
            @user = User.find(session[:user_id])
            redirect "/users"
        end
    end

    post '/users/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users"
        else
            redirect "/users/login"
        end
    end

    get '/users' do 
        if logged_in?
            @user = current_user
            erb :'/users/show'
        else
            redirect "/"
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect "/"
        else
            redirect "/"
        end
    end

end