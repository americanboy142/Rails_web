class ChangeUserPrefSex < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :pref_sex, default: 4
  end
end
