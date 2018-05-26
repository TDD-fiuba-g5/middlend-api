class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
    	t.string :name
    	t.string :rule
    	t.string :status
    	t.string :value
      t.timestamps
    end
  end
end
