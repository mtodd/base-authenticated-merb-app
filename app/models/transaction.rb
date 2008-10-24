class Transaction
  include DataMapper::Resource
  
  ### Properties
  
  property :id,               Serial
  property :account_id,       Integer
  property :name,             String
  property :type,             Discriminator
  property :amount,           Integer
  property :period,           Enum[:daily, :weekly, :biweekly, :semimonthly, :monthly, :quarterly, :yearly]
  property :period_start,     DateTime
  property :period_end,       DateTime
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
  ### Associations
  
  belongs_to :account
  
end
