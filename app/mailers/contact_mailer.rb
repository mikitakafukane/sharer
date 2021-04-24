class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"chipmunk.kawaii.1126@gmail.com", subject: "お問い合わせ通知"
  end
end
