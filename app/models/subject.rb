class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50}, uniqueness:true
  accepts_nested_attributes_for :tasks, reject_if: {|attr| attr[:name].blank?},
                                                            allow_destroy: true
end