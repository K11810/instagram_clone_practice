class ContactMailer < ApplicationMailer

    def contact_mail(contact)
     @picture = contact
     mail to: 'fastofall6545@gmail.com', subject: "お問い合わせの確認メール"
    end

end
