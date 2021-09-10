module Kubik
  module MetatagableController
    include ::Kubik::MetaTagHelper

    def fetch_meta_tags
      @kubik_meta_tags = ::Kubik::MetaTagDefaults.meta_tag
    end
  end
end
