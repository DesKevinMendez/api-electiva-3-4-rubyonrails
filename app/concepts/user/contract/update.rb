module User::Contract
  class Update < Reform::Form
    property :name
    property :email
    property :username

    validation do
      params do
        required(:name).filled
        required(:email).filled
        required(:username).filled
      end
    end
  end
end

