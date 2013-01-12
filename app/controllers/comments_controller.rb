class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end

  def question
    populate if Comment.all.empty?
    setup_score if session[:question_count].nil?
    if request.post?
      session[:question_count] += 1
      if params[:answer] == session[:correct_answer]
        flash[:notice] = "Correct answer"
        session[:score] += 1
      else
        flash[:notice] = "Incorrect answer"
      end
    end

    new_question
    render "question"
  end

  def setup_score
    session[:question_count] = 0
    session[:score] = 0
  end

  def new_question
    @question_set = Comment.all.sample(4)
    @correct_answer = rand(4)
    session[:correct_answer] = @correct_answer.to_s
    params[:comment] = @question_set[@correct_answer].content
  end


  def populate
    if Comment.populate
      flash[:notice] = "Populate successful"
    else
      flash[:notice] = "Populate failed"
    end
  end

end
