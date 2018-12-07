class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :contacts, :title, :subject
  end
end
