migration 4, :create_transactions  do
  
  up do
    create_table :transactions do
      column :id,               Serial
      column :account_id,       Integer
      column :name,             String
      column :type,             Discriminator
      column :amount,           Integer
      column :period,           Enum[:daily, :weekly, :biweekly, :semimonthly, :monthly, :quarterly, :yearly]
      column :period_start,     DateTime
      column :period_end,       DateTime
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
  
  down do
    drop_table :transactions
  end
  
end
