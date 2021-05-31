require 'rails_helper'

describe Enroll do
  context 'Validation' do
    it 'valid?' do
      enroll = Enroll.new
      
      enroll.valid?

      expect(enroll.errors[:user]).to include('Não pode ficar em branco')
      expect(enroll.errors[:course]).to include('Não pode ficar em branco')
      expect(enroll.errors[:price]).to include('Não pode ficar em branco')

    end
  end
end