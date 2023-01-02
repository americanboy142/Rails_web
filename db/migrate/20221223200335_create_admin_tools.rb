class CreateAdminTools < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_tools do |t|

      t.timestamps
    end
  end
end
