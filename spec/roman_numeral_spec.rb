require 'spec_helper'

describe RomanNumeral do
  describe '.roman_representation_of' do
    context 'Invalid Argument' do
      context 'Not a number' do
        it 'returns a warning message' do
          expect { described_class.roman_representation_of('not a number') }.
            to raise_error(ArgumentError,/must be.*integer/)
        end
      end

      context 'Negative number' do
        it 'returns a warning message' do
          expect { described_class.roman_representation_of(-3) }.
            to raise_error(ArgumentError, /must be a positive integer/)
        end
      end

      context 'Number is 0' do
        it 'returns a warning message' do
          expect { described_class.roman_representation_of(-3) }.
            to raise_error(ArgumentError, /must be a positive integer/)
        end
      end

      context 'Number is higher than 10_000' do
        it 'returns a warning message' do
          expect { described_class.roman_representation_of(10_000) }.
            to raise_error(ArgumentError, /must be.*lower than 10 000/)
        end
      end
    end

    context 'Valid number' do
      it 'returns roman representation of an integer' do
        expect(described_class.roman_representation_of(1)).to eq('I')
        expect(described_class.roman_representation_of(2)).to eq('II')
        expect(described_class.roman_representation_of(4)).to eq('IV')
        expect(described_class.roman_representation_of(5)).to eq('V')
        expect(described_class.roman_representation_of(10)).to eq('X')
        expect(described_class.roman_representation_of(12)).to eq('XII')
        expect(described_class.roman_representation_of(24)).to eq('XXIV')
        expect(described_class.roman_representation_of(50)).to eq('L')
        expect(described_class.roman_representation_of(54)).to eq('LIV')
        expect(described_class.roman_representation_of(68)).to eq('LXVIII')
        expect(described_class.roman_representation_of(92)).to eq('XCII')
        expect(described_class.roman_representation_of(103)).to eq('CIII')
        expect(described_class.roman_representation_of(112)).to eq('CXII')
        expect(described_class.roman_representation_of(498)).to eq('CDXCVIII')
        expect(described_class.roman_representation_of(544)).to eq('DXLIV')
        expect(described_class.roman_representation_of(1000)).to eq('M')
        expect(described_class.roman_representation_of(1024)).to eq('MXXIV')
        expect(described_class.roman_representation_of(2094)).to eq('MMXCIV')
        expect(described_class.roman_representation_of(5944)).to eq('MMMMMDMXLIV')
        expect(described_class.roman_representation_of(9999)).to eq('MMMMMMMMMDMXCIX')
      end
    end
  end
end
