<%= form_for(@post.likes.new, url: user_post_likes_path(@post.user, @post)) do |form| %>
    <%= form.submit "Like", class: 'btn btn-primary' %>
  <% end %>