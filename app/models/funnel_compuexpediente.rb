# == Schema Information
#
# Table name: funnel_compuexpedientes
#
#  id         :bigint           not null, primary key
#  funnel_url :string(3000)     not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_funnel_compuexpedientes_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class FunnelCompuexpediente < ApplicationRecord
  belongs_to :account

  validates :funnel_url, presence: true, length: { maximum: 3000 }
end
