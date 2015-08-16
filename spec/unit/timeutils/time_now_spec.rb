require 'spec_helper'
require 'timecop'
require 'timeutils/time_now'

module Timeutils

  describe TimeNow do
    before do
      Timecop.freeze(Time.local(2015, 8, 15, 12, 0, 0))
    end

    after do
      Timecop.return
    end

    it 'calculates time in a timezone' do
      expect(Timeutils::TimeNow.in('Europe/Rome')).to eq('2015-08-15 08:30:00 +0200')
    end

    it 'calculates time in custom places' do
      expect(Timeutils::TimeNow.in('Bangalore')).to eq('2015-08-15 12:00:00 +0530')
    end

    it 'calculates time in cities' do
      expect(Timeutils::TimeNow.in('Melbourne')).to eq('2015-08-15 16:30:00 +1000')
    end

    it 'can deal with lowercase' do
      expect(Timeutils::TimeNow.in('beijing')).to eq('2015-08-15 14:30:00 +0800')
    end

    it 'can deal with uppercase' do
      expect(Timeutils::TimeNow.in('RIYADH')).to eq('2015-08-15 09:30:00 +0300')
    end

    it 'can deal with mixed case' do
      expect(Timeutils::TimeNow.in('LOnDOn')).to eq('2015-08-15 07:30:00 +0100')
    end

    it 'can deal with spaces in the zone' do
      expect(Timeutils::TimeNow.in('new delhi')).to eq('2015-08-15 12:00:00 +0530')
    end

    it 'can deal with places that have a period in the zone' do
      expect(Timeutils::TimeNow.in('St. Petersburg')).to eq('2015-08-15 09:30:00 +0300')
    end

    # it 'can deal with places that have an underscore in the zone' do
    #   expect(Timeutils::TimeNow.in('America/Los_Angeles')).to eq('2015-08-15 12:00:00 +0530')
    # end

  end
end