# frozen_string_literal: true

module Kubik
  module Metatagable
    extend ActiveSupport::Concern

    TITLE_FIELDS = %i[title_tag og_title twitter_title].freeze
    DESCRIPTION_FIELDS = %i[meta_description og_description twitter_description].freeze

    class_methods do
      attr_reader :kubik_metatagable_opts

      def meta(opts = {})

      end

      private

      def kubik_metatagable(opts = {})
        options = {
          defaults: false, title: nil, description: nil, image: nil
        }.merge(opts)
        @kubik_metatagable_opts = options
      end
    end

    included do
      has_one :meta_tag,
              class_name: 'Kubik::MetaTag',
              as: :metatagable,
              dependent: :destroy

      before_save :save_defaults

      accepts_nested_attributes_for :meta_tag, allow_destroy: true
     
      # include Kubik::Uploadable
      #
      # has_one_kubik_upload(
      #   "#{self.table_name.singularize}_meta_og_image".to_sym, :og_image
      # )
      # has_one_kubik_upload(
      #   "#{self.table_name.singularize}_meta_twitter_image".to_sym,
      #   :twitter_image
      # )
    end

    def save_defaults
      return unless kubik_metatagable_default && meta_tag

      update_meta_titles if kubik_metatagable_title
      update_meta_descriptions if kubik_metatagable_description
    end

    def update_meta_titles
      TITLE_FIELDS.each do |value|
        update_meta_title(value)
      end
    end

    def update_meta_descriptions
      DESCRIPTION_FIELDS.each do |value|
        update_meta_description(value)
      end
    end

    def update_meta_title(option)
      return unless self.changes[kubik_metatagable_title] || meta_tag.send(option).blank?

      value = self.changes[kubik_metatagable_title].try(:first) || self.send(kubik_metatagable_title)
      if meta_tag.send(option) == value || meta_tag.send(option).blank?
        meta_tag.update_attribute(option, self.send(kubik_metatagable_title))
      end
    end

    def update_meta_description(option)
      return unless self.changes[kubik_metatagable_description] || meta_tag.send(option).blank?

      value = self.changes[kubik_metatagable_description].try(:first) || self.send(kubik_metatagable_description)
      if meta_tag.send(option) == value || meta_tag.send(option).blank?
        meta_tag.update_attribute(option, self.send(kubik_metatagable_description))
      end
    end

    def kubik_metatagable_default
      return false unless self.class.kubik_metatagable_opts

      self.class.kubik_metatagable_opts[:defaults]
    end

    def kubik_metatagable_title
      self.class.kubik_metatagable_opts[:title]
    end

    def kubik_metatagable_description
      self.class.kubik_metatagable_opts[:description]
    end
  end
end
