class JobTemplate < ActiveRecord::Base
	belongs_to :user

	scope :sorted, lambda { order("job_templates.template_name ASC")}
	scope :newest_first, lambda { order("job_templates.created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
