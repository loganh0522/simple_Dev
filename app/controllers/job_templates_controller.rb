class JobTemplatesController < ApplicationController
  
  

  def index
    @jobtemplates = JobTemplate.sorted
  end

  def show
    @jobtemplate = JobTemplate.find(params[:id])
  end

  def new
    @jobtemplate = current_user.jobtemplates.build 
  end

  def create
      #Instantiate a new object using form parameters
    @jobtemplate = current_user.jobtemplates.build(jobtemp_params)
    
    if @jobtemplate.save
      #if save succeeds, redirect to index action
      redirect_to(:action => 'index')
    else
      #if save fails, redisplay the form so user can fix it
      render('new') 
    end 
  end

  def edit
    @jobtemplate = JobTemplate.find(params[:id])
  end

  def update
    @jobtemplate = JobTemplate.find(params[:id])

    if @jobtemplate.update_attributes(jobtemp_params)
      #if update succeeds, redirect to index action
      redirect_to(:action => 'show', :id => @jobtemplate.id)
    else
      #if update fails, redisplay the form so user can fix it
      render('edit') 
    end
  end

  def delete
  end

    private 
    #this is used to provide security for Mass Assignment in the Create method
    #More tidy than having all the params in the variable assignment 
    #Make it private so it can't be called as an action
    #Allows for :name, :position, :visible to be mass assigned

    def jobtemp_params
      params.require(:jobtemplate).permit(:template_name, :job_description, :job_type)
    end

end
