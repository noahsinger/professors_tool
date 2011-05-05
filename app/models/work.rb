class Work < ActiveRecord::Base
  require 'digest/sha2'
  
  belongs_to :assignment
  belongs_to :enrollment
  has_many :awarded_points, :dependent => :destroy
  
  has_attached_file :upload,
                    :path => ":rails_root/uploads/:class/:id/:attachment/:basename.:extension",
                    :url => "/admin/:class/download/:id",
                    :default_url => ''
                    
  validates_format_of( :email, 
                       :with => xxx@xxx.xxx 
                       :on => :create, 
                       :message=>"has an invalid format.")

  after_create :generate_withdrawal_code
    
  def validate 
    errors.add :upload, "must be present" if self.assignment.lab.allow_uploads and self.upload_file_name.blank?
  end
  
  def generate_withdrawal_code
    self.withdrawal_code = Digest::SHA256.hexdigest(self.assignment.title+self.assignment.lab.title+self.id.to_s)
    self.save
  end
  
  def graded?
    graded = false    

    if self.awarded_points.size > 0
      graded = true
    end
    
    graded
  end

  def score
    total = 0;
    self.awarded_points.each do |p|
      total += p.points
    end
    
    total
  end
  
  def percentage
    earned = self.score
    possible = 0
    self.assignment.lab.requirements.each do |r|
      possible += r.points
    end
    
    (earned / possible.to_f)*100
  end
  
  def send_submitted_email submitting_address
    email = Mailer::create_work_submitted( self, submitting_address )
    # Mailer.deliver( email )
    Mailer.send_later :deliver, email
  end
  
  def send_reminder_email # submitting_address
    # email = Mailer::create_work_reminder( self, submitting_address )
    email = Mailer::create_work_reminder( self )
    # Mailer.deliver( email )
    Mailer.send_later :deliver, email
  end
  
end
