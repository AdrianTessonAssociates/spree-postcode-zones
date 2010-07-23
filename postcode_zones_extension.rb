# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PostcodeZonesExtension < Spree::Extension
  version "1.0"
  description "Allows zones to be defined by a list of postcodes"
  url "http://www.tesson.co.uk/"

  
  def activate

    Zone.class_eval do

      def kind
        member = self.members.last
        case member && member.zoneable_type
        when "State"  then "state"
        when "Zone"   then "zone"
        when "PostcodeList" then "postcode_list"
        else
          "country"
        end
      end

      def include?(address)
        return false unless address

        # NOTE: This is complicated by the fact that include? for HMP is broken in Rails 2.1 (so we use awkward index method)
        members.any? do |zone_member|
          case zone_member.zoneable_type
          when "Zone"
            zone_member.zoneable.include?(address)
          when "Country"
            zone_member.zoneable == address.country
          when "State"
            zone_member.zoneable == address.state
          when "PostcodeList"
            address.zipcode and zone_member.zoneable.include?(address.zipcode)
          else
            false
          end
        end
      end
    end

    Admin::ZonesController.class_eval do
      def load_data
        @countries = Country.all.sort
        @states = State.all.sort
        @zones = Zone.all.sort
        @postcode_lists = PostcodeList.all.sort
      end
    end

  end
end
