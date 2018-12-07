class AddSubjectToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :subject, :string
  end
end
