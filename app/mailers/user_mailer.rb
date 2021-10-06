class UserMailer < ApplicationMailer
  default from: 'marinekouadio@yahoo.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://projet-comhelp-develop.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

end
