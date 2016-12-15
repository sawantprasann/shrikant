class PostsDatatable < BaseDatatable
	private

  def data
 
    posts.map do |post|
      [
       	post.order,
    	post.title,
    	post.sub_title,
    	post.published_at,
    	link_to("Show", "/admin/posts/#{post.id}"),
    	link_to("<i class='fa fa-pencil'></i>".html_safe, "/admin/posts/#{post.id}/edit"),
    	link_to("<i class='fa fa-times'></i>".html_safe, "/admin/posts/#{post.id}",:method => :delete),
      ]
    end
  end

  def posts
    @posts ||= fetch_posts
  end

  def fetch_posts
    posts = @class_name.order("#{sort_column} #{sort_direction}")
    posts = posts.page(page).per(25)
    if params[:sSearch].present?
      posts = posts.where("title like :search or sub_title like :search or published_at::text like :search", search: "%#{params[:sSearch]}%")
    end
    posts
  end

  
  def sort_column
    columns = %w[title sub_title published_at]
    columns[params[:iSortCol_0].to_i]
  end
	
	
end
	
