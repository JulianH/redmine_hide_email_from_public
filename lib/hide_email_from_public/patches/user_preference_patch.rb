module HideEmailFromPublic
  module Patches
    module UserPreferencePatch
      def self.included(base)
        base.class_eval do
          define_method 'hide_mail' do
            # if user is anonymous, hide email
            if User.current.class.name == 'AnonymousUser'
              return true
            else
              send('[]', :hide_mail)
            end
          end
        end
      end
    end
  end
end
