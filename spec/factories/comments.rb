# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    sequence(:content) {|n| "this is comment number #{n}" }
    sequence(:video_title) {|n| "video title of comment #{n}" }
  end
end
