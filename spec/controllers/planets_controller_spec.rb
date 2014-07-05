require 'spec_helper'

describe PlanetsController do

  describe 'given a planet' do

    before :each do
      @mars = Planet.new
      @mars.name = 'Mars'
      @mars.life = false
      @mars.image_url = 'http://space-facts.com/wp-content/uploads/mars.jpg'
      @mars.save
    end

    describe 'GET index' do

      before :each do
        get :index
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @planets' do
        actual = assigns(:planets)
        expected = [@mars]
        expect(actual).to eq(expected)
      end

    end # GET index

    describe 'GET show' do

      before :each do
        get :show, :id => @mars.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @planet' do
        actual = assigns(:planet)
        expected = @mars
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

    end # GET show

    describe 'GET edit' do

      before :each do
        get :edit, :id => @mars.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @planet' do
        actual = assigns(:planet)
        expected = @mars
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

    end # GET edit

    describe 'POST update' do

      before :each do
        post :update, {:id => @mars.id, :planet => {name: 'Jupiter'}}
      end

      it 'responds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates planet record' do
        @mars.reload
        actual = @mars.name
        expected = 'Jupiter'
        expect(actual).to eq(expected)
      end

      it 'redirects to show' do
        response.should redirect_to planet_path(@mars)
      end

    end # POST update

    describe 'DELETE destroy' do

      it 'destroys planet record' do
        expect {delete :destroy, {:id => @mars.id}}
        .to change(Planet, :count)
        .by(-1)
      end

    end # DELETE destroy

  end # Given a planet

  describe 'GET new' do

    before :each do
      get :new
    end

    it 'responds successfully' do
      actual = response.code
      expected = '200'
      expect(actual).to eq(expected)
    end

    it 'renders the new template' do
      expect(response).to render_template('new')
    end

  end # GET new

  describe 'POST create' do

    before :each do
      post :create, {:planet => {name: 'Saturn', life: false, image_url: 'http://www.saturn.com'}}
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'inserts a planet record' do
      actual = Planet.last.name
      expected = 'Saturn'
      expect(actual).to eq(expected)
    end

    it 'redirects to show' do
      response.should redirect_to planet_path(Planet.last)
    end

  end # POST create

end # PlanetsController
