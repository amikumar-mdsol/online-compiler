# frozen_string_literal: true

class CreateProgrammingLanguages < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table :programming_languages, id: :uuid do |t|
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
