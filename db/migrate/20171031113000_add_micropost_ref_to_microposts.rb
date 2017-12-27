class AddMicropostRefToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :microposts, :micropost, foreign_key: true
  end
end
