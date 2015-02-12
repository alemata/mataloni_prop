ActiveAdmin.register Building do

  permit_params :address

  show do
    attributes_table do
      row :id
      row "direccion" do
        building.address
      end
      panel "Expensas" do
        table_for building.expenses do
          column (:for_month) do |expense| 
            link_to(expense.month_year, admin_expense_path(expense))
          end
        end
      end
    end
  end

end
