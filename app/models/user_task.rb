class UserTask < ActiveRecord::Base
  before_save :default_values

  belongs_to :user, class_name: "User"
  belongs_to :task, class_name: "Task"

  validates :user, presence: true
  validates :task, presence: true

  private
  def default_values
    self.status = 0 if self.status.nil?
  end
end
