# Software Team

team = Team.create(:name => 'Software')

# Kasper

user = User.create(:username => 'kasper', :team_id => team.id)

user.tasks.create(:description => 'Create a new task', :completed => false)
user.tasks.create(:description => 'Code Tik', :completed => false)

# Jack

user = User.create(:username => 'jack', :team_id => team.id)

user.tasks.create(:description => 'Create another task', :completed => false)
