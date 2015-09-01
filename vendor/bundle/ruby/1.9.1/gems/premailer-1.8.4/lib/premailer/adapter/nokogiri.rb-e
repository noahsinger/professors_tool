require 'nokogiri'

class Premailer
  module Adapter
    # Nokogiri adapter
    module Nokogiri

      # Merge CSS into the HTML document.
      #
      xxx@xxx.xxx [String] an HTML.
      def to_inline_css
        doc xxx@xxx.xxx
       xxx@xxx.xxx = CssParser::Parser.new

        # Give all styles already in style attributes a specificity of 1000
        # per http://www.w3.org/TR/CSS21/cascade.html#specificity
        xxx@xxx.xxx do |el|
          el['style'] = '[SPEC=1000[' + el.attributes['style'] + ']]'
        end

        # Iterate through the rules and merge them into the HTML
       xxx@xxx.xxx do |selector, declaration, specificity, media_types|
          # Save un-mergable rules separately
          selector.gsub!(/:link([\s]*)+/i) {|m| $1 }

          # Convert element names to lower case
          selector.gsub!(/([\s]|^)([\w]+)/) {|m| $1.to_s + $2.to_s.downcase }

          if Premailer.is_media_query?(media_types) || selector =~ Premailer::RE_UNMERGABLE_SELECTORS
            @unmergable_rules.add_rule_set!(CssParser::RuleSet.new(selector, declaration), media_types) xxx@xxx.xxx
          else
            begin
              if selector =~ Premailer::RE_RESET_SELECTORS
                # this is in place to preserve the MailChimp CSS reset: http://github.com/mailchimp/Email-Blueprints/
                # however, this doesn't mean for testing pur
                @unmergable_rules.add_rule_set!(CssParser::RuleSet.new(selector, declaration))  unless xxx@xxx.xxx
              end

              # Change single ID CSS selectors into xpath so that we can match more
              # than one element.  Added to work around dodgy generated code.
              selector.gsub!(/\A\#([\w_\-]+)\Z/, xxx@xxx.xxx

              doc.search(selector).each do |el|
                if el.elem? and (el.name != 'head' and el.parent.name != 'head')
                  # Add a style attribute or append to the existing one
                  block = "[SPEC=#{specificity}[#{declaration}]]"
                  el['style'] = (el.attributes['style'].to_s ||= '') + ' ' + block
                end
              end
            rescue  ::Nokogiri::SyntaxError, RuntimeError, ArgumentError
              $stderr.puts "CSS syntax error with selector: #{selector}" xxx@xxx.xxx
              next
            end
          end
        end

        # Remove script tags
        xxx@xxx.xxx
          doc.search("script").remove
        end

        # Read STYLE attributes and perform folding
        xxx@xxx.xxx do |el|
          style = el.attributes['style'].to_s

          declarations = []
          style.scan(/\[SPEC\=([\d]+)\[(.[^\]\]]*)\]\]/).each do |declaration|
            rs = CssParser::RuleSet.new(nil, declaration[1].to_s, declaration[0].to_i)
            declarations << rs
          end

          # Perform style folding
          merged = CssParser.merge(declarations)
          merged.expand_shorthand!

          # Duplicate CSS attributes as HTML attributes
          if Premailer::RELATED_ATTRIBUTES.has_key?(el.name)
            Premailer::RELATED_ATTRIBUTES[el.name].each do |css_att, html_att|
              el[html_att] = merged[css_att].gsub(/url\('(.*)'\)/,'\1').gsub(/;$|\s*!important/, '').strip if el[html_att].nil? and not merged[css_att].empty?
            end
          end

          # Collapse multiple rules into one as much as possible.
          merged.create_shorthand!

          # write the inline STYLE attribute
          el['style'] = Premailer.escape_string(merged.declarations_to_s).split(';').map(&:strip).sort.join('; ')
        end

        doc = xxx@xxx.xxx

        if @options[:remove_classes] xxx@xxx.xxx
          doc.traverse do |el|
            if el.comment? xxx@xxx.xxx
              el.remove
            elsif el.element?
              el.remove_attribute('class') xxx@xxx.xxx
            end
          end
        end

        xxx@xxx.xxx
          # find all anchor's targets and hash them
          targets = []
          xxx@xxx.xxx do |el|
            target = el.get_attribute('href')[1..-1]
            targets << target
            el.set_attribute('href', "#" + Digest::MD5.hexdigest(target))
          end
          # hash ids that are links target, delete others
          xxx@xxx.xxx do |el|
            id = el.get_attribute('id')
            if targets.include?(id)
              el.set_attribute('id', Digest::MD5.hexdigest(id))
            else
              el.remove_attribute('id')
            end
          end
        end

        xxx@xxx.xxx
          xxx@xxx.xxx do |el|
            el.remove_attribute('contenteditable')
          end
        end

       xxx@xxx.xxx = doc
        if is_xhtml?
          # we don't want to encode carriage returns
          @processed_doc.to_xhtml(:encoding xxx@xxx.xxx "\r")
        else
          @processed_doc.to_html(:encoding xxx@xxx.xxx
        end
      end

      # Create a <tt>style</tt> element with un-mergable rules (e.g. <tt>:hover</tt>)
      # and write it into the <tt>body</tt>.
      #
      # <tt>doc</tt> is an Nokogiri document and <tt>unmergable_css_rules</tt> is a Css::RuleSet.
      #
      xxx@xxx.xxx [::Nokogiri::XML] a document.
      def write_unmergable_css_rules(doc, unmergable_rules) # :nodoc:
        styles = unmergable_rules.to_s

        unless styles.empty?
          style_tag = "<style type=\"text/css\">\n#{styles}</style>"
          if body = doc.search('body')
            if doc.at_css('body').children && !doc.at_css('body').children.empty?
              doc.at_css('body').children.before(::Nokogiri::XML.fragment(style_tag))
            else
              doc.at_css('body').add_child(::Nokogiri::XML.fragment(style_tag))
            end
          else
            doc.inner_html = style_tag += doc.inner_html
          end
        end
        doc
      end


      # Converts the HTML document to a format suitable for plain-text e-mail.
      #
      # If present, uses the <body> element as its base; otherwise uses the whole document.
      #
      xxx@xxx.xxx [String] a plain text.
      def to_plain_text
        html_src = ''
        begin
          html_src xxx@xxx.xxx
        rescue; end

        html_src xxx@xxx.xxx unless html_src and not html_src.empty?
        xxx@xxx.xxx @html_encoding)
      end

      # Gets the original HTML as a string.
      xxx@xxx.xxx [String] HTML.
      def to_s
        if is_xhtml?
         xxx@xxx.xxx => nil)
        else
         xxx@xxx.xxx => nil)
        end
      end

      # Load the HTML file and convert it into an Nokogiri document.
      #
      xxx@xxx.xxx [::Nokogiri::XML] a document.
      def load_html(input) # :nodoc:
        thing = nil

        # TODO: duplicate options
        if @options[:with_html_string] xxx@xxx.xxx or input.respond_to?(:read)
          thing = input
        xxx@xxx.xxx
         xxx@xxx.xxx = File.dirname(input)
          thing = File.open(input, 'r')
        else
          thing = open(input)
        end

        if thing.respond_to?(:read)
          thing = thing.read
        end

        return nil unless thing
        doc = nil

        # Handle HTML entities
        xxx@xxx.xxx == true and thing.is_a?(String)
          HTML_ENTITIES.map do |entity, replacement|
            thing.gsub! entity, replacement
          end
        end
        # Default encoding is ASCII-8BIT (binary) per http://groups.google.com/group/nokogiri-talk/msg/0b81ef0dc180dc74
        # However, we really don't want to hardcode this. ASCII-8BIG should be the default, but not the only option.
        if thing.is_a?(String) and RUBY_VERSION =~ /1.9/
          #thing = xxx@xxx.xxx #nms changed like https://coveralls.io/files/18174642
          thing = thing.force_encoding('UTF-8').encode! #nms changed like https://coveralls.io/files/18174642
          #doc = ::Nokogiri::HTML(thing, xxx@xxx.xxx {|c| c.recover } #nms changed like https://coveralls.io/files/18174642
          doc = ::Nokogiri::HTML(thing) {|c| c.recover } #nms changed like https://coveralls.io/files/18174642
        else
          default_encoding = RUBY_PLATFORM == 'java' ? nil : 'BINARY'
          doc = ::Nokogiri::HTML(thing, xxx@xxx.xxx || default_encoding) {|c| c.recover }
        end

        # Fix for removing any CDATA tags from both style and script tags inserted per
        # https://github.com/sparklemotion/nokogiri/issues/311 and
        # https://github.com/premailer/premailer/issues/199
        %w(style script).each do |tag|
          doc.search(tag).children.each do |child|
            child.swap(child.text()) if child.cdata?
          end
        end

        doc
      end

    end
  end
end
