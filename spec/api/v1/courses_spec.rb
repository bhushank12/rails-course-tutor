require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  let(:valid_attributes) do
    {
      course: {
        name: 'Mathematics',
        start_date: Time.current,
        end_date: Time.current + 5.days,
        description: 'Complete mathematics course',
        tutors_attributes: [
          { name: 'Abc Pqr', email: "abc@gmail.com" },
          { name: 'Mno Xyz', email: "mno@gmail.com" }
        ]
      }
    }
  end

  let(:course) { FactoryBot.create(:course) }
  let(:tutor) { FactoryBot.create(:tutor, course: course) }

  describe 'POST /api/v1/courses' do
    context 'with valid parameters' do
      it 'creates a new course with tutors' do
        expect {
          post '/api/v1/courses', params: valid_attributes
        }.to change(Course, :count).by(1).and change(Tutor, :count).by(2)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns an unprocessable entity status' do
        post '/api/v1/courses', params: { course: { name: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /api/v1/courses' do
    before do
      course
      tutor
    end

    it 'returns a list of courses with their tutors' do
      get '/api/v1/courses'
      response_body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response_body.count).to be >= 1
    end
  end
end
