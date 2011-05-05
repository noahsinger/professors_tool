require 'test/helper'

class IOStreamTest < Test::Unit::TestCase
  context "IOStream" do
    should "be included in IO, File, Tempfile, and StringIO" do
      [IO, File, Tempfile, StringIO].each do |klass|
        assert klass.included_modules.include?(IOStream), "Not in #{klass}"
      end
    end
  end

  context "A file" do
    setup do
     xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__), "fixtures", "5k.png"))
    end

    context "that is sent #stream_to" do

      [["/tmp/iostream.string.test", File],
       [Tempfile.new('iostream.test'), Tempfile]].each do |args|

        context "and given a #{args[0].class.to_s}" do
          setup do
            assert @result xxx@xxx.xxx
          end

          should "return a #{args[1].to_s}" do
            xxx@xxx.xxx
          end

          should "contain the same data as the original file" do
           xxx@xxx.xxx @result.rewind
            xxx@xxx.xxx @result.read
          end
        end
      end
    end

    context "that is sent #to_tempfile" do
      setup do
        assert @tempfile xxx@xxx.xxx
      end

      should "convert it to a Tempfile" do
        xxx@xxx.xxx
      end

      should "have the Tempfile contain the same data as the file" do
       xxx@xxx.xxx @tempfile.rewind
        xxx@xxx.xxx @tempfile.read
      end
    end
  end
end
