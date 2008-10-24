class Account
  include DataMapper::Resource
  
  ### Properties
  
  property :id,               Serial
  property :user_id,          Integer
  property :name,             String
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
  ### Associations
  
  belongs_to :user
  has n, :transactions
  
end
