# SimpleDatepicker

module SimpleDatepickerHelper
  module Helpers
    module ViewHelpers
      def simple_datepicker_for(field_id, options = {})
        options.merge! $SIMPLE_DATEPICKER_OPTIONS unless $SIMPLE_DATEPICKER_OPTIONS.nil?
        options[:relative] = field_id
        javascript_tag("var simple_datepicker_#{field_id} = new DatePicker(#{options.to_json});")
      end

      def simple_datepicker_includes(frontend = :default)
        stylesheets = stylesheet_link_tag('simple_datepicker')
        javascripts = javascript_include_tag('simple_datepicker')
        stylesheets + javascripts
      end
    end
  end
end
