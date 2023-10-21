<%= form_for Like.new do |f| %>
    <%= f.hidden_field :user_id, value: current_user.id %>
    <%= f.hidden_field :post_id, value: @post.id %>
    <div class="actions">
      <%= f.submit "Like" %>
    </div>
  <% end %>