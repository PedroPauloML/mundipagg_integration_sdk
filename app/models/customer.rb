class Customer < ApplicationRecord
  # Validations
  validates_presence_of :name, :code, :status
  validates_uniqueness_of :code
  validates_uniqueness_of :customer_id, if: -> { self.customer_id.present? }

  # Enums
  enum status: [:not_created, :created]

  # Callbacks
  after_create :create_customer
  after_update :update_customer

  def create_customer
    customers_controller = MundiApiClient.customers
    request = MundiApi::CreateCustomerRequest.from_hash(self.attributes.slice('name', 'code'))

    begin
      result = customers_controller.create_customer(request, nil)
    rescue => ex
      self.errors.add(:base, ex.message)
      raise ActiveRecord::Rollback
    end

    self.customer_id = result.id
    self.status = :created
    self.save

    return result
  end

  def update_customer
    customers_controller = MundiApiClient.customers
    request = MundiApi::UpdateCustomerRequest.from_hash(self.attributes.slice('name', 'code'))

    begin
      result = customers_controller.update_customer(self.customer_id, request, nil)
    rescue => ex
      self.errors.add(:base, ex.message)
      raise ActiveRecord::Rollback
    end

    return result
  end
end
