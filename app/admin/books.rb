ActiveAdmin.register Book do
  permit_params :name, :description, :book_category_id, :author_id, :store_id, :image, :price

  form do |f|
      f.semantic_errors
      f.inputs
      f.inputs do
        f.input :image, as: :file
      end
      f.actions
    end
end
