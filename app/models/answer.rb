class Answer < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :text, message: "You haven't answered the question yet"

  default_scope { order(created_at: :desc) }
end
