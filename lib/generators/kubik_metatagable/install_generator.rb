require 'rails/generators/active_record'

module KubikMetatagable
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument :name, type: :string, default: "application"

      def copy_migrations
        migration_template "migrations/create_kubik_meta_tag_defaults.rb", "db/migrate/create_kubik_meta_tag_defaults.rb"
        migration_template "migrations/create_kubik_meta_tags.rb", "db/migrate/create_kubik_meta_tags.rb"
      end

      def copy_routes
        route <<~EOS
          authenticated :admin_user do
            namespace :kubik do
              resource :meta_tag_defaults, only: %i[edit update]
            end
          end
        EOS
      end

      def add_tags_to_head
        if (app_layout_path = Rails.root.join("app/views/layouts/application.html.erb")).exist?
          say "Add meta tag partial to application.html.erb"
          insert_into_file app_layout_path.to_s, %(\n    <%= render 'kubik/meta_tags' %>), before: /\s*<\/head>/
        else
          say "Default application.html.erb is missing!", :red
          say %(        Add <%= render 'kubik/meta_tags' %> within shared <head> tag in your application.)
        end
      end
    end
  end
end
