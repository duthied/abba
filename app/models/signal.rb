module Abba
  class Signal
    include MongoMapper::Document

    key :name, String

    validates_presence_of :name

    # belongs_to :signal

    timestamps!

    scope :for_period, lambda {|start_at, end_at|
      where(:created_at => {:$gt => start_at, :$lt => end_at})
    }

    def signal=(name)
      self.name = signal.name
      self
    end

  end
end