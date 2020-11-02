class AttendanceMailer < ApplicationMailer
  default from: 'moidylanquieenvoye@yopmail.com'

  def new_participant_mail(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = attendance.event.admin
    @event = attendance.event

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Un nouveau participant à votre événement !') 
  end
end
