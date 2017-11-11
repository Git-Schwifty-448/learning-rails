class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page])
      @posts = current_user.microposts
    end

    @feed = Micropost.paginate(page: params[:page], :per_page => 7)
    
    #  Make sure to only collect 3 records using whatever method!
    @community_listings = []
    @community_names = []
    for id in 2..4
      @community_names.append(Community.where(id: id).select(:title, :id))
      @community_listings.push(Micropost.where(community_id: id).limit(3))
    end

    @communities = Community.all.limit(7)
    @playlists = Playlist.all.limit(7)

  end

  def help
  end

  def about
  end
end
