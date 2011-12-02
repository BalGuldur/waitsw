class DelCreatorInsUserIdInWaitadd < ActiveRecord::Migration
  def up
    change_table :waitaddresses do |t|
      t.remove :creator
      t.integer :user_id
    end
  end

  def down
    change_table :waitaddresses do |t|
      t.remove :user_id
      t.string :creator
    end
  end
end
