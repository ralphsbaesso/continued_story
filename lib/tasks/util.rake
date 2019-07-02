namespace :util do
  desc 'setup'
  task setup: :environment do

    user = User.first || User.create!(name: :user_default, email: 'user@user.com', password: '123456')

    5.times do
      history = History.create!(
         title: Faker::Name.name,
         description: Faker::FunnyName.name,
         user: user
      )

      [2, 5, 7,10].sample.times do
        Chapter.create!(
            title: Faker::Name.name,
            description: Faker::FunnyName.name,
            content: Faker::Lorem.paragraph,
            history: history
        )
      end
    end

  end

end