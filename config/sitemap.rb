require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './environment'
require 'sitemap_generator'
require 'carrierwave'
#require './app/controllers/application_controller.rb'
require './config/initializers/carrierwave'

class Boat < ActiveRecord::Base
end
class House < ActiveRecord::Base
end

SitemapGenerator::Sitemap.default_host = 'http://www.admboat.com'
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
# SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['S3_BUCKET']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # This part WORKS.
  add '/', changefreq: 'weekly', priority: 0.9
  add '/boats', changefreq: 'weekly', priority: 0.9
  add '/houses', changefreq: 'weekly', priority: 0.9
  add '/contact', changefreq: 'weekly', priority: 0.9

  # This part DOESN'T work.
  Class::Boat.find_each do |boat|
    add "/boat/#{boat.url}", lastmod: boat.updated_at
  end

  Class::House.find_each do |house|
    add "/house/#{house.url}", lastmod: house.updated_at
  end
end
