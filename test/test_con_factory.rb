require 'rubygems'
require 'expectations'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/con_factory'

c = ConFactory.parse(File.dirname(__FILE__) + '/test_con_factory.yml')

Expectations do
  expect 'one' do
    c.test_string
  end
  expect Array do 
    c.test_array.class
  end
  expect "Array One" do
    c.test_array[0].name
  end
  expect 1 do
    c.test_array[0].value
  end
  expect "Array Two" do
    c.test_array[1].name
  end
  expect 2 do
    c.test_array[1].value
  end
  expect "Nested Array One" do
    c.test_array[2].test_nested_array[0].name
  end
  expect 1 do
    c.test_array[2].test_nested_array[0].value
  end
  expect "Nested Array Two" do
    c.test_array[2].test_nested_array[1].name
  end
  expect 2 do
    c.test_array[2].test_nested_array[1].value
  end
  expect "Today Is: #{Time.now.strftime('%Y%m%d')}" do
    c.test_today
  end
  expect "Yesterday Was: #{(Time.now - 86400).strftime('%Y%m%d')}" do
    c.test_yesterday
  end
  expect "Temp Dir Is: #{Dir.tmpdir}" do
    c.test_temp
  end

end
