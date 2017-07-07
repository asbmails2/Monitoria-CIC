When(/^I press to Log In/) do
  visit  path_to('Sing In page')
end

Given(/^the following users exist:$/) do |table|
  table.hashes.each do |user|
    User.create user
  end
end

Given(/^the following disciplinas exist:$/) do |table|
  table.hashes.each do |d|
    Disciplina.create d
  end
end
When(/^I press input Log in$/) do
  click_on 'Log in'
end

When(/^I press Adicionar$/) do
  visit('/disciplinas/new')
end

Then (/^I am sign_in$/) do
  if(sign_in?)
    visit ('/home')
  else
    visit ('/users/new')
  end
end
