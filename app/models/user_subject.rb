class UserSubject < ActiveRecord::Base
  before_save :default_values

  belongs_to :user, class_name: "User"
  belongs_to :subject, class_name: "Subject"

  validates :user, presence: true
  validates :subject, presence: true

  private
  def default_values
    self.status = 0 if self.status.nil?
  end
end
