# This file was auto-generated by lib/tasks/web.rake

desc 'UsergroupsUsers methods.'
command 'usergroups_users' do |g|
  g.desc 'This method returns a list of all users within a User Group.'
  g.long_desc %( This method returns a list of all users within a User Group. )
  g.command 'list' do |c|
    c.flag 'usergroup', desc: 'The encoded ID of the User Group to update.'
    c.flag 'include_disabled', desc: 'Allow results that involve disabled User Groups.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.usergroups_users_list(options))
    end
  end

  g.desc 'This method updates the list of users that belong to a User Group. This method replaces all users in a User Group with the list of users provided in the users parameter.'
  g.long_desc %( This method updates the list of users that belong to a User Group. This method replaces all users in a User Group with the list of users provided in the users parameter. )
  g.command 'update' do |c|
    c.flag 'usergroup', desc: 'The encoded ID of the User Group to update.'
    c.flag 'users', desc: 'A comma separated string of encoded user IDs that represent the entire list of users for the User Group.'
    c.flag 'include_count', desc: 'Include the number of users in the User Group.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.usergroups_users_update(options))
    end
  end
end