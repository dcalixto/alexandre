require_relative 'helpers/methods_practice_helpers'
class BoatsController < ApplicationController
  include Pagy::Backend
  helpers do
    include Pagy::Frontend
  end
  # GET: /boats
  get '/boats' do
    @boats = Boat.all.includes(%i[ boat_attachments])
    @pagy, @boats = pagy(Boat)
    erb :"/boats/index.html"
  end

  post '/new_choice' do
  rent = params[:rent]
  sell = params[:sell]

  @boats = Boat.all(rent, sell)
  redirect '/boats'
end

  # GET: /boats/new
  get '/boats/new' do
    @boat = Boat.new
    erb :"/boats/new.html"
  end

  # POST: /boats
  post '/boats' do
    @boat = Boat.create(name: params[:name], body: params[:body],  rent: params[:rent],
                            price: params[:price],   sell: params[:sell]
      )

    if @boat.save
      unless params[:boat_attachments].blank?
        params[:boat_attachments]['image'].each do |a|
          @boat.boat_attachments.create!(image: a)
        end

      end
      redirect '/boats'
    else
      erb :"/boats/new.html"
    end
  end


   # GET: /boats/5
  get '/boats/rent' do
  

       @boats =  Boat.all.includes(%i[ boat_attachments])
    @pagy, @boats = pagy(Boat)



    erb :"/boats/rent.html"
  end

    get '/boats/sell' do
  

       @boats = Boat.all
    @pagy, @boats = pagy(Boat)



    erb :"/boats/sell.html"
  end



  # GET: /boats/5
  get '/boats/:id' do
    @boat = Boat.find(params[:id])
    erb :"/boats/show.html"
  end

 

  # GET: /boats/5/edit
  get '/boats/:id/edit' do
    erb :"/boats/edit.html"
  end

  # PATCH: /boats/5
  patch '/posts/:id' do
    @boat = Boat.find(params[:id])

    if @boat.update(name: params[:name], body: params[:body],  price: params[:price])
      redirect '/boats/:id'
    else
      redirect '/boats/:id'
    end
  end

  # DELETE: /boats/5/delete
  delete '/boats/:id/delete' do
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect '/boats'
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
