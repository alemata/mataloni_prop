ActiveAdmin.register Expense do

  permit_params :for_month, :building_id

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
    end
  end

  form do |f|
    inputs 'Mes', :for_month
    f.inputs "Building" do
      input :building_id, :as => :select,
            :collection => Building.all.map {|u| [u.address, u.id]}, :include_blank => false
    end

    actions
  end

end
