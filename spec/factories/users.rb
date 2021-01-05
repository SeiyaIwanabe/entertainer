FactoryBot.define do

  factory :user do
    nickname                 {"源頼朝"}
    email                    {"yoritomo@yoritomo"}
    password                 {"yoritomo1192"}
    password_confirmation    {"yoritomo1192"}
    genre                    {"ヒップホップダンス"}
    introduction             {"最高のエンターテインメントを提供いたします。"}
  end

end