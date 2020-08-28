# messages nested
- https://github.com/railscasts/262-trees-with-ancestry
- http://railscasts.com/episodes/262-trees-with-ancestry?autoplay=true


## steps
1. generate model
```rb
rails g model Message content:text
```

2. generate controller
```rb
rails g controller Messages index show new create destroy
```

3. routes
```rb
resources :messages
root :to => 'messages#index'
```