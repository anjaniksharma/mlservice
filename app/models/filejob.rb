class Filejob < ApplicationRecord
	mount_uploader :inpufile, InputfileUploader
    serialize :inpufile, JSON
    default_scope -> { order(created_at: :desc) }
end
