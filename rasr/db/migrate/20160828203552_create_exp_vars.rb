class CreateExpVars < ActiveRecord::Migration[5.0]
  def change
    create_table :exp_vars do |t|

      t.timestamps
    end
  end
end
