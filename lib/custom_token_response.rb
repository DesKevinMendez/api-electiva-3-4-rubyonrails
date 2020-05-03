module CustomTokenResponse
    def body
        additional_data = {
          'user' => User.select('id','first_name', 'last_name', 'username', 'email').find_by_id(@token.resource_owner_id)
        }
        # call original `#body` method and merge its result with the additional data hash
        super.merge(additional_data)
    end
end