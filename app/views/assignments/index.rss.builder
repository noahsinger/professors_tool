xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title  @section.meeting_days + " " + @section.course.title + " Assignments for " + " " + @semester.name
    xml.description @section.meeting_days_and_times
    xml.link semester_section_assignments_url(@semester,@section)

    for a in @assignments
      xml.item do
        xml.title a.title + " :: " + a.lab.title
        xml.description truncate( a.lab.instructions, :length => 300 )
        xml.pubDate a.created_at.to_s(:rfc822)
        xml.link semester_section_assignment_url(@semester,@section,a)
      end
    end
  end
end
