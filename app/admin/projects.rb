ActiveAdmin.register Project do
  permit_params :title, :description, :body, :project_type_id, :image

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end

  controller do
    def create
      @project = Project.new(project_params)
      if @project.save! 
        redirect_to admin_projects_path
      else
        render :new
      end
    end
  
    private

    def project_params
      params.required(:project).permit(:title, :description, :body, :project_type_id, :image)
    end
  end
  
  show do
    attributes_table do
      row :title
      row :description
      row :body
      row :project_type do |category|
        category.title
      end
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end 
end
