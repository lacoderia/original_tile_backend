feature 'RegistrationsController' do
  
  describe 'registration process' do
    context 'user creation' do 

      it 'successfully creates user and doesnt log him initially, then after being activated he can log in' do

        new_user = { name: "test user", email: "test@user.com", password: "12345678", password_confirmation: "12345678", location: "MX", country: "Mexico", city: "Rose", state: "Luigi", address: "test address", phone: "43453453", zip: "744623" }
        
        # Validates user creation
        page = register_with_service(new_user, true)
        response = JSON.parse(page.body)
        expect(response['user']['name']).to eq new_user[:name]
        user_01 = User.find(response['user']['id'])
        # Changed from false to true -- production has true value as well
        expect(user_01.active).to be true 

        #Sent registration email
        expect(user_01.emails.count).to eql 1

        page = get_session 
        response = JSON.parse(page.body)
        expect(response["errors"][0]["title"]).to eql "No se ha iniciado sesión."

        user_01.update_attribute(:active, true)
        
        #Sent welcome email -- changed from 2 to 1 because it is activated since the creation
        expect(user_01.emails.count).to eql 1

        login_with_service user = { email: user_01.email, password: "12345678" }
        access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
        set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1
        
        response = JSON.parse(page.body)      
        expect(response["user"]["id"]).to eql user_01.id

        page = get_session 
        response = JSON.parse(page.body)
        expect(response["user"]["id"]).to eql user_01.id

        #Only send email one time
        user_01.update_attribute(:active, false)
        user_01.update_attribute(:active, true)
        #Changed from 2 to 1 - same as line 27
        expect(user_01.emails.count).to eql 1

      end

       it 'cant create user if it doesnt contain required fields' do

        new_user = { name: "test user", email: "test@user.com", password: "12345678", password_confirmation: "12345678" }
        
        # Validates user creation
        page = register_with_service(new_user, true)
        response = JSON.parse(page.body)
        expect(response['errors'].last['title']).to eql "No se pudo crear el usuario."  

        # Missing internal attribute
        new_user = { name: "test user", email: "test@user.com", password: "12345678", password_confirmation: "12345678", location: "MX", country: "Mexico", city: "Rose", state: "Luigi" }
        
        page = register_with_service(new_user, nil)
        response = JSON.parse(page.body)
        expect(response['errors'].first['title']).to eql "Se necesita saber si el usuario es interno o externo."  
        
      end

    end
    
  end

end
