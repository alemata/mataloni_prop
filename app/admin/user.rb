ActiveAdmin.register User do

  permit_params :username, :email,
                :password, :password_confirmation,
                :building_id

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :building do |b|
      link_to b.building.address, admin_building_path(b.building)
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    attributes_table do
      row :id
      row :username
      row :email
      row "edificio" do
        link_to user.building.address, admin_building_path(user.building)
      end
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.inputs "Building" do
        input :building_id, :as => :select, :collection => Building.all.map {|u| [u.address, u.id]}, :include_blank => false
      end

    end
    f.actions
  end

end
