xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title  @section.meeting_days + " " + @section.course.title + " Assignments for " + " " xxx@xxx.xxx
    xxx@xxx.xxx
    xml.link xxx@xxx.xxx

    for a xxx@xxx.xxx
      xml.item do
        xml.title a.title + " :: " + a.lab.title
        xml.description truncate( a.lab.instructions, 300 )
        xml.pubDate a.created_at.to_s(:rfc822)
        xml.link xxx@xxx.xxx
      end
    end
  end
end
