class AddTargetLossRatioToCompareBook < ActiveRecord::Migration
  def change
  	add_column :compare_books, :target_loss_ratio, :decimal
  end
end
