namespace :add_name do
    task 'Default_name' => :environment  do
        @users = User.all
        @users.each do |user|
            if user.name.blank?
                user.name = 'Default'
                user.save
            end 

        end
    end
end