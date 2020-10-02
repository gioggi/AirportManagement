class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable
  validates_presence_of :first_name, :last_name, :language, :currency, :time_zone
  validates_inclusion_of :currency, :in => %w[USD EUR]
  validates_inclusion_of :language, :in => %w[it en]
  validates_inclusion_of :time_zone, :in => TZInfo::Timezone.all_identifiers
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
