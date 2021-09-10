require 'rails-settings-cached'

module Kubik
  module Metatagable
    class Engine < ::Rails::Engine
      initializer :extend_application_controller do
        ActionController::Base.send :include, Kubik::MetatagableController
        ActionController::Base.send :before_action, :fetch_meta_tags
      end
    end
  end
end
