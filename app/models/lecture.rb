class Lecture < ActiveRecord::Base
  mount_uploader :video, VideoUploader

  belongs_to :lecturer
  belongs_to :course

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :lecturer_id
  validates_presence_of :video
  validates_presence_of :course_id

  validate :valid_course

  private
    def valid_course  
      self.errors.add(:course_id, "^ Course is invalid.") unless Course.exists? course_id
    end
end