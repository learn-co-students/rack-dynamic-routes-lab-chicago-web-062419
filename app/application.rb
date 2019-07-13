class Application
    
    @@item = []

    def call(env)
        resp = Rack::Response.new
		req = Rack::Request.new(env)
        
        # find if item exists available in @@item
        # if available return the price.
        # if not, return 400 error if item is not there, with message "Item not found".

        # # This is my code that does not pass however, I cannot see the functional difference from solution code.
        # if req.path.match(/items/)

        #     item_search = req.path.split("/item/").last

        #     if item = @@item.find {|single_item| single_item.name == item_search}
        #         resp.write item.price
        #     else
        #         resp.write "Item not found"
        #         resp.status = 400
        #     end
        # else
        #     resp.write "Route not found"
        #     resp.status = 404
        # end

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            
            if item =@@items.find{|i| i.name == item_name}
                resp.write item.price
            else 
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status=404
            resp.write "Route not found"
        end

        resp.finish
    end    
end