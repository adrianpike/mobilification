module IPhoneification
  
  module ClassMethods
    
    def responds_to_iphone(options = {})
      before_filter :adjust_format_for_iphone_requests, options
    end
    
    def responds_to_iphone!(options = {})
      before_filter :ensure_format_is_iphone, options
    end
    
  end
  
  module InstanceMethods
    
    def adjust_format_for_iphone_requests
      request.format = :iphone if iphone_request?
    end
    
    def ensure_format_is_iphone
      request.format = :iphone # always
    end

    def iphone_request?
      (agent = request.env["HTTP_USER_AGENT"]) && agent[/(Mobile\/.+Safari)/]
    end
    
  end
end