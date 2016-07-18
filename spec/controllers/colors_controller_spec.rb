feature 'ColorsController' do

  let!(:user_01){create(:user)}
  let!(:color_red){create(:color)}
  let!(:color_red_inactive){create(:color, hex_value: "#FE0000", active:false)}

  context 'get active colors' do

    it 'should get all the active colors' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      visit colors_path 
      response = JSON.parse(page.body)
      expect(response["colors"].length).to eql 1
      expect(response["colors"][0]["id"]).to eql color_red.id
      
    end

    it 'should get error for not logged in' do

      visit by_user_projects_path
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end

  end

end
