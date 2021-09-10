module Kubik
  class MetaTagDefaultsController < ApplicationController
    layout :resolve_layout

    def edit; end

    def update
      @meta_tag_defaults = Kubik::MetaTagDefaultsForm.new(meta_tag_defaults_params)
      if @meta_tag_defaults.save
        flash.now[:notice] = t('kubik_metatagable.defaults_saved')
        render :edit
      else
        flash.now[:alert] = t('kubik_metatagable.defaults_not_saved')
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def meta_tag_defaults_params
      params.require(:meta_tag_defaults).permit(Kubik::MetaTagDefaults::TAGS)
    end

    def resolve_layout
      kubik_metatagable_layout
    end
  end
end
