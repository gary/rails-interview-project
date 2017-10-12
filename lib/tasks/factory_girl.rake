# frozen_string_literal: true

require 'English'

namespace :factory_girl do
  desc 'Verify that all FactoryGirl factories are valid'
  task lint: :environment do
    if Rails.env.test?
      DatabaseCleaner.cleaning do
        FactoryGirl.lint
      end
    else
      system("bundle exec rake factory_girl:lint RAILS_ENV='test'")
      exit $CHILD_STATUS.exitstatus
    end
  end
end
