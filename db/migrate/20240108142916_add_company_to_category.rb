class AddCompanyToCategory < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :company, null: false, foreign_key: true
  end
end
