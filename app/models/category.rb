class Category
  include DataMapper::Resource
  
  ### Properties
  
  property :id,               Serial
  property :name,             String
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
  ### Associations
  
  has n, :categorizations
  has n, :transactions, :through => :categorizations
  
end
