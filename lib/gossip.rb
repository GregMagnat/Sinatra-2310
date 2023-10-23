class Gossip
  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open('gossip.csv', 'a') do |csv|
      csv << [@author, @content]
    end
  end
end