class Event < ActiveRecord::Base
	belongs_to :user
  has_many :user_joins, through: :event_users, source: :users


  validates :name, :city, :date, :time, :description, presence:true
  validates :state, presence:true, length:{is:2}
  validate  :date_valid
  
  def date_valid
  	datetime = self.date.to_datetime.to_i
  	today = Time.now.to_datetime.to_i
  	if ((today - datetime) > 0)
  		errors.add(:date, "Invalid")
  	end
  end
end
