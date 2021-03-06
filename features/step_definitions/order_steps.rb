require 'rest_client'

Given /^I have given the month and year of employment$/ do
end

Given /^I have given required data$/ do
  fill_obligatory_fields
end

When /^I order the information package$/ do
  @browser.click 'employer_submit'
  @browser.wait_for_page_to_load(1000)
end

When /^I order the invoice$/ do
  @browser.click 'employer_submit'
  @browser.wait_for_page_to_load(2000)
end

Then /^the order is registered$/ do
  count = @db.get_first_value("select count(*) from employers where ssn = '#@ssn'" )
  count.to_i.should eql 1
end

Then /^the data is reported to billing system$/ do
  ret = RestClient.get "http://localhost:3001/invoices/#{@agreement_id}.xml"
  ret.should match '.*ok.*'
end

def fill_obligatory_fields()
 fill_employer_data
 fill_employee_data 
end


