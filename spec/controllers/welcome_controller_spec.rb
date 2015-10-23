require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #terms" do
    it "responds successfully with an HTTP 200 status code" do
      get :terms
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the terms template" do
      get :terms
      expect(response).to render_template("terms")
    end
  end

  describe "GET #privacy" do
    it "responds successfully with an HTTP 200 status code" do
      get :privacy
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the privacy template" do
      get :privacy
      expect(response).to render_template("privacy")
    end
  end

end