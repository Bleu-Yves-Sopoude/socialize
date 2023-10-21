<% if current_user.likes.exists?(post_id: @post.id) %>
  <%= form_for @post.likes.find_by(user_id: current_user.id), method: :delete, remote: true do |f| %>
    <div class="actions">
      <%= f.submit "Unlike" %>
    </div>
  <% end %>
<% else %>
  <%= form_for @post.likes.build(user: current_user), remote: true do |f| %>
    <div class="actions">
      <%= f.submit "Like" %>
    </div>
  <% end %>
<% end %>