class AddColoursToCodeLanguages < ActiveRecord::Migration[5.1]
  def change
  	add_column :code_languages, :colour_r, :integer
  	add_column :code_languages, :colour_g, :integer
  	add_column :code_languages, :colour_b, :integer
  	add_column :code_languages, :colour_opacity, :integer
  end
end
