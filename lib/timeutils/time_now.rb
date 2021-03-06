require 'active_support/time'

module Timeutils
  class TimeNow

    @@my_places = {
      'Bangalore' => 'Asia/Kolkata',
      'Denver' => 'America/Denver',
      'Los Angeles' => 'America/Los_Angeles'
    }

    def self.in(zone='')
      return "#{Time.now.to_s} (Bangalore). Enter a city/TimeZone to get time in that location." if zone.nil? || zone.empty?

      zone = zone.split('/').map { |x| x.downcase.split.map(&:capitalize)*' ' }.join('/')
      time_zone = (@@my_places[zone].nil?)? ActiveSupport::TimeZone[zone] : ActiveSupport::TimeZone[@@my_places[zone]]
      time_zone = ActiveSupport::TimeZone::MAPPING[zone] if time_zone.nil?

      (time_zone.nil?)? default_zones : "#{time_zone.at(Time.now).to_s} (#{zone})"
    end

    private

    def self.default_zones
      'Requested location not found. Please use one of: ' + (
        @@my_places.keys << ActiveSupport::TimeZone::MAPPING.keys.sort << ActiveSupport::TimeZone::MAPPING.values.sort
      ).join(',')
    end

  end
end
