class CreateDnoGroup < ActiveRecord::Migration
  def change
    create_table :dno_groups do |t|
      t.integer "gp_index"
      t.string  "industry_groups"
      t.string  "state_groups"
      t.decimal "min_sales"
      t.decimal "max_sales"
      t.decimal "min_f"
      t.decimal "max_f"
      t.integer "npol"
      t.decimal "gwp_sum"
      t.decimal "pred_loss_sum"
      t.decimal "actual_loss_sum"
      t.decimal "pred_gross_sum"
      t.decimal "actual_gross_sum"
      t.decimal "max_loss"
      t.decimal "actual_rt"
      t.decimal "pred_rt"
      t.decimal "actual_lr"
      t.decimal "pred_lr"
      t.integer "cap_rt_need"
      t.decimal "cap_rate_gwp"
      t.integer "group_code"
    end
  end
end
