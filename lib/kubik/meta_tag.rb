# frozen_string_literal: true

module Kubik
  class MetaTag < ActiveRecord::Base
    self.table_name = 'kubik_meta_tags'

    belongs_to :metatagable, polymorphic: true
  end
end
