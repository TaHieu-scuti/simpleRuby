class Post < ApplicationRecord
    validates :title,
              :presence => true,
              :length => { :minimum => 5 , :message => "Must be at least 5 characters" }
    validates :body,
              :length => { :maximum => 300, :too_long => "%{count} characters is the maximum allowed" }

    def getAll
        return Post.all
    end

    def getPost (id)
        return Post.find(id)
    end
end
