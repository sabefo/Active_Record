require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  
  validates :email, uniqueness: true
  validates :email, format: { with: /\S+@\S+.\w{2}/, message: 'invalid email'}
  validates :age, numericality: { greater_than: 5}
  validate :phone_min_char
  
  def phone_min_char
    raise "ERROR" unless [:phone].to_s.count('0123456789') >=10
  end

  def name
    first_name + " " + last_name
  end

  def age
    now = Date.today
     now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
     #(Date.today - birthday).to_i/365
  end
end
