class Tweet
  def initialize
    # Initialize Twitter client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = "8bjWH42McFaNRHSrLPy0bg"
      config.consumer_secret = "2XFWbNHYPCTap9SzdofTZ6aYrZbtKpww5SwGfssnk"
      config.access_token = "502408944-wmFdoRgBmYaFWnPRwsiJZ4ovZhwMr2JcvtYtCrz6"
      config.access_token_secret = "4MszwiSbaEiyYehdcitXg35Nl5ymUUfcXtERancw"
    end
  end
      
  def send( msg )
    @client.update( msg.squeeze(' ') )
  end
end
