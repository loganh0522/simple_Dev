class CreateJobTemplates < ActiveRecord::Migration
  def change
    create_table :job_templates do |t|
      t.string "template_name"
      t.string "job_description"
      t.string "job_type"

      t.timestamps null: false
    end
  end
end
