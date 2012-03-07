class GeneralContact < ActiveRecord::Base
  attr_accessible :return_email, :subject, :body, :attachment
  
  validates_presence_of :return_email
  validates_format_of :return_email, :with => /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))$/, :message => 'must be in the form: xxx@xxx.xxx
  
  validates_presence_of :subject
  validates_presence_of :body
  
  has_attached_file :attachment,
                    :path => ":rails_root/uploads/:class/:id/:attachment/:basename.:extension",
                    :url => ":class/download/:id",
                    :default_url => ''
                    
  def send_email
    # AdminMailer.general_contact( self ).deliver
    AdminMailer.delay.general_contact( self )
  end
end
