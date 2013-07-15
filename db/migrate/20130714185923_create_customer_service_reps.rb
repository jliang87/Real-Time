class CreateCustomerServiceReps < ActiveRecord::Migration
  def change
    create_table :customer_service_reps do |t|

      t.timestamps
    end
  end
end
