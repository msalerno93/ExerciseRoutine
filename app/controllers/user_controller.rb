class UserController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do 
        @user = User.create(
            username: params[:username], 
            password: params[:password]
        )
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end

    get '/users/login' do
        erb :'users/login'
    end

    # post '/users/login' do
    #     @user = User.find_by(username: params[:username]
        
    #     # if params[:password] == @user.password

    # end

    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end

end