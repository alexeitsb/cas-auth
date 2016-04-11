class CASinoUser < ActiveRecord::Base
  has_many :casino_user_clients
  has_many :clients, through: :casino_user_clients
  has_attached_file :avatar, styles: { s_32: "32x32", s_100: "100x100", s_400: "400x400" }, default_url: "avatar/:style/missing.png"

  before_validation :unmask_fields

  validates :username, presence: true, length: { in: 5..40 }, uniqueness: true
  validates :name, presence: true, length: { in: 5..200 }
  validates :document, presence: true, cpf: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  scope :create_password, -> { where("encrypted_password = ?", "") }

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
