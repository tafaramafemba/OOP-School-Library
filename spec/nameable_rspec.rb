require '../nameable'

describe Nameable do
  context 'Throws NotImplementedError when calling the base correct_name method of Nameable' do
    it 'Throws a NotImplementedError' do
      expect { Nameable.new.correct_name }.to raise_error(NotImplementedError)
    end

    it 'Checks that the class is the correct instance' do
      expect(Nameable.new).to be_instance_of Nameable
    end
  end
end