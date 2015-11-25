class AddStates < ActiveRecord::Migration
  def change
    State.create name: 'created'
    State.create name: 'updated'
    State.create name: 'removed'
  end
end
