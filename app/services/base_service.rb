# frozen_string_literal: true

require 'dry/monads'
require 'dry/monads/do'

module BaseService
  def self.included(base)
    base.include Dry::Monads[:result]
    base.include Dry::Monads::Do.for(:call)
  end

  def default_failure
    Failure('Coś poszło nie tak. Skontaktuj się z administratorem')
  end
end
