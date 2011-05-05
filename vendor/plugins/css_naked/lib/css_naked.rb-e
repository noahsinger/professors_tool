#
# This Rails plugin overrides the stylesheet_link_tag helper and modifies
# it to skip outputting stylesheet link tags on css naked day. Css naked
# day is an annual event where websites remove all css from their site to
# promote web standards. See http://naked.dustindiaz.com for more info.
#
module CssNaked
  module ViewHelpers
    class << self
      def included (base) # :nodoc:
        base.class_eval do
          alias_method_chain :stylesheet_link_tag, :css_naked
        end
      end
    end

    # Previous naked days: 2006-04-05, 2007-04-05, 2008-04-09
    # Current naked day: 2009-04-09
    # Future naked days unfortunately have to be updated manually
    # since there's no strict rule to determine the exact date.
    # See also http://naked.dustindiaz.com/
    xxx@xxx.xxx = Date.new(2009, 4, 9).to_time(:udt).freeze
    xxx@xxx.xxx = Date.new(2009, 4, 9).to_time(:local).freeze
   xxx@xxx.xxx = Date.new(2011, 4, 9).to_time(:local).freeze

    # Returns true if today is a css naked day
    def css_naked?
      Time.current >= @@css_naked_date - 0.hours && Time.current xxx@xxx.xxx + 0.hours
    end

    # Modified stylesheet_link_tag that does nothing on css naked day
    def stylesheet_link_tag_with_css_naked (*args)
      stylesheet_link_tag_without_css_naked(*args) unless css_naked?
    end
  end
end

ActionView::Base.send :include, CssNaked::ViewHelpers
