class CreateCodeLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :code_languages do |t|
    	t.string :name
    	t.timestamps
    end
  end
end
