ActiveAdmin.register Expense do

  permit_params :for_month, :building_id, :file

  index do
    id_column
    column :for_month do |expense|
      expense.month_year
    end
    column :building do |expense|
      link_to expense.building.address, admin_building_path(expense.building)
    end
    actions
  end

  show do
    attributes_table do
      row "mes" do
        expense.month_year
      end
      row "edificio" do
        link_to expense.building.address, admin_building_path(expense.building)
      end
      row "Archivo" do
        link_to 'Archivo', expense.file.url
      end
      # row "Prev" do
        # image_tag(expense.file_url)
      # end
    end
  end

  form(:html => { :multipart => true }) do |f|
    inputs 'Mes', :for_month
    f.inputs "Building" do
      input :building_id, :as => :select,
            :collection => Building.all.map {|u| [u.address, u.id]}, :include_blank => false
    end
    f.input :file, :as => :file

    actions
  end

end
