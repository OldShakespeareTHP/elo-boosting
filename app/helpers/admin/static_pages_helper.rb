module Admin::StaticPagesHelper
  def background_color(status_id)
    hash_bg_colors = Hash[true, "bg-success", false, "bg-danger"][status_id]
  end
end
