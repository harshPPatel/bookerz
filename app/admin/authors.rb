ActiveAdmin.register Author do

  permit_params :first_name, :last_name, :birth_year, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
