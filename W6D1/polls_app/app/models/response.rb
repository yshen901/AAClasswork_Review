class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :check_for_previous_response

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    if self.id
      self.question.responses.where("responses.id != ?", self.id)
    else
      self.question.responses
    end
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  private
  def check_for_previous_response
    if respondent_already_answered?
      errors[:user_id] << "User has already responded to this question"
    end
  end
end
