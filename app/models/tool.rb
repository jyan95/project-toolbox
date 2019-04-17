class Tool < ApplicationRecord
  belongs_to :category
  has_many :user_tools
  has_many :users, through: :user_tools

  validates :name, presence: true, length: {minimum: 4, maximum: 30}

  def user_tool
    user = current_user
    UserTool.where(tool_id: self.id).where(user_id: user.id)
  end

end
