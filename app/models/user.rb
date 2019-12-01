class User < ApplicationRecord
  include SettingElasticsearch

  searchkick callbacks: :inline,
    settings: SETTING,
    mappings: {
      properties: {
        id: {type: :long},
        name: {type: :text, analyzer: :custom_analyzer},
        age: {type: :integer}
      }
    }

    def search_data
      {
        id: id,
        name: name,
        age: age
      }
    end
end
