class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post
  has_many :comment
  has_many :like
  validates :name, presence: true
  validates :posts_counter, presence: false, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    Post.includes(:user).where("user_id = #{id}").references(:user).limit(3)
  end
end
