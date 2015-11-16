class SitesController < ApplicationController
require 'rest-client'
require 'JSON'
require 'yelp'
require 'yelp4rails'
require 'uri'



  def index
    @countries = Country.all
    @cities = City.where("country_id = ?", Country.first.id)
    @categories = Category.all
    @categorylen = Category.all.length
  end

  def show

    @city = City.find_by("id = ?", params[:trip][:city_id])
    @country = Country.find_by("id = ?", params[:trip][:country_id])

    @keys = {consumer_key: 'AAjxUGv8qJDJBD2HrrfHtw', consumer_secret: '-8LBfZ053iUnBE3I2wEMfi2tx-0', token: '7f_HgQYjrhwdvq8tl-X--MfT4dfpQ09h', token_secret: 'p-kqumRE-InibQEzz76HsDGGGMw'}
    yelp = YelpApi.new(@keys) 
    @location = URI.encode(@city.name.titleize.to_s + ' , ' + @country.name.titleize.to_s)

     if params[:activated]
    @activated_ids = params[:activated].collect {|id| id.to_i}

    @sel_category = [] 
    @topfiveresponse = []
    @remainingresponse = []

    @activated_ids.each do | sel_id| 
    @sel_category << Category.find(sel_id).name.titleize
     end

     @sel_category_arrlen = @sel_category.length

     @activated_ids.each do | sel_id|
     @selection = Category.find(sel_id).name.titleize
     @topfiveresponse << yelp.find_by(term: @selection , location: @location, sort: '0', limit: '10') 
     @remainingresponse << yelp.find_by(term: @selection , location: @location, sort: '0', limit: '5', offset: '10') 
     end
     
     @topfiveresponsearrlength  = @topfiveresponse.length
     @remainingresponsearrlength = @remainingresponse.length
    end 
  

  end

  def update_cities
    @cities = City.where("country_id = ?", params[:country_id])
    respond_to do |format|
      format.js
    end
  end

end
