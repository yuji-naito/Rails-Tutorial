module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "I'm gourmet!"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  # ロゴイメージのファイル名をランダムで1つ返す
  def random_image
    # ランダムに表示するロゴのファイル名を配列で宣言
    logo_images = ["MyMeat.png", "MyCake.png"]
    
    # ロゴの配列からランダムで1つ文字列を代入
    logo_image = logo_images[rand(logo_images.length)]
    
    return logo_image
  end
end