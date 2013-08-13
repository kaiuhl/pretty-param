module PrettyParam
  def self.escape(string)
    result = string
    result.gsub!(/[^\x00-\x7F]+/, '') # Remove anything non-ASCII entirely
    result.gsub!(/[^\w_ \-]+/i, '')   # Remove unwanted chars.
    result.gsub!(/[ \-]+/i, '-')      # No more than one of the separator in a row
    result.gsub!(/^\-|\-$/i, '')      # Remove leading/trailing separator
    result.downcase
  end

  module ClassMethods
    # Takes 1 or more symbols and stores them in class.pretty_params,
    # and then overrides to_param
    def has_pretty_param(*fields)
      define_singleton_method :pretty_params, -> { fields }
      define_method :to_param do
        PrettyParam.escape("#{self.id}-#{self.class.pretty_params.map{|a| self.send(a.to_sym) }.join('-')}")
      end
    end
  end
end

ActiveRecord::Base.extend PrettyParam::ClassMethods
