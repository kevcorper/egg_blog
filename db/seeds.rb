User.create(name: "Kevin", username: "kevin", email: "kevin@blah.com", password: "kevin")
Post.create(title: "I like eggs", body: "I really like eggs, they are very versatile for breakfast", author_id: 1)
Comment.create(body: "That is funny", user_id: 2, post_id: 1)
Tag.create(name: "fun")
Tag.create(name: "breakfast")
Tag.create(name: "yumz")
Tag.create(name: "debbie")
Tag.create(name: "eggs")
PostTag.create(post_id: 1, tag_id: 1)
PostTag.create(post_id: 1, tag_id: 2)
PostTag.create(post_id: 1, tag_id: 3)
PostTag.create(post_id: 1, tag_id: 4)
PostTag.create(post_id: 1, tag_id: 5)


User.create(name: "Suzie", username: "suzie", email: "suzie@blah.com", password: "suzie")
Post.create(title: "I like bacon", body: "I really like bacon, it is salty and yummy", author_id: 2)
Comment.create(body: "Bacon yasss", user_id: 1, post_id: 2)
Tag.create(name: "bacon")
PostTag.create(post_id: 2, tag_id: 1)
PostTag.create(post_id: 2, tag_id: 2)
PostTag.create(post_id: 2, tag_id: 3)
PostTag.create(post_id: 2, tag_id: 5)
PostTag.create(post_id: 2, tag_id: 6)

Post.create(title: "Pizza is the best", body: "I enjoy all types of pizza, it is really fun to it", author_id: 2)
Comment.create(body: "pizza.", user_id: 1, post_id: 3)
Tag.create(name: "pizza")
PostTag.create(post_id: 3, tag_id: 1)
PostTag.create(post_id: 3, tag_id: 3)
PostTag.create(post_id: 3, tag_id: 7)
