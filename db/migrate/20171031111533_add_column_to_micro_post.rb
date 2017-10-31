class AddColumnToMicroPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :micropost, foreign_key: true
  end
end
