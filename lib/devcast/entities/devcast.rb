class Devcast
  include Lotus::Entity
  attributes :title
  attributes :url
  attributes :published
  attributes :description
  attributes :created_at
  attributes :updated_at

  def initialize(attrs = {})
    super
    self.published = attrs[:published]
  end

  def published=(value)
    @published = [1, true, '1'].include?(value)
  end

  def published?
    published
  end
end
