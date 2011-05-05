require 'test/helper'

class ThumbnailTest < Test::Unit::TestCase

  context "A Paperclip Tempfile" do
    setup do
     xxx@xxx.xxx = Paperclip::Tempfile.new("file.jpg")
    end

    should "have its path contain a real extension" do
      assert_equal ".jpg", xxx@xxx.xxx
    end

    should "be a real Tempfile" do
      xxx@xxx.xxx
    end
  end

  context "Another Paperclip Tempfile" do
    setup do
     xxx@xxx.xxx = Paperclip::Tempfile.new("file")
    end

    should "not have an extension if not given one" do
      assert_equal "", xxx@xxx.xxx
    end

    should "still be a real Tempfile" do
      xxx@xxx.xxx
    end
  end

  context "An image" do
    setup do
     xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__), "fixtures", "5k.png"))
    end

    [["600x600>", "434x66"],
     ["400x400>", "400x61"],
     ["32x32<", "434x66"]
    ].each do |args|
      context "being thumbnailed with a geometry of #{args[0]}" do
        setup do
          @thumb = xxx@xxx.xxx args[0])
        end

        should "start with dimensions of 434x66" do
          cmd = %Q[identify -format "%wx%h" xxx@xxx.xxx 
          assert_equal "434x66", `#{cmd}`.chomp
        end

        should "report the correct target geometry" do
          assert_equal xxx@xxx.xxx
        end

        context "when made" do
          setup do
            @thumb_result xxx@xxx.xxx
          end

          should "be the size we expect it to be" do
            cmd = %Q[identify -format "%wx%h" xxx@xxx.xxx 
            assert_equal args[1], `#{cmd}`.chomp
          end
        end
      end
    end

    context "being thumbnailed at 100x50 with cropping" do
      setup do
        @thumb = xxx@xxx.xxx "100x50#")
      end

      should "report its correct current and target geometries" do
        assert_equal xxx@xxx.xxx
        assert_equal xxx@xxx.xxx
      end

      should "report its correct format" do
        xxx@xxx.xxx
      end

      should "have whiny_thumbnails turned on by default" do
        xxx@xxx.xxx
      end
      
      should "have convert_options set to nil by default" do
        assert_equal xxx@xxx.xxx
      end

      should "send the right command to convert when sent #make" do
        Paperclip.expects(:"`").with do |arg|
          arg.match xxx@xxx.xxx
        end
       xxx@xxx.xxx
      end

      should "create the thumbnail when sent #make" do
        dst xxx@xxx.xxx
        assert_match /100x50/, `identify #{dst.path}`
      end
    end
    
    context "being thumbnailed with convert options set" do
      setup do
        @thumb = xxx@xxx.xxx "100x50#", format=nil, convert_options="-strip -depth 8", whiny_thumbnails=true)
      end

      should "have convert_options value set" do
        assert_equal "-strip -depth xxx@xxx.xxx
      end

      should "send the right command to convert when sent #make" do
        Paperclip.expects(:"`").with do |arg|
          arg.match xxx@xxx.xxx
        end
       xxx@xxx.xxx
      end

      should "create the thumbnail when sent #make" do
        dst xxx@xxx.xxx
        assert_match /100x50/, `identify #{dst.path}`
      end
      
      context "redefined to have bad convert_options setting" do
        setup do
          @thumb = xxx@xxx.xxx "100x50#", format=nil, convert_options="-this-aint-no-option", whiny_thumbnails=true)
        end

        should "error when trying to create the thumbnail" do
          assert_raises(Paperclip::PaperclipError) do
           xxx@xxx.xxx
          end
        end
      end      
    end
  end
end
