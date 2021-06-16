
require_relative 'helpers/methods_practice_helpers'
class HousesController < ApplicationController
  include Pagy::Backend
  helpers do
    include Pagy::Frontend
  end
  # GET: /houses
  get "/houses" do
      @houses = House.all.includes(%i[ house_attachments])
    @pagy, @houses = pagy(House)
  
    erb :"/houses/index.html"
  end

  # GET: /houses/new
  get "/houses/new" do
      protected!
       @house = House.new
    erb :"/houses/new.html"
  end

  # POST: /houses
  post "/houses" do
      @house = House.create(name: params[:name], body: params[:body],  rent: params[:rent],
                            price: params[:price],   sell: params[:sell],  land: params[:land]
      )

    if @house.save
      unless params[:house_attachments].blank?
        params[:house_attachments]['image'].each do |a|
          @house.house_attachments.create!(image: a)
        end

      end
         redirect "/houses"
    else
      erb :"/houses/new.html"
    end

    
  end

  get '/houses/rent' do
  

       @houses =  House.all.includes(%i[ house_attachments])
    @pagy, @houses = pagy(House)



    erb :"/houses/rent.html"
  end

    get '/houses/sell' do
  

       @houses = House.all
    @pagy, @houses = pagy(House)



    erb :"/houses/sell.html"
  end



  # GET: /houses/5
  get "/houses/:id" do
        @house = House.find(params[:id])
    erb :"/houses/show.html"
  end

  # GET: /houses/5/edit
  get "/houses/:id/edit" do
    erb :"/houses/edit.html"
  end

  # PATCH: /houses/5
  patch "/houses/:id" do
    redirect "/houses/:id"
  end

  # DELETE: /houses/5/delete
  delete "/houses/:id/delete" do
    redirect "/houses"
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
