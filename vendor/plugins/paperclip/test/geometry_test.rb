require 'test/helper'

class GeometryTest < Test::Unit::TestCase
  context "Paperclip::Geometry" do
    should "correctly report its given dimensions" do
      xxx@xxx.xxx = Paperclip::Geometry.new(1024, 768)
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "set height to 0 if height dimension is missing" do
      xxx@xxx.xxx = Paperclip::Geometry.new(1024)
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "set width to 0 if width dimension is missing" do
      xxx@xxx.xxx = Paperclip::Geometry.new(nil, 768)
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "be generated from a WxH-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("800x600")
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "be generated from a xH-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("x600")
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "be generated from a Wx-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("800x")
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "be generated from a W-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("800")
      assert_equal xxx@xxx.xxx
      assert_equal xxx@xxx.xxx
    end

    should "ensure the modifier is nil if not present" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("123x456")
      xxx@xxx.xxx
    end

    ['>', '<', '#', xxx@xxx.xxx '%', '^', '!', nil].each do |mod|
      should "ensure the modifier #{mod.inspect} is preserved" do
        xxx@xxx.xxx = Paperclip::Geometry.parse("123x456#{mod}")
        assert_equal xxx@xxx.xxx
        assert_equal xxx@xxx.xxx
      end
    end
    
    ['>', '<', '#', xxx@xxx.xxx '%', '^', '!', nil].each do |mod|
      should "ensure the modifier #{mod.inspect} is preserved with no height" do
        xxx@xxx.xxx = Paperclip::Geometry.parse("123x#{mod}")
        assert_equal xxx@xxx.xxx
        assert_equal xxx@xxx.xxx
      end
    end

    should "make sure the modifier gets passed during transformation_to" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("123x456")
      xxx@xxx.xxx = Paperclip::Geometry.parse("123x456>")
      assert_equal xxx@xxx.xxx
    end

    should "generate correct ImageMagick formatting string for W-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("800")
      assert_equal xxx@xxx.xxx
    end

    should "generate correct ImageMagick formatting string for Wx-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("800x")
      assert_equal xxx@xxx.xxx
    end

    should "generate correct ImageMagick formatting string for xH-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("x600")
      assert_equal xxx@xxx.xxx
    end

    should "generate correct ImageMagick formatting string for WxH-formatted string" do
      xxx@xxx.xxx = Paperclip::Geometry.parse("800x600")
      assert_equal xxx@xxx.xxx
    end

    should "be generated from a file" do
      file = File.join(File.dirname(__FILE__), "fixtures", "5k.png")
      file = File.new(file)
      xxx@xxx.xxx = Paperclip::Geometry.from_file(file) }
      xxx@xxx.xxx > 0
      xxx@xxx.xxx > 0
    end

    should "be generated from a file path" do
      file = File.join(File.dirname(__FILE__), "fixtures", "5k.png")
      xxx@xxx.xxx = Paperclip::Geometry.from_file(file) }
      xxx@xxx.xxx > 0
      xxx@xxx.xxx > 0
    end

    should "not generate from a bad file" do
      file = "/home/This File Does Not Exist.omg"
      xxx@xxx.xxx = Paperclip::Geometry.from_file(file) }
    end

    [['vertical',   900,  1440, true,  false, false, 1440, 900, 0.625],
     ['horizontal', 1024, 768,  false, true,  false, 1024, 768, 1.3333],
     ['square',     100,  100,  false, false, true,  100,  100, 1]].each do |args|
      context "performing calculations on a #{args[0]} viewport" do
        setup do
         xxx@xxx.xxx = Paperclip::Geometry.new(args[1], args[2])
        end

        should "#{args[3] ? "" : "not"} be vertical" do
          assert_equal xxx@xxx.xxx
        end

        should "#{args[4] ? "" : "not"} be horizontal" do
          assert_equal xxx@xxx.xxx
        end

        should "#{args[5] ? "" : "not"} be square" do
          assert_equal xxx@xxx.xxx
        end

        should "report that #{args[6]} is the larger dimension" do
          assert_equal xxx@xxx.xxx
        end

        should "report that #{args[7]} is the smaller dimension" do
          assert_equal xxx@xxx.xxx
        end

        should "have an aspect ratio of #{args[8]}" do
          assert_in_delta xxx@xxx.xxx 0.0001
        end
      end
    end

    [[ [1000, 100], [64, 64],  "x64", "64x64+288+0" ],
     [ [100, 1000], [50, 950], "x950", "50x950+22+0" ],
     [ [100, 1000], [50, 25],  "50x", "50x25+0+237" ]]. each do |args|
      context "of #{args[0].inspect} and given a Geometry #{args[1].inspect} and sent transform_to" do
        setup do
         xxx@xxx.xxx = Paperclip::Geometry.new(*args[0])
         xxx@xxx.xxx = Paperclip::Geometry.new(*args[1])
          @scale, @crop xxx@xxx.xxx @dst, true
        end

        should "be able to return the correct scaling transformation geometry #{args[2]}" do
          assert_equal xxx@xxx.xxx
        end

        should "be able to return the correct crop transformation geometry #{args[3]}" do
          assert_equal xxx@xxx.xxx
        end
      end
    end
  end
end
