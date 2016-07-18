feature 'TilesController' do

  let!(:user_01){create(:user)}
  let!(:tile_active){create(:tile)}
  let!(:tile_inactive){create(:tile, active: false)}

  context 'get tile types' do

    it 'should get the tile types' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      visit tile_types_tiles_path 
      response = JSON.parse(page.body)
      expect(response["tile_types"].length).to be > 1
      expect(response["tile_types"][0]["key"]).to eql tile_active.tile_type

    end

    it 'should get error for not logged in' do

      visit tile_types_tiles_path
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end

  end

  context 'get active tiles by type' do

    it 'should get the active tiles' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      visit "#{by_tile_type_tiles_path}?tile_type=3x3"
      response = JSON.parse(page.body)
      expect(response["tiles"].length).to eql 1
      expect(response["tiles"][0]["id"]).to eql tile_active.id

    end

    it 'should get error for not logged in' do

      visit by_tile_type_tiles_path
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end
    
  end

end
