class ExerciseController < ApplicationController

    get '/exercise/new' do
        erb :'/exercise/new'
    end

    post '/exercise' do
        @exercise = Exercise.create(name: params[:name], 
            muscle_group: params[:muscle_group]
        )
        # @exercise.user = current_user
        # @exercise.save
        # current_user.save
        redirect "/exercise/#{@exercise.id}"
    end

    get '/exercise/:id' do
        @exercise = Exercise.find(params[:id])
        erb :'/exercise/showpage'
    end

    get '/exercises' do
        @exercises = Exercise.all
        erb :'/exercise/index'
    end
end