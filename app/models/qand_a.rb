require 'elasticsearch/model'
class QandA < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    belongs_to :QType
    mount_uploader :attachment, AttachmentUploader
    rails_admin do
        navigation_label '客户服务'
        parent QType
        list do
            field :question do
                label "问题"
            end
            # field :answer do
            #     label "答案"
            #     pretty_value do
            #       value.html_safe
            #     end
            # end
            field :QType_id, :enum do
                label "问题类别"
                enum do 
                  QType.all.collect {|p| [p.name, p.id]}
                end
            end
        end
        edit do
            field :question do
                label "问题"
                required true
            end
            field :answer, :ck_editor do
                label "答案"
                required true
            end
            field :QType_id, :enum do
                label "问题类别"
                required true
                enum do 
                  ::QType.all.collect {|p| [p.name, p.id]}
                end
            end
            field :attachment, :carrierwave do
                label "附件"
            end
        end
    end
end
QandA.__elasticsearch__.create_index! force: true
QandA.__elasticsearch__.refresh_index!
QandA.import