
require_relative 'helpers/methods_practice_helpers'
class PostsController < ApplicationController
  include Pagy::Backend
  helpers do
    include Pagy::Frontend
  end


  # GET: /posts
  get "/posts" do

    @posts = Post.all.includes(%i[attachments])
    @pagy, @posts = pagy(Post)


    erb :"/posts/index.html"
  end

  # GET: /posts/new
  get "/posts/new" do
        protected!
    @post = Post.new
    erb :"/posts/new.html"
 
  end

  # POST: /posts
  post "/posts" do


    @post = Post.create(title: params[:title], description: params[:description])


    if @post.save
      unless params[:attachments].blank?
        params[:attachments]['image'].each do |a|
          @post.attachments.create!(image: a)
        end


      end
      redirect '/posts'
    else
      erb :"/posts/new.html"
    end

  end

  # GET: /posts/5
  get "/posts/:id" do

    @post = post.find(params[:id])
    erb :"/posts/show.html"

  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
      @post = Post.find(params[:id])

    if @post.update(name: params[:name], body: params[:body], price: params[:price])
      redirect '/posts/:id'
    else
      redirect '/posts/:id'
    end
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
     @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end

  private

  def pagy_get_vars(collection, vars)
    {
      count: collection.count,
      page: params['page'],
      items: vars[:items] || 25
    }
  end
  helpers MethodsPracticeHelpers
end
