require "rails_helper"

RSpec.describe Admin::SuppliersController do
	
	describe "SuppliersController" do

  	describe "logged" do

			before(:each) do
 				@supplier = Supplier.create!(name: "Supplier1")
 				@user = User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1", admin: true)
		    sign_in(@user)
  		end
  		
  		describe "GET index" do

		    it "renders the index template" do
		      get :index
		      expect(response).to render_template(:index)
		    end

		    it "correct response" do
		      get :index
		      expect(assigns(:suppliers)).to eq([@supplier])
		    end

		  end

		  describe "GET new" do

		    it "renders the new template" do
		      get :new
		      expect(response).to render_template(:new)
		    end

		    it "create a new supplier" do
		      get :new
		      expect(assigns(:supplier)).to be_a_new(Supplier)
		    end
		  end

		  describe "GET edit" do

		    it "renders the edit template" do
		      get :edit ,params: {id: @supplier.id}
		      expect(response).to render_template(:edit)
		    end

		     it "correct response" do
		      get :edit ,params: {id: @supplier.id}
		      expect(assigns(:supplier)).to eq(@supplier)
		    end

		  end

		  describe "POST create" do

		   	it "correct answer" do
		      post :create ,params: {supplier: {name: "test"}}
		      expect(response).to redirect_to admin_suppliers_url
		    end

		    it "fail and redirect to new" do
		      post :create ,params: {supplier: {name: @supplier.name}}
		      expect(response).to render_template(:new)
		    end

		  end

		  describe "PUT update" do

		   	it "correct answer" do
		      put :update ,params: {id: @supplier.id, supplier: {name: "test"}}
		      expect(response).to redirect_to admin_suppliers_url
		    end

		    it "fail and renders the edit template" do
		      put :update ,params: {id: @supplier.id, supplier: {name: ""}}
		      expect(response).to render_template(:edit)
		    end

		  end

		  describe "DELETE destroy" do

		   	it "correct answer" do
		      delete :destroy ,params: {id: @supplier.id}
		      expect(response).to redirect_to admin_suppliers_url
		    end

		  end

	    
	  end



	  describe "not logged" do

	  	before(:each) do
		    sign_in(nil)
  		end

  		describe "GET index" do
		 		it "redirect to login" do
		      get :index
		      expect(response).to redirect_to new_user_session_path
		    end
		  end

		  describe "GET new" do
		 		it "redirect to login" do
		      get :new
		      expect(response).to redirect_to new_user_session_path
		    end
		  end

		  describe "GET edit" do
		 		it "redirect to login" do
		      get :edit ,params: {id: 1}
		      expect(response).to redirect_to new_user_session_path
		    end
		  end

		   describe "POST create" do
		 		it "redirect to login" do
		      post :create 
		      expect(response).to redirect_to new_user_session_path
		    end
		  end

		  describe "PUT update" do
		 		it "redirect to login" do
		      put :update ,params: {id: 1}
		      expect(response).to redirect_to new_user_session_path
		    end
		  end

		  describe "POST create" do
		 		it "redirect to login" do
		      delete :destroy ,params: {id: 1}
		      expect(response).to redirect_to new_user_session_path
		    end
		  end
	  end

	end
end