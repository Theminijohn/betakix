class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
