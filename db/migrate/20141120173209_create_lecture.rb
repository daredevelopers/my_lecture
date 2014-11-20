class CreateLecture < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.integer :lecturer_id
      t.integer :course_id
      t.string :name
      t.string :video
    end
  end
end
