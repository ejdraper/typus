require "test/test_helper"

class TypusTest < ActiveSupport::TestCase

  def test_should_verify_configuration_options
    assert_equal "Typus", Typus.app_name
    assert Typus.config_folder.kind_of?(Pathname)
    assert_equal "columbia", Typus.default_password
    assert_equal nil, Typus.email
    assert_equal :typus_preview, Typus.file_preview
    assert_equal :typus_thumbnail, Typus.file_thumbnail
    assert_equal "typus_users", Typus.relationship
    assert_equal "admin", Typus.master_role
    assert_equal "TypusUser", Typus.user_class_name
    assert_equal "typus_user_id", Typus.user_fk
  end

  def test_should_return_root
    expected = Dir.pwd
    assert Typus.root.kind_of?(String)
    assert_equal expected, Typus.root
  end

  def test_should_return_applications_and_should_be_sorted
    assert Typus.respond_to?(:applications)
    assert Typus.applications.kind_of?(Array)
    assert_equal %w( Blog Site System Typus ), Typus.applications
  end

  def test_should_return_modules_of_an_application
    assert Typus.respond_to?(:application)
    assert_equal %w( Comment Picture Post ), Typus.application('Blog')
  end

  def test_should_return_models_and_should_be_sorted
    assert Typus.respond_to?(:models)
    assert Typus.models.kind_of?(Array)
    assert_equal %w( Asset Category Comment CustomUser Delayed::Task Page Picture Post TypusUser View ), Typus.models
  end

=begin
  # FIXME
  def test_should_return_an_array_of_models_on_header
    assert Typus.models_on_header.kind_of?(Array)
    assert_equal ["Page"], Typus.models_on_header
  end
=end

  def test_should_verify_resources_class_method
    assert Typus.respond_to?(:resources)
    assert_equal %w( Git Order Status WatchDog ), Typus.resources
  end

  def test_should_return_user_class
    assert_equal TypusUser, Typus.user_class
  end

=begin
  # FIXME
  def test_should_return_overwritted_user_class
    Typus.expects(:user_class_name).returns("CustomUser")
    assert_equal CustomUser, Typus.user_class
  end
=end

  def test_should_return_user_fk
    assert_equal "typus_user_id", Typus.user_fk
  end

  def test_should_return_overwritted_user_fk
    Typus.expects(:user_fk).returns("my_user_fk")
    assert_equal "my_user_fk", Typus.user_fk
  end

end
