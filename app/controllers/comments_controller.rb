class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.content = params[:content] # 댓글의 내용
    comment.post_id = params[:id] # 댓글의 번호
    comment.save
    
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id]) # 넘어오는건 comment(댓글)의 id. 사실 삭제할때는 댓글의 아이디만 갖고오면 가능
    @comment.destroy # 찾았으면 삭제
    redirect_to :back
  end
end
