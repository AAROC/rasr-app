class CreateFutureGateways < ActiveRecord::Migration[5.0]
  def change
    create_table :future_gateways do |t|

      t.timestamps
    end
  end
end
