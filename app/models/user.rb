class User < ApplicationRecord
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  scope :admins, -> { where "(roles->>'admin')::boolean is true" }
  scope :non_admins, -> { where "(roles->>'admin')::boolean != true" }
  has_many :tasks

  friendly_id :name, use: [:slugged, :finders]

  def is_admin?
    roles.present? && roles["admin"].present?
  end

  def avatar
    options = {
      default: "",
      size: 100
    }

    query = options.map { |key, value| "#{key}=#{value}" }.join("&")
    md5 = Digest::MD5.hexdigest(email.strip.downcase)

    URI::HTTPS.build(host: "www.gravatar.com", path: "/avatar/#{md5}", query: query).to_s
  end

  def name
    "#{first_name} #{last_name}"
  end
end
