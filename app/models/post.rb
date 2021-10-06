require 'twitter'

class Post < ApplicationRecord
   after_create :email_to_admin
	 after_commit :automatic_tweet

    belongs_to :user
    belongs_to :category
    belongs_to :city
    has_many :participations
    has_many :users, through: :participations
    
    
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000}
   

    def email_to_admin
	    AdminMailer.new_ad_notification(self).deliver_now
    end

    include AlgoliaSearch
    
    algoliasearch per_environment: true do
        attribute :category, :city, :title, :description
    end
    
    
    def automatic_tweet
        if self.is_validated == true
    
        client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
      end
        client.update("Annonce postée à #{self.city.city_name} : #{self.description}")
      end
    end
end


