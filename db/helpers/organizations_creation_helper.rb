#encoding: utf-8
module OrganizationsCreationHelper

  class << self

    def create_organizations(times)
      puts 'Creating Organizations'

      1.upto(times) do |time|
        organization = Organization.create(
          name: "Organization #{time}",
          description: Faker::Lorem.sentence,
          locality: Faker::Address.city,
          user_ids: User.all.pluck(:id).sample(rand(1..User.count))
        )
        create_comments(organization, rand(0..30))
      end

      puts 'Finished Creating Organizations'
    end

    private

    def create_comments(organization, times)
      1.upto(times) do |time|
        Comment.create(
          user: User.all.sample,
          message: Faker::Lorem.paragraph,
          commentable: organization,
          commentable_type: 'Organization'
        )
      end
    end

  end

end
