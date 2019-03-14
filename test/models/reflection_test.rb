require 'test_helper'
class ReflectionTest < ActiveSupport::TestCase

   test "reflection fields must not be empty" do
     Reflection = Reflection.new
     assert Reflection.invalid?
     assert Reflection.errors[:reaction].any?
     assert Reflection.errors[:title].any?
     assert Reflection.errors[:week].any?
     assert Reflection.errors[:student].any?
  end

  test "reflection responds to student_name getter" do
    @reflection = reflections(:one)
    assert_equal @reflection.student_name, reflections(:one).student.name
  end

  test "reflection responses to student_name setter" do
  @reflection = reflections(:one)
  @reflection.student_name = students(:leila).name
  @reflection.save
  assert_equal @reflection.student_name, students(:leila).name
  end
  # setup do
  #   @one = reflections(:one)
  # end
  #
  # test "reflection is not valid without a unique title" do
  #   @two = reflections(:two)
  #   @one.title = @two.title
  #   assert @one.invalid?
  # end
  #
  # test "week must be positive" do
  #   @one.week = -1
  #   assert @one.invalid?
  #
  #   @one.week = 0
  #   assert @one.invalid?
  #
  #    @one.week = 1
  #   assert @one.valid?
  # end
  # test "reflection title must be unique on a given week and reaction" do
  #   @one = reflections(:one)
  #   # Duplicate the app reflection's title and identifier from HCI
  #   @one.reaction = reflections(:two).reaction
  #   @one.title = reflections(:two).title
  #   assert_not @one.valid?
  # end
end
