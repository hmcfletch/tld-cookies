module Tld
  module Cookies
    module CookieJar
      # Returns a jar that'll automatically set the assigned cookies to the top level domain, regardless of if there 
      # is a subdomain present or not. Example:
      # 
      #     cookies.tld[:prefers_open_id] = true
      #     # => Set-Cookie: prefers_open_id=true; path=/; expires=Sun, 27-Mar-2011 03:24:16 GMT
      # 
      # This jar is only meant for writing. You'll read tld cookies through the regular accessor.
      # 
      # This jar allows chaining with other jars as well, so you can set tld, signed cookies. Examples:
      # 
      #     cookies.tld.signed[:remember_me] = current_user.id
      #     # => Set-Cookie: remember_me=BAhU--848956038e692d7046deab32b7131856ab20e14e; path=/; expires=Sun, 27-Mar-2011 03:24:16 GMT
      def tld
        @tld ||= TopLevelDomainCookieJar.new(self, @secret)
      end
    end
  end
end

ActionDispatch::Cookies::CookieJar.send(:include, Tld::Cookies::CookieJar)