migration 3, :create_accounts  do
  
  up do
    create_table :accounts do
      column :id,               Serial
      column :user_id,          Integer
      column :name,             String
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
  
  down do
    drop_table :accounts
  end
  
end
