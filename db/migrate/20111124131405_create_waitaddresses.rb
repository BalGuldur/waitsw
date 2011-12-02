class CreateWaitaddresses < ActiveRecord::Migration
  def change
    create_table :waitaddresses do |t|
      t.string :ipaddress
      t.string :address
      t.string :descr
      t.string :status
      t.string :creator

      t.timestamps
    end
  end
end
