class CasinoUser < ActiveRecord::Base
  has_many :casino_user_clients
  has_many :clients, through: :casino_user_clients

  before_validation :unmask_fields

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
