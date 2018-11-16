class NotifyAdmins < ActionMailer::Base
  default to: -> { Admin.pluck(:email) },
  	from: "coinmachine@example.com"

  def send_coin_creation(coin)
    @coin = coin
    mail(subject: "#{@coin.name} was just created")
  end
end