require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './config/environments'
require 'sitemap_generator'
require 'carrierwave'
require './config/initializers/carrierwave'

class Article < ActiveRecord::Base
end

SitemapGenerator::Sitemap.default_host = "http://www.mywebsite.com"
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
#SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['S3_BUCKET']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  # This part WORKS.
  add '/index', :changefreq => 'weekly', :priority => 0.9
  add '/team', :changefreq => 'weekly', :priority => 0.9
  add '/services', :changefreq => 'weekly', :priority => 0.9
  add '/blog', :changefreq => 'weekly', :priority => 0.9
  add '/contact', :changefreq => 'weekly', :priority => 0.9

  # This part DOESN'T work.
  Class::Article.find_each do |article|
    add "/blog/#{article.url}", :lastmod => article.updated_at
  end

end