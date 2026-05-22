Hankthecowdog::Application.routes.draw do 

  # Admin area
  namespace :admin do
    resources :contents
    resources :users
    resources :blogs
    resources :banners
    resources :books
    resources :recipes
    resources :friends
    resources :type_blog_tags
    resources :screenplays
    resources :newsletters
    resources :printouts
    resources :edu_printouts
    resources :songs
    resources :ringtones
    match '/secforce' => 'secforces#index', :via => :get
    match '/secforce' => 'secforces#update', :via => :post
  end

  # Pages
  match 'author' => 'author#index',   :via => :get
  match 'author' => 'author#create',  :via => :post
  match 'concerts' => 'concert#index',   :via => :get
  match 'concerts' => 'concert#create',  :via => :post
  match 'books' => 'pages#books',   :via => :get
  match 'books/:id' => 'pages#bookdetail',   :via => :get
  match 'booksother' => 'pages#books_other',   :via => :get
  match 'riley' => 'pages#books_youngadult',   :via => :get
  match 'bookexcerpts' => 'pages#bookexcerpts',   :via => :get
  match 'bookaudio' => 'pages#bookaudio',   :via => :get
  match 'friends' => 'pages#friends',   :via => :get
  match 'friends/:id' => 'pages#frienddetail',   :via => :get
  match 'games' => 'pages#games',   :via => :get
  match 'educational' => 'pages#educational',   :via => :get
  match 'recipes' => 'pages#recipes',   :via => :get
  match 'recipes/:id' => 'pages#recipesdetail',   :via => :get
  match 'hankandpals' => 'pages#hankandpals',   :via => :get
  match 'fanzone' => 'pages#fanzone',   :via => :get
  match 'printouts' => 'pages#printouts',   :via => :get
  match 'newsarchive' => 'pages#newsarchive',   :via => :get
  match 'retailers' => 'pages#retailers',   :via => :get
  match 'fullsite' => 'pages#viewfullsite',   :via => :get
  match 'music' => 'pages#music',   :via => :get

  # Features
  match 'feature/:slug_name' => 'pages#feature', :via => :get

  # Games
  match 'games/dogage' => 'games#dogage',   :via => :get
  match 'games/lightsoff' => 'games#lightsoff',   :via => :get
  match 'games/memory' => 'games#memory',   :via => :get
  match 'games/reaction' => 'games#reaction',   :via => :get
  match 'games/tictactoe' => 'games#tictactoe',   :via => :get
  match 'games/whackacoyote' => 'games#whackacoyote',   :via => :get
  match 'games/closet' => 'games#closet',   :via => :get
  match 'games/seedspit' => 'games#seedspit',   :via => :get
  
  # Forms and Func
  match 'contact' => 'contact#index',           :via => :get
  match 'contact' => 'contact#create',          :via => :post
  match 'stageplays' => 'screenplays#index',   :via => :get
  match 'stageplays/:id' => 'screenplays#detail', :via => :get
  match 'stageplays/:id' => 'screenplays#create', :via => :post
  match 'blog' => 'blog#index',   :via => :get
  match 'blog/category/:name' => 'blog#category',   :via => :get
  match 'blog/:id' => 'blog#show',   :via => :get
  match 'events' => 'events#index',   :via => :get
  match 'news' => 'news#index',   :via => :get
  match 'search/:id' => 'pages#search',   :via => :get
  match 'securityforce/member' => 'securityforce#member',   :via => :get
  match 'securityforce' => 'securityforce#login', :via => :post
  match 'securityforce' => 'securityforce#index', :via => :get
  match 'securityforce/map' => 'securityforce#map',   :via => :get
  match 'securityforce/dancingcowboy' => 'securityforce#dancingcowboy',   :via => :get

  # Admin login
  match 'admin' => 'admin/login#index',        :via => :get
  match 'admin' => 'admin/login#authenticate', :via => :post
  match 'admin/logout' => 'admin/login#logout', :via => :get

  root :to => "pages#index",   :via => :get
  
  # Catch-all for 404's
  match '*path' => 'pages#catcher',   :via => :get

end
