require 'iphoneification'

if defined?(ActionController::Base)
  ActionController::Base.send(:extend, IPhoneification::ClassMethods)
  ActionController::Base.send(:include, IPhoneification::InstanceMethods)
end