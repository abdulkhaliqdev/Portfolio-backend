class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :body
      t.references :project_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
