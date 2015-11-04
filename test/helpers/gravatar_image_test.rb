require 'test_helper'

class GravatarImageTest < ActionView::TestCase
  include ApplicationHelper


  test 'render image' do
    html = Nokogiri::HTML(gravatar_image('john@example.com')).css('img').first

    assert html.matches?('img.gravatar')
    assert_equal '//gravatar.com/avatar/d4c74594d841139328695756648b6bd6?d=mm', html['src']
  end
end
