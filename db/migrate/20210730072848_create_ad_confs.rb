class CreateAdConfs < ActiveRecord::Migration[6.0]
  def change
    create_table :ad_confs do |t|
      t.string :ad_code
      t.integer :component
      t.integer :platform
      t.string :country_code
      t.integer :partner_id

      t.timestamps
    end
  end
end
