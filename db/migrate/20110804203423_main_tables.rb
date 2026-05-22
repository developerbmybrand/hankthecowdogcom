class MainTables < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    add_index :users, :email,                :unique => true

    create_table :contents do |t|
      t.integer   :type_content_page_id
      t.string    :content_title
      t.text      :content_text
      t.string    :content_image
      t.boolean   :content_published

      t.timestamps
    end
    add_index :contents, :type_content_page_id
    
    create_table :blogs do |t|
      t.integer   :user_id
      t.integer   :type_blog_category_id
      t.string    :blog_title
      t.text      :blog_body
      t.string    :blog_author
      t.string    :blog_image
      t.string    :blog_slug
      t.string    :blog_tags
      t.datetime  :blog_postdate
      t.boolean   :blog_published
      t.boolean   :blog_comments_allowed
      
      t.timestamps
    end
    add_index :blogs, :user_id
    add_index :blogs, :type_blog_category_id
    
    create_table :banners do |t|
      t.string    :banner_title
      t.string    :banner_link
      t.string    :banner_image
      t.integer   :banner_sortweight
      t.boolean   :banner_published

      t.timestamps
    end
    
    create_table :books do |t|
      t.string    :book_title
      t.text      :book_desc
      t.text      :book_excerpt_title
      t.text      :book_excerpt_detail
      t.integer   :book_volume_number
      t.string    :book_audio
      t.string    :book_image
      t.string    :book_link
      t.boolean   :book_featured
      t.integer   :book_sortweight
      t.boolean   :book_published

      t.timestamps
    end
    
    create_table :recipes do |t|
      t.string    :recipe_title
      t.string    :recipe_subtitle
      t.text      :recipe_desc
      t.string    :recipe_image
      t.integer   :recipe_sortweight
      t.boolean   :recipe_published
      
      t.timestamps
    end    
    
    create_table :friends do |t|
      t.string    :friend_name
      t.text      :friend_desc
      t.string    :friend_image
      t.string    :friend_image_thumb
      t.string    :friend_slug
      t.integer   :friend_sortweight
      t.boolean   :friend_published

      t.timestamps
    end

    create_table :screenplays do |t|
      t.string    :screen_title
      t.text      :screen_desc
      t.string    :screen_image
      t.text      :screen_characters
      t.text      :screen_story
      t.text      :screen_songs
      t.integer   :screen_sortweight
      t.boolean   :screen_published

      t.timestamps
    end    

    create_table :newsletters do |t|
      t.string    :newsletter_name
      t.datetime  :newsletter_date
      t.string    :newsletter_path
      t.boolean   :newsletter_published

      t.timestamps
    end

    create_table :secforces do |t|
      t.string    :secforce_username
      t.string    :secforce_password

      t.timestamps
    end

    # Type tables
    create_table :type_content_pages do |t|
      t.string :type_name
      t.string :type_location

      t.timestamps
    end
    
    create_table :type_blog_categories do |t|
      t.string :type_name
      
      t.timestamps
    end
    
    create_table :type_blog_tags do |t|
      t.string :type_name
      t.string :type_location

      t.timestamps
    end
    
  end

  def self.down
    drop_table :users
    drop_table :contents
    drop_table :blogs
    drop_table :banners
    drop_table :books
    drop_table :recipes
    drop_table :friends
    drop_table :type_contents
    drop_table :type_content_pages
    drop_table :type_blog_categories
    drop_table :newsletters
  end
end
