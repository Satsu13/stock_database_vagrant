class CreateParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :parameters do |t|

      t.timestamps
    end
  end
end
