module Kubik
  class MetaTagDefaultsForm
    include ActiveModel::Validations

    def initialize(meta_tag_params)
      @meta_tag_params = meta_tag_params
    end

    def save
      update_meta_tag && clear_cache
    end

    private

    def update_meta_tag
      klass.meta_tag = meta_tag_params.to_h
    end

    def clear_cache
      klass.clear_cache.then { true }
    end

    def klass
      ::Kubik::MetaTagDefaults
    end

    attr_accessor :meta_tag_params
  end
end
