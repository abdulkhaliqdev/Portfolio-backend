ActiveAdmin.register Project do
  permit_params :title, :description, :body, :project_type_id, :image, :hashtag

  form do |f|
    project_type = ProjectType.all.map { |site| ["#{site.title}", site.id ]}
    f.semantic_errors *f.object.errors.attribute_names
    f.input :project_type, as: :select ,collection:  project_type
    f.input :title
    f.input :hashtag
    f.input :description
    f.input :body, as: :quill_editor
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    id_column
    column :title
    column :hashtag
    column :description
    column :project_type
    column :image, as: :grid do |product|
      link_to image_tag(product.image, width: 50, height: 50), admin_project_path(product)
    end
    actions
  end

  
  show do
    attributes_table do
      row :hashtag
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
