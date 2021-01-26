class Contact < ApplicationRecord

  # Associates
  belongs_to :kind, optional: true
  has_many :phones

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  def to_br
    {
      name: self.name,
      email: self.email,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
      created_at: self.created_at,
      updated_at: self.updated_at,
      kind_id: self.kind_id,
    }
  end

  # def author
  #   "Barretin"
  # end

  # # criando um metodo o json nao fica encadeado
  # # com o include ele fica encadeado
  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options = {})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author],

  #     include: {
  #       kind: {
  #         only: [:description, :created_at]
  #       }
  #     }
  #   )
  # end
end
