class DocumentValidator < ActiveModel::Validator
  def validate(record)
    if record.on_board
      if record.passport.blank? || record.first_name.blank? || record.last_name.blank?
        record.errors.add(:record, "document without data")
      end
    elsif record.on_board == nil
      record.errors.add(:record, "can't be nil")
    end
  end
end