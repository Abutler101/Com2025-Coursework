require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test 'should not save without a name' do
    sect = Section.new
    assert !sect.save
  end
  test 'should save a valid section' do
    sect = Section.new(name: "Unique sect name")
    assert sect.save
  end
  test 'should not save a duplicate section' do
    sect1 = Section.new(name: 'Unique sect name')
    sect2 = Section.new(name: 'Unique sect name')
    sect1.save
    assert !sect2.save
  end
  test 'section should have products' do
    assert_equal 2, sections(:one).products.size
  end
end
