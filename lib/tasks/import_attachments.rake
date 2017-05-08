# examples - files (root public system examples files class_id attachment_id id_partition original file)
# extras - files
# materials - files
# instructors - office_hours
# steps - images

namespace :paperclip_custom do
  desc "Recreate attachments and save them to new destination"
  task :import_attachments => :environment do

    Example.find_each do |example|
      unless example.file_file_name.blank?
        filename = Rails.root.join('public', 'system_backup', 'files', example.id.to_s, 'original', example.file_file_name)

        if File.exists? filename
          puts "Re-saving example attachment #{example.id} - #{filename}"
          file = File.new filename
          example.file = file
          example.save
          file.close
        end
      end
    end

    Extra.find_each do |extra|
      unless extra.file_file_name.blank?
        filename = Rails.root.join('public', 'system_backup', 'files', extra.id.to_s, 'original', extra.file_file_name)

        if File.exists? filename
          puts "Re-saving example attachment #{extra.id} - #{filename}"
          file = File.new filename
          extra.file = file
          extra.save
          file.close
        end
      end
    end

    Material.find_each do |material|
      unless material.file_file_name.blank?
        filename = Rails.root.join('public', 'system_backup', 'files', material.id.to_s, 'original', material.file_file_name)

        if File.exists? filename
          puts "Re-saving example attachment #{material.id} - #{filename}"
          file = File.new filename
          material.file = file
          material.save
          file.close
        end
      end
    end

    Instructor.find_each do |instructor|
      unless instructor.office_hours_file_name.blank?
        filename = Rails.root.join('public', 'system_backup', 'office_hours', instructor.id.to_s, 'original', instructor.office_hours_file_name)

        if File.exists? filename
          puts "Re-saving example attachment #{instructor.id} - #{filename}"
          office_hours = File.new filename
          instructor.office_hours = office_hours
          instructor.save
          office_hours.close
        end
      end
    end

    Step.find_each do |step|
      unless step.image_file_name.blank?
        filename = Rails.root.join('public', 'system_backup', 'office_hours', step.id.to_s, 'original', step.image_file_name)

        if File.exists? filename
          puts "Re-saving example attachment #{step.id} - #{filename}"
          image = File.new filename
          step.image = image
          step.save
          # if there are multiple styles, you want to recreate them :
          step.image.reprocess!
          image.close
        end
      end
    end
  end
end
