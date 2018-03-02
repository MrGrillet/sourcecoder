class ProfilesController < ApplicationController
	before_action :set_profile, only: [:edit, :update, :show, :destroy]

	def index
		# @profiles = Profile.all	
		@profiles = Profile.search(params[:term])
	end

	def new
		@profile = Profile.new
		@profiles = Profile.all	
		@profile.previous_jobs.build


	end

	def edit
		@profiles = Profile.all	
		@profile.previous_jobs.build
	end

	def create
		@profile = Profile.new(profile_params)
		user = current_user.id
		if @profile.save
			flash[:success] = "Your profile was successfully created"
			redirect_to profile_path(@profile)
		else
			render 'new'
		end
	end


	def show
		@code_languages = CodeLanguage.all
		@work_history = PreviousJob.where(profile_id: @profile)

		if User.find(current_user.id) == "applicant"
			@profile = current_user.id
			user_id = current_user.id
		end
	
		 # @options = {"height": 200, "width": 200} # pushes through
		 # @options = [:height => 200, :width => 200] # pushes through
		 # @options = {options: ["height" => 200, "width" => 200]} # pushes through
		 # @options = ["height: 200", "width: 200"]
		  @options = {height: 200, width: 200}
		 
		
	@data_pie = {
    datasets: [{
        data: [70, 20, 10],
        backgroundColor: [ "rgb(255, 99, 132)","rgb(54, 162, 235)","rgb(255, 205, 86)"]
    }],

    # These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [ "Front End", "Back End", "Databases"],
	};


	@data = {
	  labels: ["January", "February", "March", "April", "May", "June", "July"],
	  datasets: [

	    {
	        label: "javascript",
	        background_color:"rgb(255, 99, 132)",
	        border_color: "rgba(255, 99, 132,1)",

	        # x = years, y = projects shipped, r = confidence
	        data: ["x": 0.4, "y": 1, "r": 20]
	    },
	    {
	        label: "html",
	        backgroundColor: "rgba(255, 99, 132,0.7)",
	        borderColor: "rgba(255, 99, 132,1)",
	        data: ["x": 10, "y": 60, "r": 60]
	    },
	    {
	        label: "css",
	        backgroundColor: "rgba(001,001,001,0.8)",
	        borderColor: "rgba(001,001,001,1)",
	        data: ["x": 10, "y": 50, "r": 60]
	    },
	    {
	        label: "php",
	        backgroundColor: "rgba(54, 162, 235,0.6)",
	        borderColor: "rgba(54, 162, 235,1)",
	        data: ["x": 4, "y": 30, "r": 30]
	    },
	    {
	        label: "ruby",
	        backgroundColor: "rgba(255, 205, 86,0.8)",
	        borderColor: "rgba(255, 205, 86,1)",
	        data: ["x": 1.8, "y": 2, "r": 30]
	    }, 
	    	    {  	#spacers are needed so the data is not off the charts
	    	    	# they need to be added last with no lables so they dont mess up the key
	        label: "",
	        background_color:"rgb(0, 0, 0,0)",
	        border_color: "rgba(0, 0, 0,0)",
	        data: ["x": -1, "y": -1, "r": 1]
	    },
	    {
	        label: "",
	        background_color:"rgb(0, 0, 0,0)",
	        border_color: "rgba(0, 0, 0,0)",
	        data: ["x": 11, "y": 65, "r": 1]
	    }  
	  ]
	}




	end

	def update
		if @profile.update(profile_params)
			flash[:success] = "Your profile was successfully updated"
			redirect_to profile_path(@profile)
		else
			render 'edit'
		end
	end

	def destroy
		@profile.destroy
		flash[:danger] = "Profile was deleted"
		redirect_to profile_path
	end


	private

		def set_profile
			@profile = Profile.find(params[:id])
		end


		def profile_params
			params.require(:profile).permit(:profile_bio, :profile_objective, :profile_additional_notes, :profile_url, :profile_phone_number, :user, :profile_twitter, :profile_github, :profile_linkedin, :profile_featured, :profile_youtube, :profile_image, :profile_wallpaper, :user_id, previous_jobs_attributes: PreviousJob.attribute_names.map(&:to_sym).push(:_destroy))
		end
end