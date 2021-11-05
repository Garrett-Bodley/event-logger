require 'rails_helper'

sample = {
  src: {
    ip: '50.227.44.198',
    is_valid: IPAddress.valid_ip?('50.227.44.198'),
    is_private: IPAddress.valid_ip?('50.227.44.198') ? IPAddress('50.227.44.198').private? : false
  },
  dst: {
    ip: '52.10.98.6',
    is_valid: IPAddress.valid_ip?('52.10.98.6'),
    is_private: IPAddress.valid_ip?('52.10.98.6') ? IPAddress('52.10.98.6').private? : false
  },
  text: '<37>CEF:0|TippingPoint|UnityOne|1.0.0.17|7610|Adlumin RepDV Manual Block|1|app=IP
    cnt=3 dst=52.10.98.6 dpt=443 act=Block cn1=0 cn1Label=VLAN ID cn2=33554431
    cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-External-Outbound
    cs1Label=Profile Name cs2=6e664408-b90a-48e2-9a2d-c01cb9258381 cs2Label=Policy UUID
    cs3=00000001-0001-0001-0001-000000007610 cs3Label=Signature UUID cs4=1-1B 1-1A
    cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=PAS-TIP2600NX-01
    cs6=50.227.44.198 cs6Label=Filter Message Parms src=50.227.44.198 spt=10162
    externalId=19278229 rt=1539348361056 cat=Reputation proto=IP deviceInboundInterface=3
    c6a2= c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod=
    dhost= sourceTranslatedAddress=50.227.44.198 c6a1= c6a1Label=Client IPv6 suser=
    sntdom= duser= dntdom=',
  snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|7610|Adlumin'
}

RSpec.describe 'Comments', type: :request do
  before(:all) do
    Event.create(log_txt: sample[:text], src: sample[:src][:ip], dst: sample[:dst][:ip])
  end

  describe '#create' do
    before(:each) do
      post '/comments', params: {
        comment: {
          name: Faker::Name.name, content: Faker::Lorem.paragraph, event_id: Event.last.id
        }
      }
    end

    it 'Can create a new comment' do
      expect(Comment.count).to eq(1)
    end

    it 'Redirects the user after creating a comment' do
      expect(response).to have_http_status(302)
    end

    it 'Displays a success message when a comment is created' do
      follow_redirect!
      expect(response.body).to include('Comment added')
    end
  end

  describe 'GET /comments/:id/edit' do
    before(:each) do
      post '/comments', params: {
        comment: {
          name: Faker::Name.name, content: Faker::Lorem.paragraph, event_id: Event.last.id
        }
      }
    end

    it 'Has an edit page' do
      get "/comments/#{Comment.last.id}/edit"
      expect(response).to have_http_status(200)
    end

    it 'Displays the current comment values' do
      get "/comments/#{Comment.last.id}/edit"
      expect(response.body).to include(Comment.last.name, Comment.last.content)
    end

    it 'Redirects the user if a non existant comment_id is provided' do
      get '/comments/9000/edit'
      expect(response).to have_http_status(302)
    end

    it 'Warns the user if they attempt to edit a non-existant comment' do
      get '/comments/9000/edit'
      follow_redirect!
      expect(response.body).to include('Record could not be found')
    end
  end

  describe 'PATCH /comments/:id' do
    before(:each) do
      Comment.create(name: Faker::Name.name, content: Faker::Lorem.paragraph, event_id: Event.last.id)
    end

    it 'Can update an existing comment' do
      prev_content = Comment.last.content
      prev_name = Comment.last.name
      patch "/comments/#{Comment.last.id}", params: {
        comment: { name: Faker::Name.name, content: Faker::Lorem.paragraph, event_id: Event.last.id }
      }
      follow_redirect!
      expect(response.body).not_to include(prev_content, prev_name)
    end

    it 'Rejects a patch request to a non existing comment' do
      patch '/comments/9000', params: {
        comment: { name: Faker::Name.name, content: Faker::Lorem.paragraph, event_id: Event.last.id }
      }
      follow_redirect!
      expect(response.body).to include('Record could not be found')
    end
  end

  describe 'DELETE /comments/:id' do
    before(:each) do
      Comment.create(name: Faker::Name.name, content: Faker::Lorem.paragraph, event_id: Event.last.id)
    end

    it 'Can delete an existing comment' do
      delete "/comments/#{Comment.last.id}"
      expect(Comment.count).to eq(0)
    end

    it "Rejects delete attempts to comments that don't exist" do
      delete '/comments/9000'
      follow_redirect!
      expect(response.body).to include('Record could not be found')
    end
  end
end
