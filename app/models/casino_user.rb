class CasinoUser < ActiveRecord::Base
  before_validation :unmask_fields

  validates :authenticator, presence: true
  validates :username, presence: true, length: { in: 5..40 }, uniqueness: true
  validates :name, presence: true, length: { in: 4..200 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :document, presence: true, cpf: true
  validates :telephone, presence: true, length: { in: 10..11 }

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end


  private


  def unmask_fields
    self.document = CnpjCpf.new(self.document).unmasked
    self.telephone = Telephone.new(self.telephone).unmasked
  end
end
