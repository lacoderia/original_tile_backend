feature 'RegistrationsController' do
  
  describe 'registration process' do
    context 'user creation' do 

      it 'successfully creates user and doesnt log him initially, then after being activated he can log in' do

        new_user = { first_name: "test", last_name: "user", email: "test@user.com", password: "12345678", password_confirmation: "12345678" }
        
        # Validates user creation
        page = register_with_service new_user 
        response = JSON.parse(page.body)
        expect(response['user']['first_name']).to eq new_user[:first_name]
        user_01 = User.find(response['user']['id'])
        expect(user_01.active).to be false
        
        page = get_session 
        response = JSON.parse(page.body)
        expect(response["errors"][0]["title"]).to eql "No se ha iniciado sesión."

        user_01.update_attribute(:active, true)

        login_with_service user = { email: user_01.email, password: "12345678" }
        access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
        set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1
        
        response = JSON.parse(page.body)      
        expect(response["user"]["id"]).to eql user_01.id

        page = get_session 
        response = JSON.parse(page.body)
        expect(response["user"]["id"]).to eql user_01.id

      end

    end
    
  end

end
