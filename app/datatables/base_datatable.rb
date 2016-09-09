class BaseDatatable 
	delegate :params, :h, :link_to, :number_to_currency, to: :@view
	

	def initialize(view,options = {})
			
		@view = view
		@class_name = options["class_name"].constantize
		@count = options["count"]
		@user = options["user"]
	end

	def as_json(options = {})		
	    {
	      sEcho: params[:sEcho].to_i,
	      iTotalRecords: @count || @class_name.count,
	      iTotalDisplayRecords: send(@class_name.to_s.underscore.pluralize).total_count,
	      aaData: data
	    }
  	end

  	def page
    	params[:iDisplayStart].to_i/per_page + 1
  	end

  	def per_page
    	params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  	end

	def sort_direction
    	params[:sSortDir_0] == "desc" ? "desc" : "ASC"
  	end
	
	
end