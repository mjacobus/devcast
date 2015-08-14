module SpecHelper
  module Entities
    class Devcast
      def valid_attributes
        {
          title: 'title',
          url: 'url',
          description: 'description',
          published: true,
        }
      end
    end
  end
end
