class TransferService
  def perform(user, company, amount_cents)
    ActiveRecord::Base.transaction do
      raise ActiveRecord::RecordInvalid unless amount_cents.is_a? Integer

      user.update!(balance_cents: user.balance_cents + amount_cents) # gem money rails
      company.update!(balance_cents: company.balance_cents - amount_cents)

      Transfer.transaction do
        Transfer.create!(balance_cents: amount_cents, user: user, company: company)
      end
    end
  rescue ActiveRecord::RecordInvalid
    puts 'Invalid value for amount_cents'
  end
end

# TransferService.perform(user, company, 500)
