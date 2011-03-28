module Tld
  module Cookies
    # A cookie jar that always sets the +domain+ to +:all+.
    class TopLevelDomainCookieJar < ActionDispatch::Cookies::CookieJar
      def initialize(parent_jar, secret)
        @parent_jar, @secret = parent_jar, secret
      end

      def []=(key, options)
        if options.is_a?(Hash)
          options.symbolize_keys!
        else
          options = { :value => options }
        end

        options[:domain] = :all

        @parent_jar[key] = options
      end

      def delete(key, options = {})
        @parent_jar.delete(key, options.merge({ :domain => :all }))
      end

      def method_missing(method, *arguments, &block)
        @parent_jar.send(method, *arguments, &block)
      end
    end
  end
end

ActionDispatch::Cookies.send(:include, Tld::Cookies)