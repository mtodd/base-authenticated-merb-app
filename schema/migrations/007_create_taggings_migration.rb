migration 7, :create_taggings  do
  
  up do
    create_table :taggings do
      column :id,               Serial
      column :tag_id,           Integer
      column :transaction_id,   Integer
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
  
  down do
    drop_table :taggings
  end
  
end
