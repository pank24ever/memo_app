class Memo < ApplicationRecord
  validates :title, {presence: true,length: {maximum: 30}}
  validates :body, {presence: true,length: {maximum: 180}}

  belongs_to :category

end
