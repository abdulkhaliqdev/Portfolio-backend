ActiveAdmin.register Article do
  permit_params :title, :description, :body, :project_type_id, :main_image

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs
    f.inputs do
      f.input :main_image, as: :file
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :title
      row :description
      row :body
      row :project_type do |category|
        category.title
      end
      row :main_image do |ad|
        image_tag url_for(ad.main_image)
      end
    end
  end  
end
