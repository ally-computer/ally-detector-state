require 'ally/detector'
require 'ally/detector/state/version'

module Ally
  module Detector
    class State
      include Ally::Detector

      def initialize(inquiry = nil)
        super # do not delete
        @states = [
          { state: 'Alabama', abbr: 'AL' },
          { state: 'Alaska', abbr: 'AK' },
          { state: 'Arizona', abbr: 'AZ' },
          { state: 'Arkansas', abbr: 'AR' },
          { state: 'California', abbr: 'CA' },
          { state: 'Colorado', abbr: 'CO' },
          { state: 'Connecticut', abbr: 'CT' },
          { state: 'Delaware', abbr: 'DE' },
          { state: 'Florida', abbr: 'FL' },
          { state: 'Georgia', abbr: 'GA' },
          { state: 'Hawaii', abbr: 'HI' },
          { state: 'Idaho', abbr: 'ID' },
          { state: 'Illinois', abbr: 'IL' },
          { state: 'Indiana', abbr: 'IN' },
          { state: 'Iowa', abbr: 'IA' },
          { state: 'Kansas', abbr: 'KS' },
          { state: 'Kentucky', abbr: 'KY' },
          { state: 'Louisiana', abbr: 'LA' },
          { state: 'Maine', abbr: 'ME' },
          { state: 'Maryland', abbr: 'MD' },
          { state: 'Massachusetts', abbr: 'MA' },
          { state: 'Michigan', abbr: 'MI' },
          { state: 'Minnesota', abbr: 'MN' },
          { state: 'Mississippi', abbr: 'MS' },
          { state: 'Missouri', abbr: 'MO' },
          { state: 'Montana', abbr: 'MT' },
          { state: 'Nebraska', abbr: 'NE' },
          { state: 'Nevada', abbr: 'NV' },
          { state: 'New Hampshire', abbr: 'NH' },
          { state: 'New Jersey', abbr: 'NJ' },
          { state: 'New Mexico', abbr: 'NM' },
          { state: 'New York', abbr: 'NY' },
          { state: 'North Carolina', abbr: 'NC' },
          { state: 'North Dakota', abbr: 'ND' },
          { state: 'Ohio', abbr: 'OH' },
          { state: 'Oklahoma', abbr: 'OK' },
          { state: 'Oregon', abbr: 'OR' },
          { state: 'Pennsylvania', abbr: 'PA' },
          { state: 'Rhode Island', abbr: 'RI' },
          { state: 'South Carolina', abbr: 'SC' },
          { state: 'South Dakota', abbr: 'SD' },
          { state: 'Tennessee', abbr: 'TN' },
          { state: 'Texas', abbr: 'TX' },
          { state: 'Utah', abbr: 'UT' },
          { state: 'Vermont', abbr: 'VT' },
          { state: 'Virginia', abbr: 'VA' },
          { state: 'Washington', abbr: 'WA' },
          { state: 'West Virginia', abbr: 'WV' },
          { state: 'Wisconsin', abbr: 'WI' },
          { state: 'Wyoming', abbr: 'WY' }
        ]
      end

      def detect
        @datapoints = []
        @states.each do |state|
          @datapoints << state[:state] if @inquiry.raw =~ /(\W|^)#{state[:state]}(\W|$)/i ||
            # case sensitive on abbrs because of common words like 'oh' and 'in' (false positives)
            @inquiry.raw =~ /(\W|^)#{state[:abbr]}(\W|$)/
        end
        if @datapoints.length == 0
          nil
        else
          @data_detected = true
          @datapoints
        end
      end
    end
  end
end

class Array
  def contain?(other)
    (self & other) == other
  end
end
