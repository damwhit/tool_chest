class ToolsController < ApplicationController

  def index
    @tools = current_user.tools
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    # or Tool.destroy(params[:id]) works just as well
    redirect_to tools_path
  end

  def create
    # generate a new tool
    # add the attributes to that tool - down in tool_params
    @tool = Tool.new(tool_params)
    # try to save that tool
    if @tool.save
      current_user.tools << @tool
      # save method handles validations
      # if the tool saves to the database we will send the user to view that tool
      flash[:notice] = "You just created a tool!"
      redirect_to tool_path(@tool.id)
      # redirect_to @tool does same thing in much more magical way
    else
      # if it doesnt save we will render the new view
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to @tool
    else
      edit_tool_path(@tool)
    end
  end


  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end

end
