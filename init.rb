require 'redmine'

# Patches to the Redmine core.
require 'dispatcher'

Dispatcher.to_prepare :redmine_hide_email_from_public do
  require_dependency 'user_preference'
  unless UserPreference.included_modules.include? HideEmailFromPublic::Patches::UserPreferencePatch
    UserPreference.send(:include, HideEmailFromPublic::Patches::UserPreferencePatch)
  end
end

Redmine::Plugin.register :redmine_hide_email_from_public do
  name 'Redmine Hide Email From Public plugin'
  author 'Nick Bolton'
  description 'Hide email addresses from public (not logged in) users.'
  version '0.0.1'
end
