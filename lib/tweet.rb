class Tweet
  def initialize
    # Initialize Twitter client
  xxx@xxx.xxx ||= Twitter::Client.new
  end
      
  def send( msg )
   xxx@xxx.xxx msg.gsub(/\s+/, " ") )
  end
end
