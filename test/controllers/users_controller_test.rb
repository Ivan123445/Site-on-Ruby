require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def create_user
    @user = User.new(real_name: 'Кирилл', nickname: 'kiryuha12', password_digest: '1234')
    @nickname = Faker::Name.first_name
    post users_url,
         params: { user: { nickname: @nickname, password_conf: @user.password_digest,
                           password: @user.password_digest, real_name: @user.real_name } }
    post session_create_url, params: { user: @nickname, password: @user.password_digest }
    @user = User.find_by_nickname @nickname
  end

  def save_game
    @game_title = Faker::Game.title
    post games_url, params: { game: { name: @game_title, creator: @nickname } }
    @game = Game.find_by_name @game_title
  end

  def create_post
    @post_title = Faker::Game.title
    post posts_url, params: { post: { title: @post_title } }
    @post = Post.find_by_title @post_title
  end

  setup do
    create_user
    save_game
    get posts_url, params: { game: @game_title }
    create_post
    get comments_url, params: { post: @post.id }
  end

  def create_comment
    @text = Faker::Lorem.word
    post comments_url, params: { text: @text }
    @comment = Comment.find_by_text @text
  end

  setup do
    @user = users(:one)
  end

  # test "should get index" do
  #   get users_url
  #   assert_response :success
  # end

  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_user_url
  #   assert_response :success
  # end

  # test "should create user" do
  #   p @user
  #   assert_difference('User.count') do
  #     post users_url, params: { user: { email: "test3@mail.com", name: @user.name, password: @user.password_digest, password_confirmation: @user.password_digest } }
  #   end

  #   assert_redirected_to root_path
  # end

  # test "should get edit" do
  #   p @user
  #   post edit_user_url, params: { user: { email: @user.email, name: @user.name, password: @user.password_digest, password_confirmation: @user.password_digest, old_password: @user.password_digest } }
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest } }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end

  #   assert_redirected_to users_url
  # end
end
