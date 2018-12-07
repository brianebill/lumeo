class AddSubjectToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :subject, :string
    add_column :questions, :subject, :string
  end
end
