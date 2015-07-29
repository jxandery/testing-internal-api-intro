class CreatePoptars < ActiveRecord::Migration
  def change
    create_table :poptars do |t|
      t.string :flavor
      t.string :sprinkles
    end
  end
end
