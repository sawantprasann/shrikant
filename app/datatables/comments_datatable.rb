class CommentsDatatable <  BaseDatatable
  
  
  


private

  def data
 
    comments.map do |comment|
      [
       	comment.id,
    	  comment.user.try(:name),
    	  comment.content,    
    	  link_to("Show", "/admin/comments/#{comment.id}"),
    	  link_to("<i class='fa fa-pencil'></i>".html_safe, "/admin/comments/#{comment.id}/edit"),
    	  link_to("<i class='fa fa-times'></i>".html_safe, "/admin/comments/#{comment.id}",:method => :delete),
      ]
    end
  end

  def comments
    @comments ||= fetch_comments
  end

  def fetch_comments
    comments = @class_name.order("#{sort_column} #{sort_direction}")
    comments = comments.page(page).per(25)
    if params[:sSearch].present?
      comments = comments.where("content like :search", search: "%#{params[:sSearch]}%")
    end
    comments
  end

  
  def sort_column
    columns = %w[id content content content content content]
    columns[params[:iSortCol_0].to_i]
  end

  end