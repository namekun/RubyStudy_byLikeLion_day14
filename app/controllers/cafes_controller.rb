class CafesController < ApplicationController
    
    before_action :authenticate_user, except: [:index,:show] 
    # except안에 있는 메소드를 제외하고 다른 모든 메소드는 실행하기 전에 authenticate_user을 먼저 실행
    
    
    # 전체 카페 목록보여주는 페이지
    # -> 로그인 하지 않았을 때: 전체 카페 목록
    # -> 로그인 했을 때: 유저가 가입한 카페 목록
    
    def index
        if user_signed_in?
            @cafes = current_user.daums
        else
            @cafes = Daum.all
        end
    end
    
    # 카페 내용물을 보여주는 페이지
    def show
        @cafe = Daum.find(params[:id])
        session[:current_user] = @cafe.id
    end
    
    # 카페를 개설하는 페이지
    def new
        @cafe = Daum.new
    end
    
    # 카페를 실제로 개설하는 로직
    def create
        @cafe = Daum.new(daum_params)
        @cafe.master_name = current_user.user_name
        if @cafe.save
            Membership.create(user_id: current_user.id, daum_id: @cafe.id)
            redirect_to cafe_path(@cafe), flash: {success: "카페가 개설 되었습니다"}    
        else
            redirect_to :back, flash: {danger: "카페 개설에 실패했습니다."}
        end
    end
    
    # 카페 정보를 실제로 수정하는 로직 - 나중에 시간되면 과제루다가

    # 카페에 가입하는 로직
    def join_cafe
       Membership.create(daum_id: params[:cafe_id], user_id: current_user.id) 
       redirect_to :back, flash: {success: "카페에 가입되었습니다!"}
    end


    private
    def daum_params
        params.require(:daum).permit(:title, :description)
        # :params => {"daum"=>{"title"=>"test", "description"=>"test"}, "commit"=>"Create_cafe"}}
    end

end
