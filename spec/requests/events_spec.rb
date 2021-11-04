require 'rails_helper'

samples = [
  {
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
  },
  {
    src: {
      ip: '37.49.231.177',
      is_valid: IPAddress.valid_ip?('37.49.231.177'),
      is_private: IPAddress.valid_ip?('37.49.231.177') ? IPAddress('37.49.231.177').private? : false
    },
    dst: {
      ip: '72.44.211.10',
      is_valid: IPAddress.valid_ip?('72.44.211.10'),
      is_private: IPAddress.valid_ip?('72.44.211.10') ? IPAddress('72.44.211.10').private? : false
    },
    text: '<35>CEF:0|TippingPoint|UnityOne|1.0.0.17|13012|13012: SIP: SipVicious Brute Force SIP
      Tool|7|app=TCP cnt=1 dst=72.44.211.10 dpt=5060 act=Block cn1=0 cn1Label=VLAN ID
      cn2=16929789 cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-External-Inbound
      cs1Label=Profile Name cs2=00000002-0002-0002-0002-000000013012 cs2Label=Policy UUID
      cs3=00000001-0001-0001-0001-000000013012 cs3Label=Signature UUID cs4=6A 6B
      cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=Phoenix-1400N-1 cs6=
      cs6Label=Filter Message Parms src=37.49.231.177 spt=5067 externalId=19277953
      rt=1539343940073 cat=Exploits proto=TCP deviceInboundInterface=11 c6a2=
      c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod= dhost=
      sourceTranslatedAddress=37.49.231.177 c6a1= c6a1Label=Client IPv6 suser= sntdom=
      duser= dntdom=',
    snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|13012|13012:'
  },
  {
    src: {
      ip: '52.10.98.6',
      is_valid: IPAddress.valid_ip?('52.10.98.6'),
      is_private: IPAddress.valid_ip?('52.10.98.6') ? IPAddress('52.10.98.6').private? : false
    },
    dst: {
      ip: '1.202.126.172',
      is_valid: IPAddress.valid_ip?('1.202.126.172'),
      is_private: IPAddress.valid_ip?('1.202.126.172') ? IPAddress('1.202.126.172').private? : false
    },
    text: '<34>CEF:0|TippingPoint|UnityOne|1.0.0.17|32391|32391: TCP: Netcore/Netis Router
    Backdoor Communication Attempt|10|app=TCP cnt=1 dst=1.202.126.172 dpt=443413 act=Block
    cn1=0 cn1Label=VLAN ID cn2=17182102 cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace
    cs1=WCU-External-Inbound cs1Label=Profile Name
    cs2=00000002-0002-0002-0002-000000032391 cs2Label=Policy UUID
    cs3=00000001-0001-0001-0001-000000032391 cs3Label=Signature UUID cs4=6A 6B
    cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=Phoenix-1400N-1 cs6=
    cs6Label=Filter Message Parms src=52.10.98.6 spt=50003 externalId=19277778
    rt=1539339853003 cat=Vulnerabilities proto=TCP deviceInboundInterface=11 c6a2=
    c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod= dhost=
    sourceTranslatedAddress=52.10.98.6 c6a1= c6a1Label=Client IPv6 suser= sntdom= duser=
    dntdom=',
    snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|32391|32391:'
  },
  {
    src: {
      ip: '257.26.100.19',
      is_valid: IPAddress.valid_ip?('257.26.100.19'),
      is_private: IPAddress.valid_ip?('257.26.100.19') ? IPAddress('257.26.100.19').private? : false
    },
    dst: {
      ip: '216.69.185.6',
      is_valid: IPAddress.valid_ip?('216.69.185.6'),
      is_private: IPAddress.valid_ip?('216.69.185.6') ? IPAddress('216.69.185.6').private? : false
    },
    text: '<37>CEF:0|TippingPoint|UnityOne|1.0.0.17|7611|RepDV-Malware-Severe|1|app=IP cnt=1
    dst=216.69.185.6 dpt=443 act=Block cn1=219 cn1Label=VLAN ID cn2=33554431
    cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-Internal cs1Label=Profile Name
    cs2=6cc0731b-914d-4f78-bf97-0740ef196c53 cs2Label=Policy UUID
    cs3=00000001-0001-0001-0001-000000007611 cs3Label=Signature UUID cs4=2-3B 2-3A
    cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=PAS-TP2600NX-02
    cs6=cdn.advancedmactools.com cs6Label=Filter Message Parms src=257.26.100.19 spt=30974
    externalId=19277755 rt=1539338744077 cat=Reputation proto=IP deviceInboundInterface=19
    c6a2= c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod=
    dhost= sourceTranslatedAddress=257.26.100.19 c6a1= c6a1Label=Client IPv6 suser=
    sntdom= duser= dntdom=',
    snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|7611|RepDV-Malware-Severe|1|app=IP'
  },
  {
    src: {
      ip: '50.227.44.198',
      is_valid: IPAddress.valid_ip?('50.227.44.198'),
      is_private: IPAddress.valid_ip?('50.227.44.198') ? IPAddress('50.227.44.198').private? : false
    },
    dst: {
      ip: '185.53.177.31',
      is_valid: IPAddress.valid_ip?('185.53.177.31'),
      is_private: IPAddress.valid_ip?('185.53.177.31') ? IPAddress('185.53.177.31').private? : false
    },
    text: '<37>CEF:0|TippingPoint|UnityOne|1.0.0.17|7610|RepDV-Countries|1|app=IP cnt=1
      dst=185.53.177.31 dpt=25 act=Block cn1=136 cn1Label=VLAN ID cn2=33554431
      cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-External-Outbound
      cs1Label=Profile Name cs2=528d0a1d-41ba-42e7-927c-c7d4e5262aee cs2Label=Policy UUID
      cs3=00000001-0001-0001-0001-000000007610 cs3Label=Signature UUID cs4=1-1B 1-1A
      cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=AH-TIP5200NX-01
      cs6=185.53.177.31 cs6Label=Filter Message Parms src=50.227.44.198 spt=52172
      externalId=19277712 rt=1539336541077 cat=Reputation proto=IP deviceInboundInterface=3
      c6a2= c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod=
      dhost= sourceTranslatedAddress=50.227.44.198 c6a1= c6a1Label=Client IPv6 suser=
      sntdom= duser= dntdom=',
    snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|7610|RepDV-Countries|1|app=IP'
  },
  {
    src: {
      ip: '192.168.1.50',
      is_valid: IPAddress.valid_ip?('192.168.1.50'),
      is_private: IPAddress.valid_ip?('192.168.1.50') ? IPAddress('192.168.1.50').private? : false
    },
    dst: {
      ip: '72.44.211.23',
      is_valid: IPAddress.valid_ip?('72.44.211.23'),
      is_private: IPAddress.valid_ip?('72.44.211.23') ? IPAddress('72.44.211.23').private? : false
    },
    text: '<36>CEF:0|TippingPoint|UnityOne|1.0.0.17|560|0560: TCP: Version Request (TCP)|4|
      app=TCP cnt=1 dst=72.44.211.23 dpt=443 act=Block cn1=0 cn1Label=VLAN ID cn2=84084733
      cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-External-Inbound
      cs1Label=Profile Name cs2=00000002-0002-0002-0002-000000000560 cs2Label=Policy UUID
      cs3=00000001-0001-0001-0001-000000000560 cs3Label=Signature UUID cs4=6A 6B
      cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=Phoenix-1400N-1 cs6=
      cs6Label=Filter Message Parms src=192.168.1.50 spt=52669 externalId=19277738
      rt=1539337861062 cat=Reconnaissance proto=TCP deviceInboundInterface=11 c6a2=
      c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod=
      dhost=DTM-AdluminMBP sourceTranslatedAddress=192.168.1.50 c6a1= c6a1Label=Client IPv6
      suser= sntdom= duser= dntdom=',
    snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|560|0560:'
  },
  {
    src: {
      ip: '10.0.1.175',
      is_valid: IPAddress.valid_ip?('10.0.1.175'),
      is_private: IPAddress.valid_ip?('10.0.1.175') ? IPAddress('10.0.1.175').private? : false
    },
    dst: {
      ip: '185.26.219.34',
      is_valid: IPAddress.valid_ip?('185.26.219.34'),
      is_private: IPAddress.valid_ip?('185.26.219.34') ? IPAddress('185.26.219.34').private? : false
    },
    text: '<36>CEF:0|TippingPoint|UnityOne|1.0.0.17|560|0560: TCP: Version Request (TCP)|4|
      app=TCP cnt=1 dst=185.26.219.34 dpt=443 act=Block cn1=0 cn1Label=VLAN ID cn2=84084733
      cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-External-Inbound
      cs1Label=Profile Name cs2=00000002-0002-0002-0002-000000000560 cs2Label=Policy UUID
      cs3=00000001-0001-0001-0001-000000000560 cs3Label=Signature UUID cs4=6A 6B
      cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=Phoenix-1400N-1 cs6=
      cs6Label=Filter Message Parms src=10.0.1.175 spt=52669 externalId=19277738
      rt=1539337861062 cat=Reconnaissance proto=TCP deviceInboundInterface=11 c6a2=
      c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod=
      dhost=DTM-AdluminMBP sourceTranslatedAddress=10.0.1.175 c6a1= c6a1Label=Client IPv6
      suser= sntdom= duser= dntdom=',
    snippet: 'CEF:0|TippingPoint|UnityOne|1.0.0.17|560|0560:'
  }
]

