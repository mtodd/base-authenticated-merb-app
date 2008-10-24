migration 6, :create_tags  do
  
  up do
    create_table :tags do
      column :id,               Serial
      column :name,             String
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
  
  down do
    drop_table :tags
  end
  
end
