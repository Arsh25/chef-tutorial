houses = %w(Gryffindor Hufflepuff Ravenclaw Slytherin )
gryffindor_members = %w(hpotter gweasley fweasley hgranger gweasley1 nlongbottom ppatil1)
ravenclaw_members = %w(cchang ppatil llovegood)
slytherin_members = %w(ssnape dmalfoy)

control 'Check house groups' do
  title 'Check if all 4 house gorups exist'
  desc 'Check for the existance of house groups'
  houses.each do |h|
    describe group(h) do
      it { should exist }
    end
  end
end

control 'Check House Members' do
  title 'Check members of each house'
  desc ' Checks if all users are in the correct house'
  users.where { uid > 1000 && uid < 65534 }.usernames.sort.each do |u|
    describe user(u) do
      if gryffindor_members.include?(u)
        its('groups') { should include 'gryffindor' }
      elsif ravenclaw_members.include?(u)
        its('groups') { should include 'ravenclaw' }
      elsif slytherin_members.include?(u)
        its('groups') { should include 'slytherin' }
      end
    end
  end
end

control 'Secret House Directories' do
  title 'Checks state of secret house directories'
  desc 'Check permissions and exitance of secret house directories'
  houses.each do |h|
    describe directory("/opt/#{h}") do
      it { should exist }
      its('mode') { should cmp '0770' }
      its('group') { should eq "#{h}" }
    end
  end
end
