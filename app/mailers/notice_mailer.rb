class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_recipe.subject
  #
  def sendmail_recipe(recipe)
    @recipe = recipe

    mail to: "misatatesawa@gmail.com",
      subject: '【 sakana 】 レシピが投稿されました'
  end

  def sendmail_contact(contact)
    @contact = contact

    mail to:@contact.email,
         subject: '【 sakana 】お問い合わせが完了しました'
  end

end
