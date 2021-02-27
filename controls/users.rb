allowed_users = %w(gweasley fweasley hpotter ppatil adumbledore hgranger gweasley1)
dumbledore_army_users = %w(gweasley fweasley hpotter ppatil)

control 'Authorized users' do
  title 'Authorized Users exist'
  desc 'Checks that only authorized users exist'
  users.where { uid > 1000 && uid < 65534 }.usernames.sort.each do |u|
    describe user(u) do
      if allowed_users.include?(u)
        it { should exist }
      else
        it { should_not exist }
      end
    end
  end
end

control 'Dumbledore\'s Army' do
  title 'Checks for Membership in Dumbledore\'s Army'
  desc 'Check if expected users are in Dubldeore\'s Army'
  users.where { uid > 1000 && uid < 65534 }.usernames.sort.each do |u|
    describe user(u) do
      if dumbledore_army_users.include?(u)
        its('groups') { should include 'da' }
      else
        its('groups') { should_not include 'da' }
      end
    end
  end
end
