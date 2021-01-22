class Contact < ApplicationRecord
  belongs_to :kind, optional: true

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
