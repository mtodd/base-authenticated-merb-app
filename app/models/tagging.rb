class Tagging
  include DataMapper::Resource
  
  ### Properties
  
  property :id,               Serial
  property :tag_id,           Integer
  property :transaction_id,   Integer
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
  ### Associations
  
  belongs_to :tag
  belongs_to :transaction
  
end
