feature 'UsersController' do

  let!(:user_01){create(:user)}
  let!(:user_02){create(:user, active: false)}

  context 'login' do

    it 'should sign in ' do
      
      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1
      
      response = JSON.parse(page.body)      
      expect(response["user"]["id"]).to eql user_01.id
      
    end

    it 'should not let the inactive user sign in' do

      login_with_service user = { email: user_02.email, password: "12345678" }
      
      response = JSON.parse(page.body)
      expect(response["errors"][0]["title"]).to eql "Tu usuario no ha sido activado."
      expect(page.status_code).to be 500

    end

  end

end
