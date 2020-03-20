class MapsController < ApplicationController
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


  private

  def map_params # ストロングパラメータを定義する
    params.require(:map).permit(:name, :type, :image,)
  end

end
