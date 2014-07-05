require 'spec_helper'

describe MoonsController do

  describe 'given a moon' do

    before :each do
      @mars = Planet.new
      @mars.name = 'Mars'
      @mars.life = false
      @mars.image_url = 'http://space-facts.com/wp-content/uploads/mars.jpg'
      @mars.save

      @moon = Moon.new
      @moon.name = 'Moon'
      @moon.image_url = 'http://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg'
      @moon.planet_id = @mars.id
      @moon.save
    end

    describe 'GET index' do

      before :each do
        get :index, :planet_id => @mars.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @moons' do
        actual = assigns(:moons)
        expected = [@moon]
        expect(actual).to eq(expected)
      end

    end # GET moons index

    describe 'GET show' do

      before :each do
        get :show, :id => @moon.id, :planet_id => @mars.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @moon' do
        actual = assigns(:moon)
        expected = @moon
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

    end # GET moons show

    describe 'GET edit' do

      before :each do
        get :edit, :id => @moon.id, :planet_id => @mars.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @moon' do
        actual = assigns(:moon)
        expected = @moon
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

    end # GET moons edit

    describe 'POST update' do

      before :each do
        post :update, :id => @moon.id, :moon => {name: 'M00N'}, :planet_id => @mars.id
      end

      it 'responds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates moon record' do
        @moon.reload
        actual = @moon.name
        expected = 'M00N'
        expect(actual).to eq(expected)
      end

      it 'redirects to show' do
        response.should redirect_to planet_moon_path(@mars, @moon)
      end

    end # POST moons update

    describe 'DELETE destroy' do

      it 'destroys moon record' do
        expect {delete :destroy, {:id => @moon.id}, {:planet_id => @mars.id}}
        .to change(Moon, :count)
        .by(-1)
      end

    end

  end

end
