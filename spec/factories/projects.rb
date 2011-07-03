# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :project do |f|
  f.name "Test Project"
  f.slug "test_project"
  f.description "MyString"
  f.gitorious_repo "http://git.devscoop.com/test/test.git"
  f.statusnet_topic "#test"
end