class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_update :send_password_change_email, if: :needs_password_change_email?
  after_save :deliver_auth_email, if: :send_auth_email? 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # serialize :authority, Array
  def hashmap
      { '产品类别' => 'Category, Type, Product, PopProduct','新闻' => 'CompanyNews, IndustryNews, SpecialNewsOne, SpecialNewsTwo, Honor', 
      '投资者关系' => 'Announcement, YearReport', '员工讯息' => 'EmployeeStory', '客户服务' => 'CaseType, ServiceCase, QType, QandA', 
      '招聘' => 'SocietyRecuritment, CampusRecuritment', '行业新闻' => 'IndustryNews' , '用户/管理员' => 'User', 
      '问题类型' => 'QType', '投标' => 'Bid', '售后服务' => 'Trouble, Complain'}
  end

  rails_admin do
    navigation_label '用户/管理员'
    list do
      field :email do
        label "Email"
      end
      field :realName do
        label "真实姓名"
      end

      field :phoneNumber do
        label "电话号码"
      end  
      
      field :company do
        label "公司"
      end

      field :department do
        label "部门"
      end
      field :authorized do
          label "已授权"
        end
      field :role do
        label "角色"
      end
      field :authority do
        label "限权"
      end
    end
    
    edit do
        field :email do
          label "Email"
          required true
        end
        
        field :password do
          label "密码"
          help "新增和更改密码时需填,后台编辑用户时不填则保留原密码"
        end
        
        field :realName do
          label "真实姓名"
          required true
        end
    
        field :phoneNumber do
          label "电话号码"
          required true
        end  
        
        field :company do
          label "公司"
          required true
        end
    
        field :department do
          label "部门"
        end
        # field :password do
        #   label "密码"
        #   required true
        # end
        field :role, :enum do
          label "角色"
          required true
          enum do
            if bindings[:view]._current_user.role == "developer"
              ['user', 'admin', 'superadmin']
            else
              ['user', 'admin']
            end
          end
        end
        field :authority do
          label "限权"
          required true
          
          # render do
          #     bindings[:form].select( "authority", bindings[:object].authorities_enum, {}, {:multiple => true, :size => 10, :class => "selectpicker"})
          # end
          # render partialz :multiselect_box, locals: { select_user: bindings[:object] }
          render do
            bindings[:view].render :partial  => "rails_admin/main/multiselect_box", :locals => {:field => self, :select_user => bindings[:object]}
          end
        end
        field :authorized do
          label "已授权"
        end
        field :send_auth_email do
          label "发送邮件通知限权"
        end
    end
  end
  
  def needs_password_change_email?
    encrypted_password_changed? && persisted?
  end

  def send_password_change_email
    UserMailer.password_changed(id).deliver_now
  end
  
  def deliver_auth_email
    UserMailer.send_auth_email(id).deliver_now
  end
end
