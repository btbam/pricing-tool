class AddDateToCompanyInfo < ActiveRecord::Migration
  def change
  	add_column :company_infos, :as_of_date, :datetime
  	add_index :company_infos, :as_of_date
  	# alter table company_infos drop column as_of_date;
  	# alter table company_infos add column as_of_date TIMESTAMP;
  	# alter table company_infos alter column as_of_date set default DATE('2014-01-01');
  	# alter table company_infos add index as_of_date
  	# create index as_of_date_idx on company_infos (as_of_date);
  end
end
