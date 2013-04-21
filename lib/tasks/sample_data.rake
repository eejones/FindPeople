namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Member.create!(username: "Sample5Member",
                 email: "sample5user@makemeastar.com",
                 password: "password",
                 password_confirmation: "password")
    25.times do |n|
      username  = Faker::Name.name
      email = "sampleuser-#{n+1}@makemeastar.com"
      password  = "password"
      act = true
      produce = true
      direct = false
      camera = true
      extra = false
      pa = false
      write = true
      sound = false
      wardrobe = true
      setdesign = false
      stunt = true
      marketing = false
      paid = true
      admin = false
      Member.create!(username: username,
                   email: email,
                   act: act,
                   produce: produce,
                   direct: direct,
                   camera: camera,
                   extra: extra,
                   pa: pa,
                   write: write,
                   sound: sound,
                   wardrobe: wardrobe,
                   setdesign: setdesign,
                   stunt: stunt,
                   marketing: marketing,
                   paid: paid,
                   admin: admin,
                   password: password,
                   password_confirmation: password)

    end
    20.times do |n|
      username  = Faker::Name.name
      email = "sampletime-#{n+1}@makemeastar.com"
      password  = "password"
      act = false
      produce = false
      direct = true
      camera = false
      extra = true
      pa = true
      write = false
      sound = true
      wardrobe = false
      setdesign = true
      stunt = false
      marketing = true
      paid = false
      admin = false
      Member.create!(username: username,
                   email: email,
                   act: act,
                   produce: produce,
                   direct: direct,
                   camera: camera,
                   extra: extra,
                   pa: pa,
                   write: write,
                   sound: sound,
                   wardrobe: wardrobe,
                   setdesign: setdesign,
                   stunt: stunt,
                   marketing: marketing,
                   paid: paid,
                   admin: admin,
                   password: password,
                   password_confirmation: password)

    end
    25.times do |n|
      username  = Faker::Name.name
      email = "samplemember-#{n+1}@makemeastar.com"
      password  = "password"
      act = true
      produce = true
      direct = true
      camera = true
      extra = true
      pa = true
      write = true
      sound = true
      wardrobe = true
      setdesign = true
      stunt = true
      marketing = true
      paid = true
      admin = false
      Member.create!(username: username,
                   email: email,
                   act: act,
                   produce: produce,
                   direct: direct,
                   camera: camera,
                   extra: extra,
                   pa: pa,
                   write: write,
                   sound: sound,
                   wardrobe: wardrobe,
                   setdesign: setdesign,
                   stunt: stunt,
                   marketing: marketing,
                   paid: paid,
                   admin: admin,
                   password: password,
                   password_confirmation: password)

    end
    10.times do |n|
      username  = Faker::Name.name
      email = "fakeuser-#{n+1}@makemeastar.com"
      password  = "password"
      act = false
      produce = false
      direct = false
      camera = false
      extra = false
      pa = false
      write = false
      sound = false
      wardrobe = false
      setdesign = false
      stunt = false
      marketing = false
      paid = false
      admin = false
      Member.create!(username: username,
                   email: email,
                   act: act,
                   produce: produce,
                   direct: direct,
                   camera: camera,
                   extra: extra,
                   pa: pa,
                   write: write,
                   sound: sound,
                   wardrobe: wardrobe,
                   setdesign: setdesign,
                   stunt: stunt,
                   marketing: marketing,
                   paid: paid,
                   admin: admin,
                   password: password,
                   password_confirmation: password)

    end
  end
end
