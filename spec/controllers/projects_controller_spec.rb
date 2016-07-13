feature 'ProjectsController' do

  let!(:user_01){create(:user)}
  let!(:project){create(:project, user: user_01)}

  context 'get projects by user' do

    it 'should get the projects by the logged in user' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      visit by_user_projects_path
      response = JSON.parse(page.body)
      expect(response["projects"][0]["id"]).to eql project.id

    end

    it 'should get error for not logged in' do

      visit by_user_projects_path
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end
    
  end
  

end
