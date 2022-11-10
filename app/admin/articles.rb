ActiveAdmin.register Article do
  permit_params :title, :description, :body, :project_type_id, :main_image, image_gallery: []

  form do |f|
    project_type = ProjectType.all.map { |site| ["#{site.title}", site.id ]}
    f.semantic_errors *f.object.errors.attribute_names
    tabs do
      tab 'Advanced', html_options: { class: 'specific_css_class' } do
        f.input :project_type, as: :select ,collection:  project_type
        f.input :hashtag
        f.input :title
        f.input :description
        f.input :body, as: :quill_editor
        f.inputs do
          f.input :main_image, as: :file
        end
        f.inputs do
          f.input :image_gallery, as: :file, input_html: { multiple: true }
        end
      end
    end
    f.actions
  end

  index do
    id_column
    column :hashtag
    column :title
    column :description
    column :project_type
    column :main_image, as: :grid do |img|
      link_to image_tag(img.main_image, width: 50, height: 50), admin_project_path(img)
    end
    column :image_gallery, as: :grid do |gallery|
      gallery.image_gallery.each do |img|
        span do
          image_tag(img, width: 50, height: 50)
        end
      end
    end    
    actions
  end
  
  show do
    attributes_table do
      row :title
      row :hashtag
      row :description
      row :body, as: :quill_editor
      row :project_type do |category|
        category.title
      end
      row :main_image do |ad|
        image_tag(ad.main_image, width: 50, height: 50)
      end
      row 'image_gallery' do |gallery|
        div do
          gallery.image_gallery.each do |img|
            span do
              image_tag(img, width: 50, height: 50)
            end
          end
        end
      end
    end
  end  
end
