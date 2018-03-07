feature 'TileTypesController' do

  let!(:user_01){create(:user)}
  let!(:tile_type_01){create(:tile_type, shape: "hex")}
  let!(:tile_type_02){create(:tile_type, key: '4x4')}
  let!(:tile_type_03){create(:tile_type, key: '6x6', active: false)}
  
  context 'get tile types' do

    it 'should get the tile types' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      visit tile_types_path 
      response = JSON.parse(page.body)
      expect(response["tile_types"].length).to be 2
      expect(response["tile_types"][0]["key"]).to eql tile_type_01.key
      expect(response["tile_types"][0]["shape"]).to eql "hex" 

      tile_type_03.update_attribute(:active, true)

      visit tile_types_path 
      response = JSON.parse(page.body)
      expect(response["tile_types"].length).to be 3      

    end

    it 'should get error for not logged in' do

      visit tile_types_path
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end

  end
  
end
