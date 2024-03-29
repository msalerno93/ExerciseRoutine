class ExerciseController < ApplicationController

    get '/exercise/new' do
        if logged_in?
            erb :'/exercise/new'
        else
            redirect "/"
        end
    end

    post '/exercise' do
        if !current_user.exercises.find_by(name: params[:name])
            @exercise = Exercise.create(name: params[:name], 
                muscle_group: params[:muscle_group]
            )
            if @exercise.valid?
                @exercise.user = current_user
                @exercise.save
                current_user.save
                redirect "/exercises"
            else
                redirect '/exercise/new'
            end
        else
            redirect "/exercise/new"
        end
    end

    get '/exercise/:id' do
        if logged_in?
            @exercise = Exercise.find(params[:id])
            erb :'/exercise/showpage'
        else
            redirect "/"
        end
    end

    get '/exercises' do
        if logged_in?
            @exercises = current_user.exercises
            erb :'/exercise/index'
        else
            redirect "/"
        end
    end

    get '/exercises/:id/edit' do
        if logged_in?
            @exercise = Exercise.find(params[:id])
            if @exercise.user == current_user
                erb :'/exercise/edit'
            else
                redirect "/exercises"
            end
        else
            redirect "/"
        end
    end

    patch '/exercises/:id/edit' do
        @exercise = Exercise.find(params[:id])
        if @exercise.user == current_user
            @exercise.update(
                name: params[:name], 
                muscle_group: params[:muscle_group]
            )
        end
            redirect "/exercises"
    end

    delete '/exercises/:id' do
        @exercise = Exercise.find(params[:id])
        if @exercise.user == current_user
            @exercise.delete
        end
        redirect '/exercises'
    end

end