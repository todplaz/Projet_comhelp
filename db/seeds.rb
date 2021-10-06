# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = :fr

Message.destroy_all
Message.reset_pk_sequence

Conversation.destroy_all
Conversation.reset_pk_sequence

User.destroy_all
User.reset_pk_sequence

Category.destroy_all
Category.reset_pk_sequence

City.destroy_all
City.reset_pk_sequence

Post.destroy_all
Post.reset_pk_sequence

Participation.destroy_all
Participation.reset_pk_sequence


t1 = Time.parse("2020-11-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

category_array = ["Bricolage",
                "Jardinage",
                "Soutien scolaire",
                "Garde d'enfants",
                "Déménagement",
                "Dons de matériel", 
                "Service à la personne",
                "Animaux",
                "Informatique/Bureautique",
                "Administratif"]

picture_array = ["https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/Bricolage/Bricolage+1280.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/Bricolage/jardinage+1280.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/cours+particuliers/soutien+scolaire.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/enfants/les+petits+nouveau+2.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/demenagement/d%C3%A9m%C3%A9nagement.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/dons/dons+de+materiel.jpeg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/Service+%C3%A0+la+personne/services-%C3%A0-la-personne.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/animaux/Animaux.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/informatique_bureautique/computer-1245714_640.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/administratif/Administratif.jpg"]

20.times do
    City.create(city_name: Faker::Address.unique.city)
end

(category_array.length).times do |i|
    Category.create(name: category_array[i],
    picture_url: picture_array[i])
end

5.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email(domain: 'yopmail.com'), password: "password")
end  

post_titles = ['besoin d\'un coup de main pour déménagement','recherche aide aux devoirs maths et français pour élève de CE2','mon pc ne démarre plus et reste figé sur écran noir','cherche aimable personne pour arroser une plante tous les deux jours après mon départ', 'cherche quelqu\'un pour garder mon chat','je recherche une tournevis en étoile à six branches','cherche vieille table basse ou meuble télé à donner','besoin d\'aide pour remplir ma première déclaration d\'impôts']

post_titles.length.times do |i|
    Post.create(datetime: rand(t1..t2), title: post_titles[i], user: User.all.sample, description: Faker::Lorem.sentence(word_count: 30), city: City.all.sample, category: Category.all.sample)
  end

5.times do
    Participation.create(user: User.all.sample, post: Post.all.sample)
end


User.create(first_name: "Admin", last_name: "admin", email: "comhelp@yopmail.com", password: "123456", is_admin: true)
