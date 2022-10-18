ActiveAdmin.register User do
  permit_params :email, :about_me, :first_name, :last_name, 
                :medium_profile_url, :linkedin_profile_url, :twitter_profile_url, 
                :prime_image, :secondary_image, :third_image
  
  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.input :first_name
    f.input :last_name
    f.input :email
    f.input :about_me, as: :quill_editor
    f.input :linkedin_profile_url
    f.input :medium_profile_url
    f.input :twitter_profile_url
    f.inputs do
      f.input :prime_image, as: :file
    end
    f.inputs do
      f.input :secondary_image, as: :file
    end
    f.inputs do
      f.input :third_image, as: :file
    end
    f.actions
  end

  controller do
    def create
      @user = User.new(user_params)
      if @user.save! 
        redirect_to admin_users_path
      else
        render :new
      end
    end
  
    private

    def user_params
      params.required(:user).permit(:email, :about_me, :first_name, :last_name, 
                                      :medium_profile_url, :linkedin_profile_url, :twitter_profile_url, 
                                      :prime_image, :secondary_image, :third_image)
    end
  end

  index do
    id_column
    column :first_name
    column :last_name
    column :about_me
    column :image, as: :grid do |obj|
      link_to image_tag(obj.prime_image, width: 50, height: 50), admin_user_path(obj)
    end
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :about_me
      row :medium_profile_url
      row :linkedin_profile_url
      row :twitter_profile_url
      row :image do |obj|
        image_tag url_for(obj.prime_image)
      end
      row :image do |obj|
        image_tag url_for(obj.secondary_image)
      end
      row :image do |obj|
        image_tag url_for(obj.third_image)
      end
    end
  end 
end
