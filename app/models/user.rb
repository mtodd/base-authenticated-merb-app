class User
  include DataMapper::Resource
  
  property :id,               Serial
  property :login,            String
  property :email,            String
  property :crypted_password, String
  property :salt,             String
  property :login_at,         DateTime
  property :last_login_at,    DateTime
  property :created_at,       DateTime
  property :updated_at,       DateTime
  
end
