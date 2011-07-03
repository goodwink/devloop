# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :task do |f|
  f.name "Test Task"
  f.description "This is a test task"
  f.estimate 7
end