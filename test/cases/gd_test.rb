require_relative '../test_helper'

class GDTest < Minitest::Test
  
  { png: true, jpg: true, gif: false }.each do |format, true_color|
    define_method "test_#{format}_dimensions" do
      image = GD::Image.import(root.join('data', "test.#{format}"))
      assert_kind_of GD::Image, image
      assert_equal 241, image.width
      assert_equal 224, image.height
      assert_equal true_color, image.true_color?
    end
    
    define_method "test_guessing_#{format}_format" do
      image = GD::Image.import(root.join('data', "test_#{format}"))
      assert_kind_of GD::Image, image
    end
  end
  
  
  
  private
  
  def root
    Pathname.new(File.dirname(__FILE__)).join('..').realpath
  end
end