class ItinerariesController < ApplicationController
before_action :find_itinerary, only: [:show, :edit, :update, :destroy, :upvote]
before_action :authenticate_user!, except: [:index, :show]

	def index
		@itineraries = Itinerary.all.order("created_at DESC")

	end


def myindex
    @itineraries = Itinerary.where("user_id = " + current_user.id.to_s )
end

	def show
   # @Sites = ItinerarySite.where(Itinerary = @itinerary)
       if user_signed_in?

         @loggedin = current_user.id
         @owner = Itinerary.find(@itinerary.id).user_id

       end

  
   @sites = ItinerarySite.where("itinerary_id = " + @itinerary.id.to_s)
   sitelen = @sites.length

	 @sitesarray = []
  
   for i in 0..sitelen-1

    @sitesarray << @sites[i].sitedetails
   end

  @input = @sitesarray


  @hash = Gmaps4rails.build_markers(@input) do |site, marker|
    output = site.scan(/"([^"]*)"/)
    marker.lat output[1][0]
    marker.lng output[2][0]
    marker.infowindow output[0][0]
  end 

	end


	def new
    @countries = Country.all
    @cities = City.all
		@itinerary = current_user.itineraries.build
   @itinerary = Itinerary.new

   
	end

	def create
    @countries = Country.all
    @cities = City.all

		@itinerary = current_user.itineraries.build(itinerary_params)
  
		if @itinerary.save
			#redirect_to @itinerary, notice: "Successfully created new itinerary
      redirect_to searchsite_path(@itinerary), notice: "Successfully created new itinerary"
    		else
			render 'new'
		end
	end

  def edit
 


   @sites = ItinerarySite.where("itinerary_id = " + @itinerary.id.to_s)
   sitelen = @sites.length

   @sitesarray = []
   @siteidarray = []
   for i in 0..sitelen-1
    @siteidarray << @sites[i].id
    @sitesarray << @sites[i].sitedetails
   end

  @input = @sitesarray
  	
  end
  
  def update
  	if @itinerary.update(itinerary_params)
  	  redirect_to @itinerary, notice: "Itinerary was Successfully updated"
  	else	
  		render 'edit'
  	end
  end

  def destroy
  	@itinerary.destroy
  	redirect_to root_path
  end 

  def upvote
  	@itinerary.upvote_by current_user
  	redirect_to :back
  	
  end

  def addsite

  @itinerary_id = params[:itinerary_id]

  sitedetails = []
  name = params[:name] 
  sitedetails.push(name)
  lat =  params[:latitude] 
  sitedetails.push(lat) 
  long =  params[:longitude]  
  sitedetails.push(long)
  img =  params[:image_url]
  sitedetails.push(img) 
  url =  params[:url]
  sitedetails.push(url) 
  @src = params[:src]


  @ItinerarySite = ItinerarySite.new(:itinerary_id => @itinerary_id, :sitedetails => sitedetails.to_s)

  if @ItinerarySite.save
  redirect_to itineraryshow_path(:id => @itinerary_id, :src => @src), notice: "Successfully added new site"
  else
    render 'addsite'
  end

  end


 def deletesite
  @itinerary_id = params[:itinerary_id]
  @sitename = params[:sitename]
  @itinerarysite_id = params[:itinerarysite_id]
  #ItinerarySite.where("itinerary_id = 42 and sitedetails LIKE '%Sainte-Chapelle%' ")
  #@targetdelete = ItinerarySite.where("itinerary_id = " + @itinerary_id.to_s + " and sitedetails LIKE '%" + @sitename.to_s + "%'" )
 
  ItinerarySite.destroy(@itinerarysite_id)
  redirect_to itineraryshow_path(:id => @itinerary_id ), notice: "Successfully deleted site"
  
  end 


 private

 def itinerary_params
 	params.require(:itinerary).permit(:name, :description, :image)
 end

 def find_itinerary
 	 @itinerary = Itinerary.find(params[:id])
   
 end


end
