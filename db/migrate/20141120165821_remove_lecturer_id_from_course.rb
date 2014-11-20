class RemoveLecturerIdFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :lecturer_id
  end
end
