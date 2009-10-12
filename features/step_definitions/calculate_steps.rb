Then /^I get insurance payment of (.*) euros$/ do |payment|
  @browser.type('employer_address', '')
  @browser.wait_for_condition('selenium.isElementPresent("//span[@id=\'calculated_amount\']");', 5000)
  @browser.get_text('calculated_amount').should eql(payment + '.00 €')
end  

Then /^I am informed about too high salary$/ do
  pending
end

