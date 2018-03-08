class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.belongs_to :code_language, foreign_key: true
      t.belongs_to :previous_job, foreign_key: true
    end
  end
end
