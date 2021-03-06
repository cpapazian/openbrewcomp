# -*- coding: utf-8 -*-

class Strength < ActiveRecord::Base
  include ExportHelper

  validates_presence_of :description
  validates_uniqueness_of :description, :case_sensitive => false,
                                        :message => 'already exists'
  validates_length_of :description, :maximum => 40, :allow_blank => true

  validates_presence_of :position
  validates_uniqueness_of :position, :message => "already exists"
  validates_numericality_of :position, :only_integer => true, :allow_blank => true

  def to_label
    description
  end

  # Export settings
  self.csv_columns = [ 'id', 'description' ]

  protected

    def before_validation
      description.squish! unless description.nil?
      self.position = (Strength.maximum(:position) || 0) + 1 if position.blank?
    end

    def validate
      errors.add(:position, "must be positive") if position.kind_of?(Integer) && position < 0
    end

end
