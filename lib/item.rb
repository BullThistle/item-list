require 'pry'

class Item
  @@list = []
  attr_reader :id
  attr_accessor :name, :ranking
  def initialize(name, ranking)
    @name = name
    @ranking = ranking
    @id = @@list.length + 1
  end

  def self.all
    @@list
  end

  def save
    @@list.push(self)
  end

  def self.clear
    @@list = []
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item .id == item_id
        return item
      end
    end
  end

  def self.sort_list
    binding.pry
    @@list.sort_by {|item| item.ranking}
  end
end
