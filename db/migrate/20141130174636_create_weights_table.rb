class CreateWeightsTable < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.string :content
      t.references :post
      t.references :user
      t.boolean :pro, default: true

      t.timestamps
    end
  end
end
