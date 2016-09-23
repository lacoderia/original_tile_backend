feature 'ProjectsController' do

  let!(:user_01){create(:user)}

  context 'save projects for user' do

    it 'should save the project for the user' do
      
      expect(Project.count).to eql 0

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      new_project = { name: "Test proj", url: "test url"}
      with_rack_test_driver do
        page.driver.post save_projects_path, new_project
      end

      response = JSON.parse(page.body)
      expect(response["project"]["name"]).to eql "Test proj"
      project_id = response["project"]["id"]
      expect(Project.count).to eql 1

      visit by_user_projects_path
      response = JSON.parse(page.body)
      expect(response["projects"][0]["id"]).to eql project_id

    end

    it 'should error if not logged in' do
      
      new_project = { name: "Test proj", url: "test url"}
      with_rack_test_driver do
        page.driver.post save_projects_path, new_project
      end

      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end

  end

  context 'get projects by user' do
  
    let!(:project){create(:project, user: user_01)}

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
