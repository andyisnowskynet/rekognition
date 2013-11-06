require File.expand_path('../object', __FILE__)

class Hash
  
  def assert_valid_keys(*valid_keys)
    unknown_keys = keys - [valid_keys].flatten
    raise(ArgumentError, "Unknown key(s): #{unknown_keys.join(", ")}") unless unknown_keys.empty?
  end
  
  def assert_required_keys(*required_keys)
    missing_keys = []
    for required_key in required_keys do
      # if they required key is an array that means the request must contain
      # one of the keys, but not more
      if required_key.is_a?(Array)
        if (keys-required_key).count < keys.count-1 # too many keys sent when they need only one
          missing_keys << "must choose one of either #{required_key.join(' or ')}"
        elsif (keys-required_key).count == keys.count # they didn't send any of the options
          missing_keys << required_key.join(" or ")
        end
      else
        missing_keys << required_key unless keys.include?(required_key)
      end
    end
    raise(ArgumentError, "Missing required key(s): #{missing_keys.join(", ")}") unless missing_keys.empty?
  end
  
  def to_param(namespace = nil)
    collect do |key, value|
      value.to_query(namespace ? "#{namespace}[#{key}]" : key)
    end.sort * '&'
  end
  
end