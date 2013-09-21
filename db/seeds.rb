# Software Team

team = Team.create!(:name => 'Software')

# Tags

tag_critical = Tag.create(:name => 'critical')
tag_enhancement = Tag.create(:name => 'enhancement')
tag_feature_test = Tag.create(:name => 'feature-test')

# Kasper

user = User.create!(:username => 'kasper', :password => 'repsak44', :password_confirmation => 'repsak44', :team_id => team.id)

task = user.tasks.create!(:description => 'Create a new task', :completed => false, :creator_id => user.id)

task.tags << tag_critical
task.tags << tag_feature_test
task.save!

task = user.tasks.create!(:description => 'Code Tik', :completed => false, :creator_id => user.id)

task.tags << tag_critical
task.tags << tag_enhancement
task.save!

# Jack

user = User.create!(:username => 'jack', :password => 'kcaj2222', :password_confirmation => 'kcaj2222', :team_id => team.id)

task = user.tasks.create!(:description => 'Create another task', :completed => false, :creator_id => user.id)

task.tags << tag_feature_test
task.save!
