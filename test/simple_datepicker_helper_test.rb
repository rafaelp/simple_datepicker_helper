require 'test/unit'
require 'rubygems'

require File.dirname(__FILE__) + '/../../../../config/environment'

class SimpleDatepickerHelperTest < Test::Unit::TestCase

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::JavaScriptHelper
  include SimpleDatepickerHelper::Helpers::ViewHelpers

  def test_simple_datepicker_for
    $SIMPLE_DATEPICKER_OPTIONS = nil
    output = simple_datepicker_for('myfieldid')
    expected_output = '<script type="text/javascript">
//<![CDATA[
var simple_datepicker_myfieldid = new DatePicker({"relative": "myfieldid"});
//]]>
</script>'
    assert_equal(expected_output, output)

    $SIMPLE_DATEPICKER_OPTIONS = nil
    output = simple_datepicker_for('myfieldid', {:keepFieldEmpty => true})
    expected_output = '<script type="text/javascript">
//<![CDATA[
var simple_datepicker_myfieldid = new DatePicker({"relative": "myfieldid", "keepFieldEmpty": true});
//]]>
</script>'
    assert_equal(expected_output, output)

    $SIMPLE_DATEPICKER_OPTIONS = {:language => 'pt'}
    output = simple_datepicker_for('myfieldid', {:keepFieldEmpty => false})
    expected_output = '<script type="text/javascript">
//<![CDATA[
var simple_datepicker_myfieldid = new DatePicker({"language": "pt", "relative": "myfieldid", "keepFieldEmpty": false});
//]]>
</script>'
    assert_equal(expected_output, output)
  end

  def test_simple_datepicker_includes
    stylesheets = stylesheet_link_tag('simple_datepicker')
    javascripts = javascript_include_tag('simple_datepicker')
    assert_equal(stylesheets + javascripts, simple_datepicker_includes)
  end

end
