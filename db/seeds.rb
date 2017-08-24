User.delete_all
Message.delete_all
User.create(email: 'bob@aol.com', password: 'abc123')
User.create(email: 'bob1@aol.com', password: 'abc123', color: '#FCF3CF', photo: 'https://www.jamf.com/jamf-nation/img/default-avatars/generic-user.png')
User.create(email: 'bob2@aol.com', password: 'abc123', color: '#FCF3CF', photo: 'https://www.jamf.com/jamf-nation/img/default-avatars/generic-user.png')