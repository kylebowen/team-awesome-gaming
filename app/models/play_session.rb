class PlaySession < ApplicationRecord
  store :players, accessors: [ :name, :id ]
end
