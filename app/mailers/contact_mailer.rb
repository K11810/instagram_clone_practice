class ContactMailer < ApplicationMailer

    def contact_mail(contact)
     @picture = contact
     mail to: @picture.user.email, subject: "お問い合わせの確認メール"
    end

end
