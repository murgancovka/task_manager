["admin", "manager", "auditor", "read_only", "read_noly_manager", "boss"].each do |role|
  Role.find_or_create_by_name(role)
end

User.create(email: 'test@estof.net', encrypted_password: '$2a$a10$zu44BkDpUDxRpWvxir9DxupuLZCMZ.wBMbxRRmwZ4uIi5qK0JUvry', sign_in_count: '0', current_sign_in_at: '2012-07-04 20:08:28', last_sign_in_at: '2012-07-04 20:08:28', current_sign_in_ip: '127.0.0.1', last_sign_in_ip: '127.0.0.1', created_at: '2012-07-04 20:08:28', updated_at: '2012-07-04 20:08:28')
RolesUser.create(role_id: '1', user_id: '1')