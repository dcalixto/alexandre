

require './config/environment'


class ApplicationController < Sinatra::Base
  def authorized?
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == %w[teste teste]
  end

  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Oops... we need your login name & password\n"])
    end
  end

  get '/admin' do
    protected!
    'in secure'
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :logging, true
    set :dump_errors, true

  end

  get '/' do
  @boats = Boat.all.includes(%i[ boat_attachments])
    @houses = House.all.includes(%i[ house_attachments])
  erb :home
  end
  get '/premios' do
    erb :premios
  end

  get '/contato' do
    erb :contact2
  end
  get '/filosofia' do
    erb :filosofia
  end

  get '/regulamento' do
    erb :regulamento
  end
  get '/condicoes' do
    erb :condicoes
  end
  get '/participar' do
    erb :participar
  end

  get '/resultados' do
    erb :resultados
  end

  post '/contact' do
    Pony.mail(
      from: params[:name] + '<' + params[:email] + '>',
      to: 'milan.luca@gmail.com',
      subject: params[:name] + ' ti ha scritto da giuliaefabiosisposano.it',
      body: params[:text],
      via: :smtp,
      via_options: {
        address: 'smtp.sendgrid.net',
        port: '587',
        enable_starttls_auto: true,
        user_name: ENV['SENDGRID_USERNAME'],
        password: ENV['SENDGRID_PASSWORD'],
        authentication: :plain,
        domain: ENV['SENDGRID_DOMAIN']
      }
    )
  end




end
