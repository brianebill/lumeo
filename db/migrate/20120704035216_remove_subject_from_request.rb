class RemoveSubjectFromRequest < ActiveRecord::Migration
  def up
    remove_column :requests, :subject
      end

  def down
    add_column :requests, :subject, :string
  end
end