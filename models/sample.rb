class Post
  include DataMapper::Resource
  
  property :id,          Serial
  property :title,       String
  property :description, String
end