require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  setup do
    @actor = actors(:one)
  end

  test "actor fixture is valid" do 
    @actor.image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'batman.png')), filename: 'batman.png', content_type: 'image/png')
    
    assert @actor.valid?
  end

  test "should have image attached" do
    @actor.image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'batman.png')), filename: 'batman.png', content_type: 'image/png')
    assert @actor.valid?
    assert @actor.image.attached?
  end
end
