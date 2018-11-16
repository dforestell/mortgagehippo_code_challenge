class NotifyAdmins < ActionMailer::Base
  default to: -> { Admin.pluck(:email) },
  	from: "hippochallenge1@gmail.com"

  def send_coin_creation(coin)
    @coin = coin
    mail(subject: "#{@coin.name} was just created")
  end

  def low_quantity(coin)
  	@coin = coin
    mail(subject: "#{@coin.name} has a low balance")
  end
end