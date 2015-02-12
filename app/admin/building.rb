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
          column ("mes") do |expense|
            link_to(expense.month_year, admin_expense_path(expense))
          end
          column ("archivo") do |expense|
            link_to 'Archivo', expense.file.url
          end
        end
      end
    end
  end

end
