class User <ApplicationRecord 
  validates_presence_of :email, :name, :password
  validates :email, :uniqueness => {:case_sensitive => false}
  
  has_secure_password

  has_many :viewing_parties
end 