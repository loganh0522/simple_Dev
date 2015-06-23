class AddUserIdToJobTemplates < ActiveRecord::Migration
  def change
    add_column :job_templates, :user_id, :integer
  end
end
