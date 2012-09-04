#encoding=utf-8
class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email, :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password

  ## Recoverable
  field :reset_password_token, :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count, :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at, :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable
  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  #自定义字段
  field :login_name, :type => String #用户登录名字

  validates :login_name,
            :format => {:with => /\A\w+\z/, :message => '只允许数字、大小写字母和下划线'},
            :length => {:in => 3..20}, :presence => true,
            :uniqueness => {:case_sensitive => false}

  #使用login_name和email都可以登录
  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login_name)
    self.where(:login_name => /^#{login}$/i).first || self.where(:email => /^#{login}$/i).first
  end

  #显示名字
  field :nick_name, :type => String
  #拥有故事
  has_many :stories
end
