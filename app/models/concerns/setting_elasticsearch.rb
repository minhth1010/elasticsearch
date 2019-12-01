module SettingElasticsearch
  SETTING = {
   analysis: {
     analyzer: {
       custom_analyzer: {
         type: :custom,
         tokenizer: :whitespace,
         filter: :lowercase
       },
       lower_keyword: {
         type: :custom,
         tokenizer: :keyword,
         filter: :lowercase
       }
     }
   }
  }.freeze
end
