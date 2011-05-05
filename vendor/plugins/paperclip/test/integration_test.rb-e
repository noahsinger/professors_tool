require 'test/helper'

class IntegrationTest < Test::Unit::TestCase
  context "Many models at once" do
    setup do
      rebuild_model
     xxx@xxx.xxx      = File.new(File.join(FIXTURES_DIR, "5k.png"))
      300.times do |i|
        Dummy.create! :avatar xxx@xxx.xxx
      end
    end
    
    should "not exceed the open file limit" do
       assert_nothing_raised do
         dummies = Dummy.find(:all)
         dummies.each { |dummy| dummy.avatar }
       end
    end
  end

  context "An attachment" do
    setup do
      rebuild_model :styles => { :thumb => "50x50#" }
     xxx@xxx.xxx = Dummy.new
     xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__),
                                 "fixtures",
                                 "5k.png"))
      @dummy.avatar xxx@xxx.xxx
      xxx@xxx.xxx
    end

    should "create its thumbnails properly" do
      assert_match /\b50x50\b/, `identify xxx@xxx.xxx
    end

    context "redefining its attachment styles" do
      setup do
        Dummy.class_eval do
          has_attached_file :avatar, :styles => { :thumb => "150x25#" }
        end
        @d2 = xxx@xxx.xxx
       xxx@xxx.xxx
       xxx@xxx.xxx
      end

      should "create its thumbnails properly" do
        assert_match /\b150x25\b/, `identify xxx@xxx.xxx
      end
    end
  end

  context "A model with no attachment validation" do
    setup do
      rebuild_model :styles => { :large => "300x300>",
                                 :medium => "100x100",
                                 :thumb => ["32x32#", :gif] },
                    :default_style => :medium,
                    :url => "/:attachment/:class/:style/:id/:basename.:extension",
                    :path => ":rails_root/tmp/:attachment/:class/:style/:id/:basename.:extension"
     xxx@xxx.xxx     = Dummy.new
    end

    should "have its definition return false when asked about whiny_thumbnails" do
      assert ! Dummy.attachment_definitions[:avatar][:whiny_thumbnails]
    end

    context "when validates_attachment_thumbnails is called" do
      setup do
        Dummy.validates_attachment_thumbnails :avatar
      end

      should "have its definition return true when asked about whiny_thumbnails" do
        assert_equal true, Dummy.attachment_definitions[:avatar][:whiny_thumbnails]
      end
    end

    context "redefined to have attachment validations" do
      setup do
        rebuild_model :styles => { :large => "300x300>",
                                   :medium => "100x100",
                                   :thumb => ["32x32#", :gif] },
                      :whiny_thumbnails => true,
                      :default_style => :medium,
                      :url => "/:attachment/:class/:style/:id/:basename.:extension",
                      :path => ":rails_root/tmp/:attachment/:class/:style/:id/:basename.:extension"
      end

      should "have its definition return true when asked about whiny_thumbnails" do
        assert_equal true, Dummy.attachment_definitions[:avatar][:whiny_thumbnails]
      end
    end
  end
  
  context "A model with no convert_options setting" do
    setup do
      rebuild_model :styles => { :large => "300x300>",
                                 :medium => "100x100",
                                 :thumb => ["32x32#", :gif] },
                    :default_style => :medium,
                    :url => "/:attachment/:class/:style/:id/:basename.:extension",
                    :path => ":rails_root/tmp/:attachment/:class/:style/:id/:basename.:extension"
     xxx@xxx.xxx     = Dummy.new
    end
    
    should "have its definition return nil when asked about convert_options" do
      assert ! Dummy.attachment_definitions[:avatar][:convert_options]
    end

    context "redefined to have convert_options setting" do
      setup do
        rebuild_model :styles => { :large => "300x300>",
                                   :medium => "100x100",
                                   :thumb => ["32x32#", :gif] },
                      :convert_options => "-strip -depth 8",
                      :default_style => :medium,
                      :url => "/:attachment/:class/:style/:id/:basename.:extension",
                      :path => ":rails_root/tmp/:attachment/:class/:style/:id/:basename.:extension"
      end

      should "have its definition return convert_options value when asked about convert_options" do
        assert_equal "-strip -depth 8", Dummy.attachment_definitions[:avatar][:convert_options]
      end
    end
  end
  
  context "A model with a filesystem attachment" do
    setup do
      rebuild_model :styles => { :large => "300x300>",
                                 :medium => "100x100",
                                 :thumb => ["32x32#", :gif] },
                    :whiny_thumbnails => true,
                    :default_style => :medium,
                    :url => "/:attachment/:class/:style/:id/:basename.:extension",
                    :path => ":rails_root/tmp/:attachment/:class/:style/:id/:basename.:extension"
     xxx@xxx.xxx     = Dummy.new
     xxx@xxx.xxx      = File.new(File.join(FIXTURES_DIR, "5k.png"))
     xxx@xxx.xxx  = File.new(File.join(FIXTURES_DIR, "bad.png"))

      assert @dummy.avatar xxx@xxx.xxx
      xxx@xxx.xxx
      xxx@xxx.xxx
    end

    should "write and delete its files" do
      [["434x66", :original],
       ["300x46", :large],
       ["100x15", :medium],
       ["32x32", :thumb]].each do |geo, style|
        cmd = %Q[identify -format "%wx%h" xxx@xxx.xxx
        assert_equal geo, `#{cmd}`.chomp, cmd
      end

      saved_paths = [:thumb, :medium, :large, xxx@xxx.xxx }

      @d2 = xxx@xxx.xxx
      assert_equal "100x15", `identify -format "%wx%h" xxx@xxx.xxx
      assert_equal "434x66", `identify -format "%wx%h" xxx@xxx.xxx
      assert_equal "300x46", `identify -format "%wx%h" xxx@xxx.xxx
      assert_equal "100x15", `identify -format "%wx%h" xxx@xxx.xxx
      assert_equal "32x32",  `identify -format "%wx%h" xxx@xxx.xxx

     xxx@xxx.xxx = "not a valid file but not nil"
      assert_equal xxx@xxx.xxx @dummy.avatar_file_name
      xxx@xxx.xxx
      xxx@xxx.xxx

      saved_paths.each do |p|
        assert File.exists?(p)
      end

     xxx@xxx.xxx = nil
      xxx@xxx.xxx
      xxx@xxx.xxx
      xxx@xxx.xxx

      saved_paths.each do |p|
        assert ! File.exists?(p)
      end

      @d2 = xxx@xxx.xxx
      xxx@xxx.xxx
    end

    should "work exactly the same when new as when reloaded" do
      @d2 = xxx@xxx.xxx

      xxx@xxx.xxx @d2.avatar_file_name
      [:thumb, :medium, :large, :original].each do |style|
        xxx@xxx.xxx @d2.avatar.to_file(style).path
      end

      saved_paths = [:thumb, :medium, :large, xxx@xxx.xxx }

     xxx@xxx.xxx = nil
      xxx@xxx.xxx

      saved_paths.each do |p|
        assert ! File.exists?(p)
      end
    end

    should "know the difference between good files, bad files, not files, and nil" do
      expected xxx@xxx.xxx
     xxx@xxx.xxx = "not a file"
      xxx@xxx.xxx
      assert_equal xxx@xxx.xxx

      @dummy.avatar xxx@xxx.xxx
      assert xxx@xxx.xxx
     xxx@xxx.xxx = nil
      xxx@xxx.xxx
    end

    should "know the difference between good files, bad files, not files, and nil when validating" do
      Dummy.validates_attachment_presence :avatar
      @d2 = xxx@xxx.xxx
      @d2.avatar xxx@xxx.xxx
      assert  xxx@xxx.xxx
      @d2.avatar xxx@xxx.xxx
      assert xxx@xxx.xxx
     xxx@xxx.xxx = nil
      assert xxx@xxx.xxx
    end

    should "be able to reload without saving and not have the file disappear" do
      @dummy.avatar xxx@xxx.xxx
      xxx@xxx.xxx
     xxx@xxx.xxx = nil
      xxx@xxx.xxx
     xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end
    
    context "that is assigned its file from another Paperclip attachment" do
      setup do
       xxx@xxx.xxx = Dummy.new
       xxx@xxx.xxx  = File.new(File.join(FIXTURES_DIR, "12k.png"))
        assert  @dummy2.avatar xxx@xxx.xxx
       xxx@xxx.xxx
      end
      
      should "work when assigned a file" do
        assert_not_equal `identify -format "%wx%h" xxx@xxx.xxx
                         `identify -format "%wx%h" xxx@xxx.xxx

        assert @dummy.avatar xxx@xxx.xxx
       xxx@xxx.xxx
        assert_equal `identify -format "%wx%h" xxx@xxx.xxx
                     `identify -format "%wx%h" xxx@xxx.xxx
      end
      
      should "work when assigned a nil file" do
       xxx@xxx.xxx = nil
       xxx@xxx.xxx

        @dummy.avatar xxx@xxx.xxx
       xxx@xxx.xxx
        
        assert xxx@xxx.xxx
      end
    end    

  end

  if ENV['S3_TEST_BUCKET']
    def s3_files_for attachment
      [:thumb, :medium, :large, :original].inject({}) do |files, style|
        data = `curl '#{attachment.url(style)}' 2>/dev/null`.chomp
        t = Tempfile.new("paperclip-test")
        t.write(data)
        t.rewind
        files[style] = t
        files
      end
    end

    def s3_headers_for attachment, style
      `curl --head '#{attachment.url(style)}' 2>/dev/null`.split("\n").inject({}) do |h,head|
        split_head = head.chomp.split(/\s*:\s*/, 2)
        h[split_head.first.downcase] = split_head.last unless split_head.empty?
        h
      end
    end

    context "A model with an S3 attachment" do
      setup do
        rebuild_model :styles => { :large => "300x300>",
                                   :medium => "100x100",
                                   :thumb => ["32x32#", :gif] },
                      :storage => :s3,
                      :whiny_thumbnails => true,
                      # :s3_options => {:logger => Logger.new(StringIO.new)},
                      :s3_credentials => File.new(File.join(File.dirname(__FILE__), "s3.yml")),
                      :default_style => :medium,
                      :bucket => ENV['S3_TEST_BUCKET'],
                      :path => ":class/:attachment/:id/:style/:basename.:extension"
       xxx@xxx.xxx     = Dummy.new
       xxx@xxx.xxx      = File.new(File.join(FIXTURES_DIR, "5k.png"))
       xxx@xxx.xxx  = File.new(File.join(FIXTURES_DIR, "bad.png"))

        assert @dummy.avatar xxx@xxx.xxx
        xxx@xxx.xxx
        xxx@xxx.xxx

        @files_on_s3 = xxx@xxx.xxx
      end

      should "write and delete its files" do
        [["434x66", :original],
         ["300x46", :large],
         ["100x15", :medium],
         ["32x32", :thumb]].each do |geo, style|
          cmd = %Q[identify -format "%wx%h" xxx@xxx.xxx
          assert_equal geo, `#{cmd}`.chomp, cmd
        end

        @d2 = xxx@xxx.xxx
        @d2_files = xxx@xxx.xxx
        [["434x66", :original],
         ["300x46", :large],
         ["100x15", :medium],
         ["32x32", :thumb]].each do |geo, style|
          cmd = %Q[identify -format "%wx%h" xxx@xxx.xxx
          assert_equal geo, `#{cmd}`.chomp, cmd
        end

       xxx@xxx.xxx = "not a valid file but not nil"
        assert_equal xxx@xxx.xxx @dummy.avatar_file_name
        xxx@xxx.xxx
        xxx@xxx.xxx

        saved_keys = [:thumb, :medium, :large, xxx@xxx.xxx }

        saved_keys.each do |key|
          assert key.exists?
        end

       xxx@xxx.xxx = nil
        xxx@xxx.xxx
        xxx@xxx.xxx
        xxx@xxx.xxx

        saved_keys.each do |key|
          assert ! key.exists?
        end

        @d2 = xxx@xxx.xxx
        xxx@xxx.xxx
      end

      should "work exactly the same when new as when reloaded" do
        @d2 = xxx@xxx.xxx

        xxx@xxx.xxx @d2.avatar_file_name
        [:thumb, :medium, :large, :original].each do |style|
          xxx@xxx.xxx @d2.avatar.to_file(style).to_s
        end

        saved_keys = [:thumb, :medium, :large, xxx@xxx.xxx }

       xxx@xxx.xxx = nil
        xxx@xxx.xxx

        saved_keys.each do |key|
          assert ! key.exists?
        end
      end

      should "know the difference between good files, bad files, not files, and nil" do
        expected xxx@xxx.xxx
       xxx@xxx.xxx = "not a file"
        xxx@xxx.xxx
        assert_equal xxx@xxx.xxx

        @dummy.avatar xxx@xxx.xxx
        assert xxx@xxx.xxx
       xxx@xxx.xxx = nil
        xxx@xxx.xxx

        Dummy.validates_attachment_presence :avatar
        @d2 = xxx@xxx.xxx
        @d2.avatar xxx@xxx.xxx
        assert  xxx@xxx.xxx
        @d2.avatar xxx@xxx.xxx
        assert xxx@xxx.xxx
       xxx@xxx.xxx = nil
        assert xxx@xxx.xxx
      end

      should "be able to reload without saving and not have the file disappear" do
        @dummy.avatar xxx@xxx.xxx
        xxx@xxx.xxx
       xxx@xxx.xxx = nil
        xxx@xxx.xxx
       xxx@xxx.xxx
        assert_equal xxx@xxx.xxx
      end

      should "have the right content type" do
        headers = xxx@xxx.xxx :original)
        p headers
        assert_equal 'image/png', headers['content-type']
      end
    end
  end
end

