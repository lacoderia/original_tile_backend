feature 'UsersController' do

  let!(:user_01){create(:user)}

  context 'login' do

    it 'should sign in ' do
      
      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      byebug
      
    end

  end

end
