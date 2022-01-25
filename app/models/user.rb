class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :post
  has_many :comment
  has_many :like
  validates :name, presence: true
  validates :posts_counter, presence: false, numericality: { greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def recent_posts
    Post.includes(:user).where("user_id = #{id}").references(:user).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
