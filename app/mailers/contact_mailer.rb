class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"arsene.miyaniii.4@gmail.com", subject: "お問い合わせ通知"
  end
end
