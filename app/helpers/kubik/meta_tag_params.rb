# frozen_string_literal: true

module Kubik
  module MetaTagParams
    extend self

    def push_to_params(klass, params)
      return unless klass.send(:reflect_on_association, :meta_tag)

      params.push(meta_tag_attributes)
    end

    private

    def meta_tag_attributes
      {
        meta_tag_attributes: %i[
          title_tag meta_description og_title og_description twitter_title
          twitter_description
        ]
      }
    end
  end
end
