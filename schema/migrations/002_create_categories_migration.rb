migration 2, :create_categories  do
  
  up do
    create_table :categories do
      column :id,               Serial
      column :name,             String
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
  
  down do
    drop_table :categories
  end
  
end
