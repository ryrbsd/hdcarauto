class ServiceCase < ActiveRecord::Base
  belongs_to :Type
  mount_uploader :image, ImageUploader
  mount_uploader :attachment, AttachmentUploader
  
  #set up rails admin
  rails_admin do
    navigation_label '产品类别'
    parent Type
    list do 
      field :title do
        label "标题"
      end
      
      field :Type_id, :enum do
        label "产品小类"
        enum do
          ::Type.all.collect {|p| [p.name, p.id]}
        end
      end
      
      field :image, :carrierwave do
        label "图片"
      end
      
      field :attachment, :carrierwave do
        label "附件"
      end     
    end
    
    edit do 
      field :title do
        label "标题"
      end
      field :text, :ck_editor do
        label "细节"
      end
      
      field :Type_id, :enum do
        label "产品小类"
        enum do
          ::Type.all.collect {|p| [p.name, p.id]}
        end
      end
      
      field :image, :carrierwave do
        label "图片"
      end
      
      field :attachment, :carrierwave do
        label "附件"
      end
    end
  end
end
