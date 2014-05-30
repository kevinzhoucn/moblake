Given /^there is a visiter$/ do
end

When /^I visit the home page$/ do
  visit(root_path)
end

Then /^I should see menu:$/ do |menu_items|
  menu_items.hashes.map do |menu_item|
    page.should have_content(menu_item['menu'])
  end
end

And /^I should see content:$/ do |content_items|
  content_items.hashes.map do |content_item|
    page.should have_content(content_item['content'])
  end
end

#  "([^'']*)", "([^'']*)", "([^'']*)", "([^'']*)", "([^'']*)", "([^'']*)", "([^'']*)"$/ do |menu1, menu2, menu3, menu4, menu5, menu6, menu7|
#   page.should have_content(menu1)
#   page.should have_content(menu2)
#   page.should have_content(menu3)
#   page.should have_content(menu4)
#   page.should have_content(menu5)
#   page.should have_content(menu6)
#   page.should have_content(menu7)
# end

# Given /^there is a User$/ do
#   FactoryGirl.create(:user)
# end

# Given /^the User has posted the message with title "([^'']*)" and body "([^'']*)"$/ do |message_title, message_body|
#   User.count.should == 1
#   @post = FactoryGirl.create(:message, title: message_title, content: message_body, user: User.first)
#   Post.count.should == 1
# end

# When /^I visit the page from Post index$/ do
#   User.count.should == 1
#   Post.count.should == 1
#   visit(posts_path)
# end

# Then /^I should see title "([^'']*)"$/ do |text|
#   page.should have_content(text)
# end

# When /^I visit the page from single Post path page$/ do
#   User.count.should == 1
#   Post.count.should == 1
#   visit(post_path(@post))
# end

# Then /^I should see body "([^'']*)"$/ do |text|
#   page.should have_content(text)
# end