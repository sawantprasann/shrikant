class UsersDatatable < BaseDatatable
	private

  def data
 
    users.map do |user|
      [
       
    	user.first_name,
    	user.last_name,
    	user.email,
    	link_to(I18n.t("views.show"), user)
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = @class_name.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per(25)
    if params[:sSearch].present?
      users = users.where("email like :search or first_name like :search or last_name like :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  
  def sort_column
    columns = %w[first_name last_name email]
    columns[params[:iSortCol_0].to_i]
  end
	
	
end