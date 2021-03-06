class PoemsController < ApplicationController
    skip_before_filter :authenticate_user!
    autocomplete :tag, :name, :full => true, :class_name => 'ActsAsTaggableOn::Tag'
    
    def poem_params
        params.require(:poem).permit(:teacher_name, :county, :email, :student_name, :school, :grade, :student_teacher_name, :title, :attachment, :poem, :release, :tag_list, :tag, { tag_list: [] }, :tag_ids)
    end
    
    def index
        @poems = Poem.all.order('created_at DESC')
    end
    
    def show
        id = params[:id]
        @poem = Poem.find(id)
        @url_test = request.base_url
        @url_test = "http://" + @url_test[8, @url_test.length]
        
        @tag_objects = []
        if @poem.tag_list
            @tags = @poem.tag_list

            @tags.each do |tag|
                query = Tag.where(name: tag).first
                if query.blank?
                    new_tag = Tag.new(:name => tag, :status => "Pending")
                    if not new_tag.save
                        flash[:warning] = "Please fix formatting."
                        render view_tags_path
                    end
                    @tag_objects.push(new_tag)
                else
                    @tag_objects.push(query)
                end
            end
        end
        @tag_display = ''
        @tag_objects.each do |tag|
            # @tag_display << tag.name
            if (@tag_display == '' && tag.status == "Approved")
                @tag_display << tag.name
            elsif tag.status == "Approved"
                @tag_display << ', ' << tag.name 
            end
                
        end
            
    end
    
    def new
        @poems = Poem.all
    end
    
    def approve 
        poem = Poem.find(params[:id])
        poem.update_attributes(:status => "Approved")
        flash[:notice] = "You successfully approved this poem."
        redirect_to view_poems_path
    end
    
    def reject
        poem = Poem.find(params[:id])
        poem.update_attributes(:status => "Rejected")
        flash[:notice] = "You successfully rejected this poem."
        redirect_to view_poems_path
    end
    
    def create
        @poem = Poem.new(poem_params)
        if @poem.save
            #create tags
            Notifier.notify(@poem.teacher_name).deliver_later
            redirect_to poems_submitted_path
        else
            flash.now[:warning] = "Please fill in Missing Fields."
            render new_poem_path
        end
    end
    
    def home
        @poems = Poem.where("status = 'Approved'").order(:created_at).reverse_order.paginate(page: params[:page], per_page: 9)
    end
    
    def teacher_profile
        require 'mechanize'
        require 'nokogiri'
        
        @poem = Poem.find(params[:id])
        @page = @poem.teacher_profile_link

        if @page.nil?
            flash[:notice] = "Teacher does not exist"
            redirect_to view_poems_path
        end
    end
    
end  
