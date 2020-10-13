# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger, optional: true
  validates :passenger, presence: { if: :booking_date_present? }
  validates :price, :number, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0.01, less_than_or_equal_to: 10_000 }
  validates :number, numericality: { greater_than: 0 }

  def locale_price
    if (defined? current_user) && (current_user.currency != 'EUR')
      eu_bank = EuCentralBank.new
      update_rates(eu_bank)
      eu_bank.exchange(price, 'EUR', current_user.currency) # Money.new(80, "USD")
    else
      price
    end
  end

  private

  def booking_date_present?
    booking_date.present?
  end

  def update_rates(bank)
    cache = 'tmp/exchange_rates.xml'
    if !bank.rates_updated_at || bank.rates_updated_at < Time.zone.now - 1.day
      bank.save_rates(cache)
      bank.update_rates(cache)
    end
  end
end
