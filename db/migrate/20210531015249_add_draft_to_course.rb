class AddDraftToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :draft, :boolean
  end
end
