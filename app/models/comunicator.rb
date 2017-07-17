class Comunicator < MailForm::Base
  attribute :emails
  attribute :assunto
  attribute :mensagem
  attribute :ong

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{assunto}",
      :to => "#{emails}",
      :from => %(#{ong.name} < #{ong.email}>)
    }
  end
end
