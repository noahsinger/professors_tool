module Paperclip
  # Handles thumbnailing images that are uploaded.
  class Thumbnail

    attr_accessor :file, :current_geometry, :target_geometry, :format, :whiny_thumbnails, :convert_options

    # Creates a Thumbnail object set to work on the +file+ given. It
    # will attempt to transform the image into one defined by +target_geometry+
    # which is a "WxH"-style string. +format+ will be inferred from the +file+
    # unless specified. Thumbnail creation will raise no errors unless
    # +whiny_thumbnails+ is true (which it is, by default. If +convert_options+ is
    # set, the options will be appended to the convert command upon image conversion 
    def initialize file, target_geometry, format = nil, convert_options = nil, whiny_thumbnails = true
     xxx@xxx.xxx             = file
     xxx@xxx.xxx             = target_geometry[-1,1] == '#'
     xxx@xxx.xxx  = Geometry.parse target_geometry
     xxx@xxx.xxx = Geometry.from_file file
     xxx@xxx.xxx  = convert_options
     xxx@xxx.xxx = whiny_thumbnails

      @current_format   = xxx@xxx.xxx
      @basename         = xxx@xxx.xxx @current_format)
      
     xxx@xxx.xxx = format
    end

    # Creates a thumbnail, as specified in +initialize+, +make+s it, and returns the
    # resulting Tempfile.
    def self.make file, dimensions, format = nil, convert_options = nil, whiny_thumbnails = true
      new(file, dimensions, format, convert_options, whiny_thumbnails).make
    end

    # Returns true if the +target_geometry+ is meant to crop.
    def crop?
     xxx@xxx.xxx
    end
    
    # Returns true if the image is meant to make use of additional convert options.
    def convert_options?
      xxx@xxx.xxx
    end

    # Performs the conversion of the +file+ into a thumbnail. Returns the Tempfile
    # that contains the new image.
    def make
      src xxx@xxx.xxx
      dst = xxx@xxx.xxx @format].compact.join("."))
      dst.binmode

      command = <<-end_command
        "#{ File.expand_path(src.path) }[0]"
        #{ transformation_command }
        "#{ File.expand_path(dst.path) }"
      end_command

      begin
        success = Paperclip.run("convert", command.gsub(/\s+/, " "))
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error processing the thumbnail for #{@basename}" xxx@xxx.xxx
      end

      dst
    end

    # Returns the command ImageMagick's +convert+ needs to transform the image
    # into the thumbnail.
    def transformation_command
      scale, crop xxx@xxx.xxx crop?)
      trans = "-resize \"#{scale}\""
      trans << " -crop \"#{crop}\" +repage" if crop
      trans << " #{convert_options}" if convert_options?
      trans
    end
  end

  # Due to how ImageMagick handles its image format conversion and how Tempfile
  # handles its naming scheme, it is necessary to override how Tempfile makes
  # its names so as to allow for file extensions. Idea taken from the comments
  # on this blog post:
  # http://marsorange.com/archives/of-mogrify-ruby-tempfile-dynamic-class-definitions
  class Tempfile < ::Tempfile
    # Replaces Tempfile's +make_tmpname+ with one that honors file extensions.
    def make_tmpname(basename, n)
      extension = File.extname(basename)
      sprintf("%s,%d,%d%s", File.basename(basename, extension), $$, n, extension)
    end
  end
end
