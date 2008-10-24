migration 5, :create_categorizations  do
  
  up do
    create_table :categorizations do
      column :id,               Serial
      column :category_id,      Integer
      column :transaction_id,   Integer
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
  
  down do
    drop_table :categorizations
  end
  
end
