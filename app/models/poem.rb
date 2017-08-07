class Poem < ActiveRecord::Base
    has_many :tags
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    mount_uploader :release, ReleaseUploader
    validates :attachment, :teacher_name, :county, :email, :student_name, :school, :grade, :student_teacher_name, :title, :list_of_tags, :release, presence: true # Make sure the owner's name is present.
    
    def pending?
        return true if self.status == 'Pending'
        return false
    end
    
    def rejected?
        return true if self.status == 'Rejected'
        return false
    end
    
    def approved?
        return true if self.status == 'Approved'
        return false
    end
    
    def teacher_profile_link
        require 'mechanize'
        require 'nokogiri'
        
        agent = Mechanize.new
        if page = agent.get('https://c3cmr117.caspio.com/dp.asp?AppKey=81ec40002ba02c780e474240af87') 
        
            form = page.form_with(:id => 'caspioform')
        
            names = self.teacher_name.split(" ")
            first_name = names[0]
            last_name = names.last
            form["Value1_1"] = last_name
            form["Value2_1"] = first_name
            page = agent.submit(form)
        
            if link = page.link_with(:text => "View Details")
                page2 = link.click
                return page2
            end
        end
    end
end