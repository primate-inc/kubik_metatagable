# frozen_string_literal: true

module Kubik
  module MetaTagHelper
    def kubik_page_title
      [@kubik_page_title, kubik_site_title].reject(&:blank?).join(' - ')
    end

    def kubik_meta_data(attribute)
      meta = kubik_meta_tags.symbolize_keys.merge(kubik_meta_tags_override)
      meta[attribute]
    end

    def insert_kubik_meta_tags(metatagble)
      meta_tag = metatagble.meta_tag || Kubik::MetaTag.new
      @kubik_page_title = meta_tag.title_tag
      @kubik_meta_tags_override = {
        meta_description: meta_tag.meta_description,
        og_type: 'article',
        og_title: meta_tag.og_title,
        og_description: meta_tag.og_description,
        og_url: request.original_url,
        twitter_title: meta_tag.twitter_title,
        twitter_description: meta_tag.twitter_description,
      }
    end

    def kubik_metatagable_layout
      'application'
    end

    private

    def kubik_site_title
      kubik_meta_tags['site_title']
    end

    def kubik_meta_tags
      @kubik_meta_tags.to_h
    end

    def kubik_meta_tags_override
      @kubik_meta_tags_override&.compact_blank || {}
    end
  end
end
