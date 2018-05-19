class TestDataController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @test_data = TestDatum.all
    render json: @test_data
  end

  def create
    test_data = TestDatum.new(test_data_params)

    if test_data.save
      render json: { happy_time: 'yes', status: 'created' }
    else
      render json: {
        error: {
          id: 'unable-to-save-test-data',
          message: 'The test data was received but we were unable to save it to our database.'
        }
      }
    end
  end

  private

  def test_data_params
    params.require(:test_datum).permit(:name, :favorite_food, :favorite_drink)
  end
end
