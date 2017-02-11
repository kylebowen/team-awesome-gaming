class GameplaySession < ApplicationRecord
  store :players, accessors: [ :name, :id ]
end
