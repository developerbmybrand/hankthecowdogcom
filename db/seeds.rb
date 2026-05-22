# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#TypeContentPage.delete_all
#TypeContentPage.create(:type_name => 'Home Page', :type_location => '')
#TypeContentPage.create(:type_name => 'Books', :type_location => 'books')
#TypeContentPage.create(:type_name => 'Fan Zone', :type_location => 'fanzone')
#TypeContentPage.create(:type_name => 'Friends', :type_location => 'friends')
#TypeContentPage.create(:type_name => 'Educational Resources', :type_location => 'educational')
#TypeContentPage.create(:type_name => 'Author', :type_location => 'author')
#TypeContentPage.create(:type_name => 'Security Force', :type_location => 'securityforce')

#TypeBlogCategory.delete_all
#TypeBlogCategory.create(:type_name => 'Blog Post')
#TypeBlogCategory.create(:type_name => 'Security Force Post')
#TypeBlogCategory.create(:type_name => 'Event')

Secforce.delete_all
Secforce.create(:secforce_username => 'testuser', :secforce_password => 'testuser')

User.delete_all
User.create(:email => 'caedmon@statebuilt.com', :password => 'e10adc3949ba59abbe56e057f20f883e', :first_name => 'Caedmon', :last_name => 'Judd')

