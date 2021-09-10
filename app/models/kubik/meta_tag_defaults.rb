module Kubik
  class MetaTagDefaults < ::RailsSettings::Base
    TAGS = %i[
      site_title meta_description og_type og_title
      og_description og_url twitter_title twitter_description
    ]

    field :meta_tag, type: :hash, default: TAGS.to_h { [_1, ''] }

    def self.table_name
      'kubik_meta_tag_defaults'
    end
  end
end
