# Configuration parameters and credentials
basic_auth_user_name = ENV['MUNDIPAGG_INTEGRATION_SDK_USER_NAME'] # The username to use with basic authentication
basic_auth_password = ENV['MUNDIPAGG_INTEGRATION_SDK_PASSWORD'] # The password to use with basic authentication

MundiApiClient = MundiApi::MundiApiClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)