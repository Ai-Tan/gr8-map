class MapsController < ApplicationController
  def index
    @maps = Map.order(created_at: :desc)
  end
  
  def new
    @map = Map.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @map = Map.new(map_params) # ストロングパラメータを引数に
    @map.save # saveをしてデータベースに保存する。
    redirect_to @map # showページにリダイレクト
  end

  def show
    # Itemモデルのfindメソッドを使用して、パラメータの値に一致するidのデータを検索している
    # 取得したデータを@itemというインスタンス変数にセットする
    @map = Map.find(params[:id])
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
    if @map.update(map_params)
      redirect_to @map, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end


  private

  def map_params # ストロングパラメータを定義する
    params.require(:map).permit(:name, :type, :price, :closing_day, :open_time, :close_time, :website, :beji, :tel, :parking, :address, :chizu, images: [])
  end

end
