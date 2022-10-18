class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.text :about_me
      t.string :first_name
      t.string :last_name
      t.string :medium_profile_url
      t.string :linkedin_profile_url
      t.string :twitter_profile_url

      t.timestamps
    end
  end
end
