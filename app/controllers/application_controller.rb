require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])

    redirect "/posts/#{@post.id}"
  end

  get '/posts' do
    Post.all

    erb :index
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])

    erb :index
  end

  # get '/index' do
  #   @posts = Post.all
  #   erb :index
  # end
end
