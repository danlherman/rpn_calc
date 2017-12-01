require 'spec_helper'
require_relative '../bin/rpn_calc'

describe '#rpn_calc normal operations' do
  it 'should add 5, 8, 9 to equal 22' do
    calc = RPNCalc.new
    calc.stack = [5, 8, 9, '+']
    calc.calculate
    expect(calc.result).to eq 22
  end

  it 'should subtract 21, 4 , 8 to equal 9' do
    calc = RPNCalc.new
    calc.stack = [21, 4, 8, '-']
    calc.calculate
    expect(calc.result).to eq 9
  end

  it 'should multiply 9, 9 to equal 81' do
    calc = RPNCalc.new
    calc.stack = [9, 9, '*']
    calc.calculate
    expect(calc.result).to eq 81
  end

  it 'should divide 100, 4 to equal 25' do
    calc = RPNCalc.new
    calc.stack = [100, 4, '/']
    calc.calculate
    expect(calc.result).to eq 25
  end
end

describe '#rpn_calc abnormal operations' do
  it 'should handle bad input when multiplying 9, 9 to equal 81' do
    calc = RPNCalc.new
    calc.stack = [9, 'dfds', 'd8dsjds', 9, '*']
    calc.calculate
    expect(calc.result).to eq 81
  end

  it 'should handle when operators are entered before numbers' do
    calc = RPNCalc.new
    calc.stack = ['+', 9, 9]
    calc.calculate
    expect(calc.result).to eq nil
  end
end
