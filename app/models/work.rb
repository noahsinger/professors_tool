class Work < ApplicationRecord
  require 'digest/sha2'
  
  belongs_to :assignment
  belongs_to :enrollment
  has_many :awarded_points, dependent: :destroy
  
  has_attached_file :upload,
                    path: ":rails_root/uploads/:class/:id/:attachment/:basename.:extension",
                    url: "/admin/:class/:id/download",
                    default_url: ''
                    
  do_not_validate_attachment_file_type :upload
                    
  validates_format_of( :email, 
                       with: /\A[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))\z/i, 
                       on: :create, 
                       :message=>"has an invalid format." )

  after_create :generate_withdrawal_code
    
  class UploadValidator < ActiveModel::Validator
    def validate( record )
      if record.assignment.lab.allow_uploads and record.upload_file_name.blank?
        record.errors[:upload] << (options[:message] || "must be present")
      end
    end
  end
    
  validates_with UploadValidator
  
  def generate_withdrawal_code
    update_attribute(:withdrawal_code, withdrawal_code = Digest::SHA256.hexdigest(self.assignment.title+self.assignment.lab.title+self.id.to_s))
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
    StudentMailer.work_submitted( self, submitting_address ).deliver_later
  end
  
  def send_reminder_email # submitting_address
    StudentMailer.work_reminder( self ).deliver_later
  end
  
end
