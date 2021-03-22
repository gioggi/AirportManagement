# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable
  validates :first_name, :last_name, :language, :currency, :time_zone, presence: true
  validates :currency, inclusion: { in: %w[USD EUR] }
  validates :language, inclusion: { in: %w[it en] }
  validates :time_zone, inclusion: { in: TZInfo::Timezone.all_identifiers }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
