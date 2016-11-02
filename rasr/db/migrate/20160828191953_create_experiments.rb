class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.string :language
      t.boolean :primary
      t.text :configuration

      t.timestamps
    end
  end
end
