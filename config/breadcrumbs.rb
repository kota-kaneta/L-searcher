crumb :root do
  link "トップページ", root_path
end

crumb :edit_user do
  link "ユーザー情報変更", root_path
  parent :root
end

crumb :how_to do
  link "取り扱い説明"
  parent :root
end

crumb :notifications do
  link "通知"
  parent :root
end

crumb :favorite do
  link "お気に入り", :back
  parent :root
end

crumb :favorite_time_line do
  link "お気に入りタイムライン"
  parent :favorite
end

crumb :new_schedule do
  link "スケジュール登録"
  parent :root
end

crumb :edit_schedule do
  link "スケジュール変更"
  parent :root
end

crumb :search do
  link "ユーザー検索", search_users_path
  parent :root
end

crumb :match do
  link "一致したユーザー", match_user_path
  parent :search
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :following do
  link "フォローリスト"
  parent :mypage
end

crumb :follower do
  link "フォロワーリスト"
  parent :mypage
end

crumb :time_line do
  link "タイムライン", time_line_users_path
  parent :root
end

crumb :room_list do
  link "ルーム一覧", room_list_room_path(current_user.id)
  parent :root
end

crumb :room_show do
  link "DMルーム"
  parent :room_list
end

