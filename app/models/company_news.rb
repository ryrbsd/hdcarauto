require 'elasticsearch/model'
class CompanyNews < ActiveRecord::Base
    include Elasticsearch::Model
    mount_uploader :image, ImageUploader
    def before_import_save(record)
    # Your custom special sauce
      
      self.title = record[:title] if record[:title].present?
      self.image = record[:image] if record[:image].present?
      self.content = record[:content] if record[:content].present?
    end

    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ['title']
            }
          }
        }
      )
    end
    
    #rails admin set up
    rails_admin do
        navigation_label '新闻和活动'
        list do
          field :title do
            label "名称"
          end

          field :description do
            label "梗概"
          end
          # field :content do
          #   label "内容"
          #   pretty_value do
          #     value.html_safe
          #   end
          # end
          # field :video_url do
          #   label "视频链接"
          # end
          field :image, :carrierwave do
            label "封面"
          end
        end
        edit do 
          field :title do
            label "名称"
            required true
          end
          # field :author do
          #   label "作者"
          # end
          field :description, :text do
            label "梗概"
            html_attributes do
              {:maxlength => 600}
            end
          end
          field :content, :ck_editor do
            label "内容"
          end
          # field :video_url do
          #   label "视频链接"
          # end
          field :image, :carrierwave do
            label "封面"
          end
        end
    end
end
CompanyNews.__elasticsearch__.create_index! force: true
CompanyNews.__elasticsearch__.refresh_index!
CompanyNews.import