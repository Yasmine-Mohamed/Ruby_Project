class LecturesController < InheritedResources::Base
  before_action :authenticate_user!


  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params.merge(user_id: current_user.id))


    if @lecture.save
      redirect_to lectures_path, notice: "The lecture #{@lecture.id} has been uploaded."
    else
      render "new"
    end
  end

  def edit

    @lecture = Lecture.find(params[:id])
    if @lecture.user_id != current_user.id
      render :file => "#{Rails.root}/public/422.html"
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lectures_path , notice: "The Lecture #{@lecture.id} has been deleted"
  end

  def upvote
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_by current_user
    redirect_to lecture_path
  end

  def downvote
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_by current_user
    redirect_to lecture_path
  end


  def add_new_comment
    @lecture = Lecture.find(params[:id])
    @comment = Comment.new(comment_params.merge(user_id: current_user.id))
    @comment.lecture_id = @lecture.id
    if @comment.save
      redirect_to @lecture
    end

  end

  def show
    @lecture = Lecture.find(params[:id])
  end


  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end

  def comment_params
    params.require(:comment).permit(:comment ,:lecture_id)
  end
end
