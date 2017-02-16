# frozen_string_literal: true
require 'spec_helper'

require_relative '../lib/displaydate'

describe Time do
  before(:all) do
    @t = Time.at(1_351_404_000)
  end

  it "shows that it's Saturday today" do
    day = @t.strftime('%A')
    expect(day).to eq 'Saturday'
  end

  it 'shows that the month is October' do
    month = @t.strftime('%B')
    expect(month).to eq 'October'
  end

  it 'shows the date as the 27th' do
    date = @t.strftime('%d')
    expect(date).to eq '27'
  end

  it 'shows the year as 2012' do
    year = @t.strftime('%Y')
    expect(year).to eq '2012'
  end
end

describe DisplayDate do
  before(:all) do
    @epoch = 1_351_404_000
  end

  before(:each) do
    @dd = DisplayDate.new
    @dd.set_epoch(@epoch)
  end

  it 'should display the day as Saturday' do
    day = @dd.get_day('day')
    expect(day).to match(/Saturday/)
  end

  it 'should display the  month as Oct' do
    month = @dd.get_month('month')
    expect(month).to match(/Oct/)
  end
end
