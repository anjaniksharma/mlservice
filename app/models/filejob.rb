class Filejob < ApplicationRecord
	mount_uploader :inpufile, InputfileUploader
    serialize :inpufile, JSON
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    belongs_to :user
end
