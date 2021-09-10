module Kubik
  class MetaTagDefaultsForm
    include ActiveModel::Validations

    def initialize(meta_tag_params)
      @meta_tag_params = meta_tag_params
    end

    def save
      ::Kubik::MetaTagDefaults.meta_tag = meta_tag_params
    end

    private

    attr_accessor :meta_tag_params
  end
end
