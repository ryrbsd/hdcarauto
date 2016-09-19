class CaseType < ActiveRecord::Base
    has_many :service_cases
    mount_uploader :image, ImageUploader
    rails_admin do
        navigation_label '车型'
        list do
            field :name do
                label "标题"
            end
            field :image do
                label "封面图片"
                required true
            end
        end
        edit do
            field :name do
                label "标题"
                required true
            end
            field :image, :carrierwave do
                label "封面图片"
                required true
            end
        end
    end
end
