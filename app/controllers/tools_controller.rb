class ToolsController < ApplicationController
  # action in controller should a corresponding view with the same name
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
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
      # save method handles validations
      # if the tool saves to the database we will send the user to view that tool
      redirect_to tool_path(@tool.id)
      # redirect_to @tool does same thing in much more magical way
    else
      # if it doesnt save we will render the new view
      render :new
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end

end
