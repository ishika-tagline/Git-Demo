class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :lockable,:omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, :timeoutable

  enum :user_type, %i[agent buyer seller]
  has_many :acc, class_name: 'Account', dependent: :nullify
  accepts_nested_attributes_for :acc
  validates :email, presence: true, uniqueness: { message: 'Email shoud be unique' }
  validates :name, presence: true, uniqueness: { message: 'User name shoud be unique' }
  has_one_attached :image

  # before_validation :befor_validation_fun, on: :create;
  after_validation :printObj
  # before_save :changeNameStyle ,if: :nameNotEmpty
  after_destroy CallBack.new

  after_create :assign_default_role

  def assign_default_role
    add_role(:newuser)
  end

  def printObj
    # puts "printObj fun call"
    # puts "#{User.all}"
  end

  def befor_validation_fun
    # puts "in befor_validation_fun condition";
    return if name.empty?
    # puts "in if condition: #{name.capitalize}";
    # puts "in if condition: #{name}";
  end

  after_initialize do |user|
    # puts "after initialized callback call"
  end

  after_find do |user|
    # puts "after find  callback call";
  end

  def nameNotEmpty
    # puts "nameNotEmpty fun call"
    true
  end

  def changeNameStyle
    # puts "changeNameStyle fun call"
    # user=User.create(name:"ishika31".capitalize)
    # user.save
  end


  def to_builder
    Jbuilder.new do |user|
      user.(self, :name, :age)
    end
  end
end
