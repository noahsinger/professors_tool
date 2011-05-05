require 'test/helper'

class StorageTest < Test::Unit::TestCase
  context "Parsing S3 credentials" do
    setup do
      rebuild_model :storage => :s3,
                    :bucket => "testing",
                    :s3_credentials => {:not => :important}

     xxx@xxx.xxx = Dummy.new
      @avatar xxx@xxx.xxx

     xxx@xxx.xxx = ENV['RAILS_ENV']
    end

    teardown do
      ENV['RAILS_ENV'] xxx@xxx.xxx
    end

    should "get the correct credentials when RAILS_ENV is production" do
      ENV['RAILS_ENV'] = 'production'
      assert_equal({:key => "12345"},
                  xxx@xxx.xxx => {:key => '12345'},
                                             :development => {:key => "54321"}))
    end

    should "get the correct credentials when RAILS_ENV is development" do
      ENV['RAILS_ENV'] = 'development'
      assert_equal({:key => "54321"},
                  xxx@xxx.xxx => {:key => '12345'},
                                             :development => {:key => "54321"}))
    end

    should "return the argument if the key does not exist" do
      ENV['RAILS_ENV'] = "not really an env"
      assert_equal({:test => xxx@xxx.xxx => "12345"))
    end
  end

  context "Parsing S3 credentials with a bucket in them" do
    setup do
      rebuild_model :storage => :s3,
                    :s3_credentials => {
                      :production   => { :bucket => "prod_bucket" },
                      :development  => { :bucket => "dev_bucket" }
                    }
     xxx@xxx.xxx = Dummy.new
    end

    should "get the right bucket in production", :before => lambda{ ENV.expects(:[]).returns('production') } do
      assert_equal xxx@xxx.xxx
    end

    should "get the right bucket in development", :before => lambda{ ENV.expects(:[]).returns('development') } do
      assert_equal xxx@xxx.xxx
    end
  end

  context "An attachment with S3 storage" do
    setup do
      rebuild_model :storage => :s3,
                    :bucket => "testing",
                    :path => ":attachment/:style/:basename.:extension",
                    :s3_credentials => {
                      'access_key_id' => "12345",
                      'secret_access_key' => "54321"
                    }
    end

    should "be extended by the S3 module" do
      assert Dummy.new.avatar.is_a?(Paperclip::Storage::S3)
    end

    should "not be extended by the Filesystem module" do
      assert ! Dummy.new.avatar.is_a?(Paperclip::Storage::Filesystem)
    end

    context "when assigned" do
      setup do
       xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__), 'fixtures', '5k.png'))
       xxx@xxx.xxx = Dummy.new
        @dummy.avatar xxx@xxx.xxx
      end

      should "not get a bucket to get a URL" do
       xxx@xxx.xxx
       xxx@xxx.xxx
        assert_match xxx@xxx.xxx
      end

      context "and saved" do
        setup do
         xxx@xxx.xxx     = stub
         xxx@xxx.xxx = stub
          RightAws::S3.expects(:new).with("12345", "54321", xxx@xxx.xxx
          @s3_mock.expects(:bucket).with("testing", true, xxx@xxx.xxx
         xxx@xxx.xxx = stub
         xxx@xxx.xxx
         xxx@xxx.xxx
         xxx@xxx.xxx 'public-read', 'Content-type' => 'image/png')
         xxx@xxx.xxx
        end

        should "succeed" do
          assert true
        end
      end
      
      context "and remove" do
        setup do
         xxx@xxx.xxx     = stub
         xxx@xxx.xxx = stub
          RightAws::S3.expects(:new).with("12345", "54321", xxx@xxx.xxx
          @s3_mock.expects(:bucket).with("testing", true, xxx@xxx.xxx
         xxx@xxx.xxx = stub
         xxx@xxx.xxx
         xxx@xxx.xxx
         xxx@xxx.xxx
        end

        should "succeed" do
          assert true
        end
      end
    end
  end

  unless ENV["S3_TEST_BUCKET"].blank?
    context "Using S3 for real, an attachment with S3 storage" do
      setup do
        rebuild_model :styles => { :thumb => "100x100", :square => "32x32#" },
                      :storage => :s3,
                      :bucket => ENV["S3_TEST_BUCKET"],
                      :path => ":class/:attachment/:id/:style.:extension",
                      :s3_credentials => File.new(File.join(File.dirname(__FILE__), "s3.yml"))

        Dummy.delete_all
       xxx@xxx.xxx = Dummy.new
      end

      should "be extended by the S3 module" do
        assert Dummy.new.avatar.is_a?(Paperclip::Storage::S3)
      end

      context "when assigned" do
        setup do
         xxx@xxx.xxx = File.new(File.join(File.dirname(__FILE__), 'fixtures', '5k.png'))
          @dummy.avatar xxx@xxx.xxx
        end

        should "still return a Tempfile when sent #to_io" do
          assert_equal xxx@xxx.xxx
        end

        context "and saved" do
          setup do
           xxx@xxx.xxx
          end

          should "be on S3" do
            assert true
          end
        end
      end
    end
  end
end
