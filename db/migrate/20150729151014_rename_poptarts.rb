class RenamePoptarts < ActiveRecord::Migration
  def change
    rename_table :poptars, :poptarts
  end
end
