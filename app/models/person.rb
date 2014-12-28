require 'active_record/salesforce'

class Person < ActiveRecord::Base
  include ActiveRecord::Salesforce::Base

  attr_accessor :company_to_use


  after_save :set_to_salesforce

  salesforce_object :Lead

  #SalesForce_attribute, RDStation_attribute
  map_attribute :FirstName      , :name
  map_attribute :LastName       , :last_name
  map_attribute :Company        , :company
  map_attribute :Email          , :email
  map_attribute :JobTitle__c    , :job_title
  map_attribute :Phone          , :phone
  map_attribute :Website        , :website
  map_attribute :OwnerId        , :owner_id
  map_attribute :IsConverted    , :converted
  map_attribute :IsUnreadByOwner, :unread_by_owner

  def initialize(attributes={})
    super
    @converted ||= false
    @unread_by_owner ||= false
  end

  private
  def set_to_salesforce
    @config_file = YAML.load_file("config/salesforce.yml")
    save_in_salesforce @config_file[company_to_use]
  end

end
