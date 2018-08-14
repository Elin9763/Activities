Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '0edda55d0fce0fdb895c', '2d006378d5c8bafaf43b33791693d2f2a9126373'
end