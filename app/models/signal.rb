module Abba
  class Signal
    include MongoMapper::Document

    key :name

    validates_presence_of :name

    timestamps!

    scope :for_period, lambda {|start_at, end_at|
      where(:created_at => {:$gt => start_at, :$lt => end_at})
    }

    def signal=(signal)
      self.name = signal.name
      self
    end

  end
end