class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructions, :minutes_to_complete

  # adding this association allows us to setup the relationship: recipe has one user
  has_one :user
end
