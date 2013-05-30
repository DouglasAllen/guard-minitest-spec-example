require 'spec_helper'

describe Consultation do
  before do
    @consultation = Consultation.new(
      start_day: 1, start_hour: 16,
      end_day:   2, end_hour:   10
    )
  end

  it 'returns an array with values' do
    assert @consultation.debitable.is_a? Array
    assert @consultation.debitable.size > 0
  end

  it 'debits no more than 8 hours a day' do
    assert @consultation.debitable.max <= 8
  end

  it 'debits 1 and 2 hours' do
    assert_equal @consultation.debitable, [1, 2]
  end
end

describe Consultation do
  before do
    @consultation = Consultation.new(
      start_day: 1, start_hour:  9,
      end_day:   2, end_hour:   15
    )
  end

  it 'debits 8 and 7 hours' do
    assert_equal @consultation.debitable, [8, 7]
  end
end

describe Consultation do
  before do
    @consultation = Consultation.new(
      start_day: 1, start_hour:  9,
      end_day:   5, end_hour:   15
    )
  end

  it 'debits [8, 7] hours' do
    assert_equal @consultation.debitable, [8, 8, 8, 8, 7]
  end
end

describe Consultation do
  before do
    @consultation = Consultation.new(
      start_day: 2, start_hour: 14,
      end_day:   4, end_hour:   12
    )
  end

  it 'debits [3, 8, 4] hours' do
    assert_equal @consultation.debitable, [3, 8, 4]
  end
end
