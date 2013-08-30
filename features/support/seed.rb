Before do
  if !$u_dun_it 
    user = FactoryGirl.create(:valid_user)
    $u_dun_it = true
  end
end