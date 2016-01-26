require 'spec_helper'
shared_examples_for 'validable' do |number|
  it "raises an error for #{number}" do
    expect { described_class.roman_representation_of number }.
      to raise_error(ArgumentError, /must be a positive integer/)
  end
end

shared_examples_for 'transformable' do |number, roman_numeral|
  it "returns #{roman_numeral} for #{number}" do
    expect(described_class.roman_representation_of number).
      to eq roman_numeral
  end
end

describe RomanNumeral do
  describe '.roman_representation_of' do
    context 'Invalid Argument' do
      context 'Not a number' do
        it_should_behave_like 'validable', 'not a number'
      end

      context 'negative number' do
        it_should_behave_like 'validable', -3
      end

      context 'number is 0' do
        it_should_behave_like 'validable', 0
      end

      context 'to high number' do
        it_should_behave_like 'validable', 10_000
      end
    end

    context 'Valid number' do
      it_should_behave_like 'transformable', 1, 'I'
      it_should_behave_like 'transformable', 2, 'II'
      it_should_behave_like 'transformable', 4, 'IV'
      it_should_behave_like 'transformable', 5, 'V'
      it_should_behave_like 'transformable', 10, 'X'
      it_should_behave_like 'transformable', 12, 'XII'
      it_should_behave_like 'transformable', 24, 'XXIV'
      it_should_behave_like 'transformable', 50, 'L'
      it_should_behave_like 'transformable', 54, 'LIV'
      it_should_behave_like 'transformable', 68, 'LXVIII'
      it_should_behave_like 'transformable', 92, 'XCII'
      it_should_behave_like 'transformable', 103, 'CIII'
      it_should_behave_like 'transformable', 112, 'CXII'
      it_should_behave_like 'transformable', 498, 'CDXCVIII'
      it_should_behave_like 'transformable', 544, 'DXLIV'
      it_should_behave_like 'transformable', 1000, 'M'
      it_should_behave_like 'transformable', 1024, 'MXXIV'
      it_should_behave_like 'transformable', 2094, 'MMXCIV'
      it_should_behave_like 'transformable', 5944, 'MMMMMDMXLIV'
      it_should_behave_like 'transformable', 9999, 'MMMMMMMMMDMXCIX'
    end
  end
end
