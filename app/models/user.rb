class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          has_many :test_post, dependent: :destroy
          has_many :likes_you
          has_many :match
  #validates :DOB, :presence => true
  validate :age_check
  

  #validate :sex_check

  private
  def age_check
    puts("sadddddddddddddddddddddddddddddddddddddddddddddddddddddddd")
    if self.DOB.present? && self.DOB > 18.years.ago.to_date
      puts("ttttttttttttttttttttttttttttttttttttttt")
      errors.add('must be older then 18.')
    end
  end


  # def sex_check
  #   if self.sex == 0 || self.sex == 1
  #   else
  #     errors.add(:sex, 'must be be "male" or "female"')
  #   end
  # end

end
