class Categorization
  include DataMapper::Resource
  
  ### Properties
  
  property :id,               Serial
  property :category_id,      Integer
  property :transaction_id,   Integer
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
  ### Associations
  
  belongs_to :category
  belongs_to :transaction
  
end
