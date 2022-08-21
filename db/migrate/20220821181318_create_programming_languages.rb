class CreateProgrammingLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :programming_languages do |t|
      t.string :name
      t.string :command
      t.string :extension
      t.string :prefix
      t.string :suffix
      t.boolean :compile_required, default: false

      t.timestamps
    end
  end
end
