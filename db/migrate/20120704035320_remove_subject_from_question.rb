class RemoveSubjectFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :subject
      end

  def down
    add_column :questions, :subject, :string
  end
end