RSpec.describe 'Events', type: :request do
  describe 'GET /events' do
    it 'Renders the index template' do
      get events_path
      expect(response).to render_template(:index)
    end
  end

  describe '#create' do
    before(:each) do
      @rand_idx = rand(6)
    end

    it 'Can create an event' do
      post '/events', params: { event: { log_txt: samples[@rand_idx][:text] } }
      expect(response).to redirect_to(event_path(assigns(:event)))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include(samples[@rand_idx][:snippet])
    end

    describe 'Can create multiple events' do
      samples.each_with_index do |sample, index|

        it "Can create event ##{index + 1}" do
          post '/events', params: { event: { log_txt: sample[:text] } }
          expect(response).to redirect_to(event_path(assigns(:event)))
          follow_redirect!
          expect(response).to render_template(:show)
          expect(response.body).to include(sample[:snippet])
        end

      end
    end

    it 'Can extract src IP address from log text' do
      post '/events', params: { event: { log_txt: samples[@rand_idx][:text] } }
      expect(Event.last.src).to eq(samples[@rand_idx][:src][:ip])
    end

    describe 'Can parse src IP' do
      before(:each) do
        post '/events', params: { event: { log_txt: samples[@rand_idx][:text] } }
      end
      it 'Can determine if the IP address is valid' do
        expect(Event.last.src_is_valid).to eq(samples[@rand_idx][:src][:is_valid])
      end

      it 'Can determine if the IP address is private' do
        expect(Event.last.src_is_private).to eq(samples[@rand_idx][:src][:is_private])
      end
    end

    it 'Can extract dst IP address from log text' do
      post '/events', params: { event: { log_txt: samples[@rand_idx][:text] } }
      expect(Event.last.dst).to eq(samples[@rand_idx][:dst][:ip])
    end

    describe 'Can parse dst IP' do
      before(:each) do
        post '/events', params: { event: { log_txt: samples[@rand_idx][:text] } }
      end
      it 'Can determine if the IP address is valid' do
        expect(Event.last.dst_is_valid).to eq(samples[@rand_idx][:dst][:is_valid])
      end
      it 'Can determine if the IP address is private' do
        expect(Event.last.dst_is_private).to eq(samples[@rand_idx][:dst][:is_private])
      end
    end

    describe 'Rejects invalid input' do
      it 'Rejects an empty form submit' do
        post '/events', params: { event: { log_txt: '' } }
        expect(response.body).to include('Form cannot be empty')
      end

      it 'Rejects input without a src IP' do
        post '/events', params: { event: { log_txt: ' dst=52.10.98.6 ' } }
        expect(response.body).to include('Provided log must include a source IP')
      end

      it 'Rejects input wout a dst IP' do
        post '/events', params: { event: { log_txt: ' src=52.10.98.6 ' } }
        expect(response.body).to include('Provided log must include a destination IP')
      end
    end
  end

  describe '#destroy' do
    before(:each) do
      post '/events', params: { event: { log_txt: samples[rand(6)][:text] } }
    end

    it 'Redirects the user after a delete request' do
      delete "/events/#{Event.last.id}"
      expect(response).to have_http_status(302)
    end

    it 'Succesfully deletes an existing record' do
      delete "/events/#{Event.last.id}"
      follow_redirect!
      expect(response.body).to include('Record deleted!')
    end

    it 'Displays a warning if a user tries to delete a non-existant error' do
      delete '/events/9000'
      follow_redirect!
      expect(response.body).to include('Record could not be found')
    end
  end
end
