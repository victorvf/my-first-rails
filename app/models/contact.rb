class Contact < ActiveRecord::Base
  belongs_to :kind

  #tem um endereço/ tem que ser no singular
  has_one :address

  #tem varias telefones
  has_many :phones

  #dando permissão para kinds
  accepts_nested_attributes_for :address
  #como vai ser dinamico, tem mais esses parametros, reject => caso nao escreva nada, ele nao aceita e allow => possa destruir
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  #validação do nome, no caso ele só é um contato valido, se tiver o nome pelo menos
  validates :name, presence: true, length: {minimum: 3}
  validates :email, presence: true
end
