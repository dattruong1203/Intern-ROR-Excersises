require 'bai1'

describe 'Validate input of total number' do
  it 'Right input' do
    ob = MinElementsInArray.new
    input_validate = ob.validatorToTalNumber('12')
    expect(input_validate).to be(true)
  end

  it 'Wrong input' do
    ob = MinElementsInArray.new
    input_validate = ob.validatorToTalNumber('abc')
    expect(input_validate).to be(false)
  end
end

describe 'Validate input of elements' do
  it 'Right input' do
    ob = MinElementsInArray.new
    input_validate = ob.validatorToTalNumber('12')
    expect(input_validate).to be(true)
  end

  it 'Wrong input' do
    ob = MinElementsInArray.new
    input_validate = ob.validatorToTalNumber('abc')
    expect(input_validate).to be(false)
  end
end

