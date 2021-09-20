require 'rails-settings-cached'

module Kubik
  module Metatagable
    class Engine < ::Rails::Engine
      config.after_initialize do
        ActiveSupport.on_load(:action_controller_base) do
          include Kubik::MetatagableController
          before_action :fetch_meta_tags
        end
      end
    end
  end
end
