feature 'ProjectsController' do

  let!(:user_01){create(:user)}

  context 'send project via email' do
    
    let!(:project){create(:project, user: user_01)}

    it 'should send a project via email' do
      
      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      project_via_email = { email: "test@email.com", project_id: project.id}
      with_rack_test_driver do
        page.driver.post send_by_email_projects_path, project_via_email
      end

      response = JSON.parse(page.body)
      expect(response["project"]["id"]).to eql project.id 

    end

    it 'should error if not logged in' do
      
      page.driver.submit :delete, "/projects/send_by_email", {}
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end

  end

  context 'delete project for user' do

    let!(:project){create(:project, user: user_01)}
    let!(:project_2){create(:project, user: user_01)}
    
    let!(:user_02){create(:user)}
    let!(:project_3){create(:project, user: user_02)}
    
    it 'should delete a project for the logged in user' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      project_tile_count = ProjectTile.count
      page.driver.submit :delete, "/projects/#{project.id}", {}
      # Testing dependent destroy on project_tiles on project deletion
      expect(ProjectTile.count).to eql (project_tile_count - 3)
      response = JSON.parse(page.body)
      expect(response["projects"][0]["id"]).to eql project_2.id

    end

    it 'should error if tries to delete project from another user' do

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      page.driver.submit :delete, "/projects/#{project_3.id}", {}
      response = JSON.parse(page.body)
      expect(response['errors'].first['title']).to eql "El projecto no pertenece a ese usuario."  

    end

    it 'should error if not logged in' do
      
      page.driver.submit :delete, "/projects/#{project.id}", {}
      response = JSON.parse(page.body)
      expect(page.status_code).to be 401

    end

  end

  context 'save projects for user' do

    let!(:tile_type_01){create(:tile_type)}
    let!(:tile_type_02){create(:tile_type, key: '4x4')}
    
    let!(:tile_1){create(:tile, tile_type: tile_type_01)}
    let!(:tile_2){create(:tile, tile_type: tile_type_01, active: false)}
    let!(:tile_3){create(:tile, tile_type: tile_type_02)}

    it 'should save the project for the user' do
      
      expect(Project.count).to eql 0

      login_with_service user = { email: user_01.email, password: "12345678" }
      access_token_1, uid_1, client_1, expiry_1, token_type_1 = get_headers
      set_headers access_token_1, uid_1, client_1, expiry_1, token_type_1

      new_project = { name: "Test proj", url: "test url", filename: "filename.pdf", tile_ids:[tile_1.id, tile_2.id, tile_3.id], description: "test"}
      with_rack_test_driver do
        page.driver.post save_projects_path, new_project
      end

      response = JSON.parse(page.body)
      expect(response["project"]["name"]).to eql "Test proj"
      expect(response["project"]["description"]).to eql "test"
      expect(response["project"]["filename"]).to eql "filename.pdf"
      expect(response["project"]["tiles"].count).to eql 3
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
