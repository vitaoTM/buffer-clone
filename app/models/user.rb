# email: string
# password_digest:string

class User < ApplicationRecord
  has_secure_password
end
