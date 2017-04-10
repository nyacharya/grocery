class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :status
      t.string :payment
      t.timestamps
    end
  end
end
