require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  
  test 'unauthorized user will be redirected to root path' do
    get "/questions"
    assert_redirected_to root_path
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post "/session", params: { email: Faker::Lorem.word, password: Faker::Lorem.word }
    assert_redirected_to "/session/new?locale=en"
  end

  test 'user with correct credentials will see the root' do
    password = '123456789'

    user = User.create(email: "testuserrrr@mail.com", name: Faker::Lorem.word, password: password, password_confirmation: password)
    post "/session", params: { email: user.email, password: password } 

    assert_redirected_to "/en"

     user.delete
 
  end


  test 'user can logout' do
    password = '12345678910'
    user = User.create(email: "testt@mail.com", name: Faker::Lorem.word, password: password, password_confirmation: password)

    post "/session", params: { email: user.email, password: password } 

    get sessions_destroy_url

    assert_redirected_to "/en"
  end

end