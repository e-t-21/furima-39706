class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name, null:false
      t.integer    :price, null:false
      t.text       :message, null:false
      t.integer    :category_id, null:false
      t.integer    :item_status_id, null:false
      t.integer    :del_price_id, null:false
      t.integer    :perfectue_id, null:false
      t.integer    :del_day_id, null:false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
