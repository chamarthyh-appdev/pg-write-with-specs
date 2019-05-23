class PicturesController < ApplicationController
  def recent
    @photos = Photo.all.order({ :created_at => :desc }).limit(25)

    render("pic_templates/time_list.html.erb")
  end

  def most_liked
    @photos = Photo.all.order({ :likes_count => :desc }).limit(25)

    render("pic_templates/liked_list.html.erb")
  end

  def show_details
    photo_id = params.fetch("some_id")

    @pic = Photo.where({ :id => photo_id }).at(0)

    render("pic_templates/details.html.erb")
  end
  
    def bbyyyyeeee
    pic_id = params.fetch("id_to_remove")
    photo = Photo.where({ :id => pic_id}).at(0)
    photo.destroy
    redirect_to("/popular")
  end 
  
  def add_photo
    @list_of_users = User.all.order({ :username => :asc})
    render("pic_templates/new_photo.html.erb")
  end 
  
  def save_new_row
     new_row = Photo.new
     new_row.caption = params.fetch("pic_caption")
     new_row.image = params.fetch("pic_image_url")
     new_row.owner_id = params.fetch("poster_id")
     
     new_row.save
     redirect_to("/recent")
  end 
  
  def edit_photo
    pic_id = params.fetch("photo_id")
    @picture = Photo.where({:id => pic_id}).at(0)
    render("pic_templates/existing_photo_form.html.erb")
  end 
  
  def save_old_row
    
    redirect_to("/photos/" + params.fetch("photo_id"))
  end
  
end
