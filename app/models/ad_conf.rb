class AdConf < ApplicationRecord

  enum component: [:conversion, :popular_in_the_community, :reactions]
  enum platform: [:android, :desktop]
end
