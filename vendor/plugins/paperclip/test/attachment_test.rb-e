require 'test/helper'

class Dummy
  # This is a dummy class
end

class AttachmentTest < Test::Unit::TestCase
  context "Attachment default_options" do
    setup do
      rebuild_model
     xxx@xxx.xxx = Paperclip::Attachment.default_options.dup
      @new_default_options xxx@xxx.xxx
        :path => "argle/bargle",
        :url => "fooferon",
        :default_url => "not here.png"
      })
    end

    teardown do
      xxx@xxx.xxx
    end

    should "be overrideable" do
      xxx@xxx.xxx
     xxx@xxx.xxx do |key|
        xxx@xxx.xxx
                     Paperclip::Attachment.default_options[key]
      end
    end

    context "without an Attachment" do
      setup do
       xxx@xxx.xxx = Dummy.new
      end
      
      should "return false when asked exists?" do
        assert xxx@xxx.xxx
      end
    end

    context "on an Attachment" do
      setup do
       xxx@xxx.xxx = Dummy.new
        @attachment xxx@xxx.xxx
      end

      Paperclip::Attachment.default_options.keys.each do |key|
        should "be the default_options for #{key}" do
          xxx@xxx.xxx 
                      xxx@xxx.xxx
                       key
        end
      end

      context "when redefined" do
        setup do
          xxx@xxx.xxx
         xxx@xxx.xxx = Dummy.new
          @attachment xxx@xxx.xxx
        end

        Paperclip::Attachment.default_options.keys.each do |key|
          should "be the new default_options for #{key}" do
            xxx@xxx.xxx
                        xxx@xxx.xxx
                         key
          end
        end
      end
    end
  end

  context "An attachment with similarly named interpolations" do
    setup do
      rebuild_model :path => ":id.omg/:id-bbq/:idwhat/:id_partition.wtf"
     xxx@xxx.xxx = Dummy.new
     xxx@xxx.xxx
     xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__),
                                 "fixtures",
                                 "5k.png"))
      @dummy.avatar xxx@xxx.xxx
    end

    should "make sure that they are interpolated correctly" do
      assert_equal xxx@xxx.xxx
    end
  end

  context "An attachment with a :rails_env interpolation" do
    setup do
     xxx@xxx.xxx = "blah"
     xxx@xxx.xxx = 1024
      rebuild_model :path => ":rails_env/:id.png"
     xxx@xxx.xxx = Dummy.new
     xxx@xxx.xxx
     xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__),
                                 "fixtures",
                                 "5k.png"))
      @dummy.avatar xxx@xxx.xxx
    end

    should "return the proper path" do
      xxx@xxx.xxx {
        assert_equal xxx@xxx.xxx @dummy.avatar.path
      }
    end
  end

  context "An attachment with :convert_options" do
    setup do
      rebuild_model :styles => {
                      :thumb => "100x100",
                      :large => "400x400"
                    },
                    :convert_options => {
                      :all => "-do_stuff",
                      :thumb => "-thumbnailize"
                    }
     xxx@xxx.xxx = Dummy.new
    end

    should "report the correct options when sent #extra_options_for(:thumb)" do
      assert_equal "-thumbnailize -do_stuff", @dummy.avatar.send(:extra_options_for, xxx@xxx.xxx
    end

    should "report the correct options when sent #extra_options_for(:large)" do
      assert_equal xxx@xxx.xxx :large)
    end

    context "when given a file" do
      setup do
       xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__),
                                   "fixtures",
                                   "5k.png"))
        Paperclip::Thumbnail.stubs(:make)
        [:thumb, :large].each do |style|
         xxx@xxx.xxx
        end
      end

      [:thumb, :large].each do |style|
        should "call extra_options_for(#{style})" do
         xxx@xxx.xxx
          @dummy.avatar xxx@xxx.xxx
        end
      end
    end
  end

  context "Assigning an attachment" do
    setup do
      rebuild_model
      
     xxx@xxx.xxx = mock
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
      
     xxx@xxx.xxx = Dummy.new
      @attachment xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
      @dummy.avatar xxx@xxx.xxx
    end

    should "strip whitespace from original_filename field" do
      assert_equal xxx@xxx.xxx
    end

    should "strip whitespace from content_type field" do
      assert_equal xxx@xxx.xxx
    end
  end

  context "Attachment with strange letters" do
    setup do
      rebuild_model
      
     xxx@xxx.xxx = mock
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
      
     xxx@xxx.xxx = Dummy.new
      @attachment xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
     xxx@xxx.xxx
      @dummy.avatar xxx@xxx.xxx
    end
    
    should "remove strange letters and replace with underscore (_)" do
      assert_equal xxx@xxx.xxx
    end
    
  end

  context "An attachment" do
    setup do
      Paperclip::Attachment.default_options.merge!({
        :path => ":rails_root/tmp/:attachment/:class/:style/:id/:basename.:extension"
      })
      FileUtils.rm_rf("tmp")
      rebuild_model
     xxx@xxx.xxx = Dummy.new
      @attachment = xxx@xxx.xxx
     xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__),
                                 "fixtures",
                                 "5k.png"))
    end

    should "raise if there are not the correct columns when you try to assign" do
      @other_attachment = xxx@xxx.xxx
      assert_raises(Paperclip::PaperclipError) do
       xxx@xxx.xxx
      end
    end

    should "return its default_url when no file assigned" do
      xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end
    
    context "with a file assigned in the database" do
      setup do
       xxx@xxx.xxx
       xxx@xxx.xxx
       xxx@xxx.xxx
        now = Time.now
        Time.stubs(:now).returns(now)
       xxx@xxx.xxx
      end

      should "return a correct url even if the file does not exist" do
        xxx@xxx.xxx
        assert_match xxx@xxx.xxx @attachment.url(:blah)
      end

      should "make sure the updated_at mtime is in the url if it is defined" do
        assert_match xxx@xxx.xxx
      end

      context "with the updated_at field removed" do
        setup do
         xxx@xxx.xxx
        end

        should "only return the url without the updated_at when sent #url" do
          assert_match xxx@xxx.xxx @attachment.url(:blah)
        end
      end

      should "return the proper path when filename has a single .'s" do
        assert_equal xxx@xxx.xxx @attachment.path
      end

      should "return the proper path when filename has multiple .'s" do
       xxx@xxx.xxx      
        assert_equal xxx@xxx.xxx @attachment.path
      end

      context "when expecting three styles" do
        setup do
          styles = {:styles => { :large  => ["400x400", :png],
                                 :medium => ["100x100", :gif],
                                 :small => ["32x32#", :jpg]}}
         xxx@xxx.xxx = Paperclip::Attachment.new(:avatar,
                                                 xxx@xxx.xxx
                                                  styles)
        end

        context "and assigned a file" do
          setup do
            now = Time.now
            Time.stubs(:now).returns(now)
           xxx@xxx.xxx
          end

          should "be dirty" do
            xxx@xxx.xxx
          end

          context "and saved" do
            setup do
             xxx@xxx.xxx
            end

            should "return the real url" do
              xxx@xxx.xxx
              assert_match xxx@xxx.xxx @attachment.url
              assert_match xxx@xxx.xxx @attachment.url(:small)
            end

            should "commit the files to disk" do
              [:large, :medium, :small].each do |style|
                io xxx@xxx.xxx
                assert File.exists?(io)
                assert ! io.is_a?(::Tempfile)
              end
            end

            should "save the files as the right formats and sizes" do
              [[:large, 400, 61, "PNG"],
               [:medium, 100, 15, "GIF"],
               [:small, 32, 32, "JPEG"]].each do |style|
                cmd = "identify -format '%w %h %b %m' " + 
                      xxx@xxx.xxx
                out = `#{cmd}`
                width, height, size, format = out.split(" ")
                assert_equal style[1].to_s, width.to_s 
                assert_equal style[2].to_s, height.to_s
                assert_equal style[3].to_s, format.to_s
              end
            end

            should "still have its #file attribute not be nil" do
              assert xxx@xxx.xxx
            end

            context "and deleted" do
              setup do
                @existing_names xxx@xxx.xxx do |style|
                 xxx@xxx.xxx
                end
               xxx@xxx.xxx nil)
               xxx@xxx.xxx nil)
               xxx@xxx.xxx nil)
               xxx@xxx.xxx nil)
               xxx@xxx.xxx nil
               xxx@xxx.xxx
              end

              should "delete the files" do
               xxx@xxx.xxx assert ! File.exists?(f) }
              end
            end
          end
        end
      end

    end

    context "when trying a nonexistant storage type" do
      setup do
        rebuild_model :storage => :not_here
      end

      should "not be able to find the module" do
        assert_raise(NameError){ Dummy.new.avatar }
      end
    end
  end
end
