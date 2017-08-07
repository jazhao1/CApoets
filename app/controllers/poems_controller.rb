class PoemsController < ApplicationController
    def poem_params
        params.require(:poem).permit(:teacher_name, :county, :email, :student_name, :school, :grade, :student_teacher_name, :title, :list_of_tags, :attachment, :poem, :release)
    end
    
    def index
        @poems = Poem.all.order('created_at DESC')
    end
    
    def show
        id = params[:id]
        @poem = Poem.find(id)
        @url_test = request.base_url
        @url_test = "http://" + @url_test[8, @url_test.length]
        
        #create tag_objects from tag strings so we can access and take advantage of tag properties
        @tag_objects = []
        @tags = @poem[:list_of_tags].split(/[\s,]+/)
        @tags.each do |tag|
            # query is used to check if the tag that the poet-teacher is trying to submit already exists in the db.
            # if it already exists, then do not create new tag object. use the query.
            query = Tag.where(category: tag).first
            if query.blank?
                new_tag = Tag.new(:category => tag, :status => "Pending")
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
    
    def new
    
    end
    
    def approve 
        poem = Poem.find(params[:id])
        poem.update_attributes(:status => "Approved")
        flash[:notice] = "You successfully approved this poem."
        redirect_to authenticated_root_url
    end
    
    def reject
        poem = Poem.find(params[:id])
        poem.update_attributes(:status => "Rejected")
        flash[:notice] = "You successfully rejected this poem."
        redirect_to authenticated_root_url
    end
    
    def create
        @poem = Poem.new(poem_params)
        if @poem.save
            Notifier.notify(@poem.teacher_name).deliver_later
            redirect_to submitted_path
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
            redirect_to authenticated_root_url
        end
    end
end  
