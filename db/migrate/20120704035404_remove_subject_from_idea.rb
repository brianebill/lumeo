class RemoveSubjectFromIdea < ActiveRecord::Migration
  def up
    remove_column :ideas, :subject
      end

  def down
    add_column :ideas, :subject, :string
  end
end
