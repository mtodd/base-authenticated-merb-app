class Tag
  include DataMapper::Resource
  
  ### Properties
  
  property :id,               Serial
  property :name,             String
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
  ### Associations
  
  has n, :taggings
  has n, :transactions, :through => :taggings
  
end
