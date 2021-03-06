class GeneralContact < ApplicationRecord
  validates_presence_of :return_email
  validates_format_of :return_email, with: /\A[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))\z/, message: 'must be in the form: yourname@domainname.com'
  
  validates_presence_of :subject
  validates_presence_of :body
  
  has_attached_file :attachment,
                    path: ":rails_root/uploads/:class/:id/:attachment/:basename.:extension",
                    url: ":class/download/:id",
                    default_url: ''
                    
  do_not_validate_attachment_file_type :attachment
                    
  def send_email
    AdminMailer.general_contact(self).deliver_later
  end
end
