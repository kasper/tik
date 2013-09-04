# Kasper

user = User.create(:username => 'kasper')

user.tasks.create(:description => 'Create a new task', :completed => false)
user.tasks.create(:description => 'Code Tik', :completed => false)

# Jack

user = User.create(:username => 'jack')

user.tasks.create(:description => 'Create another task', :completed => false)
