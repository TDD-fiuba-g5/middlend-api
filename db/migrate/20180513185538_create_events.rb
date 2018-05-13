class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    	t.string :event_type
    	t.integer :ticket_id
      t.timestamps
    end
  end
end
