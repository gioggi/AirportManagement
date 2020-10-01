class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :language, :currency, :time_zone
  validates_inclusion_of :currency, :in => %w[USD EUR]
  validates_inclusion_of :language, :in => %w[it en]
  validates_inclusion_of :time_zone, :in => TZInfo::Timezone.all_identifiers
end
