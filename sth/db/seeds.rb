BibleReferenceDesire.destroy_all
BibleReferenceHarvest.destroy_all
BibleReferenceSeed.destroy_all
BibleReference.destroy_all
Desire.destroy_all
HarvestSource.destroy_all
Harvest.destroy_all
ReceivedItem.destroy_all
SeedTarget.destroy_all
Seed.destroy_all
Source.destroy_all
SownItem.destroy_all
Target.destroy_all
ToSowItem.destroy_all
User.destroy_all


User.create(username: 'user1', email: 'user1@user.com', password: 'password1')
User.create(username: 'user2', email: 'user2@user.com', password: 'password2')
User.create(username: 'user3', email: 'user3@user.com', password: 'password3')

User.all.each.with_index do |user, i|
  bible_reference = user.bible_references.build(
    reference: "reference #{i}",
    content: "content #{i}"
  )

  desire = user.desires.build(
    name: "desire #{i}",
    description: "description #{i}"
  )

  seed = user.seeds.build

  target = user.targets.build(
    name: "target #{i}",
    time_sown: "#{(Random.rand * 10).to_i} months, #{(Random.rand * 10).to_i} weeks, #{(Random.rand * 10).to_i} days, #{(Random.rand * 10).to_i} hours, #{(Random.rand * 10).to_i} minutes",
    money_sown: Random.rand * 100,
    time_to_sow: "#{(Random.rand * 10).to_i} months, #{(Random.rand * 10).to_i} weeks, #{(Random.rand * 10).to_i} days, #{(Random.rand * 10).to_i} hours, #{(Random.rand * 10).to_i} minutes",
    money_to_sow: Random.rand * 100
  )

  sown_items = []
  for j in 1..(Random.rand * 10).to_i
    item = user.sown_items.build(
      item: "sown item #{j}"
    )
    sown_items << item
  end

  to_sow_items = []
  for j in 1..(Random.rand * 10).to_i
    item = user.to_sow_items.build(
      item: "to sow item #{j}"
    )
    to_sow_items << item
  end

  harvest = user.harvests.build(
    completed: Random.rand >= 0.5
  )
  if harvest.completed
    harvest.time_to_completion = "#{(Random.rand * 10).to_i} months, #{(Random.rand * 10).to_i} weeks, #{(Random.rand * 10).to_i} days, #{(Random.rand * 10).to_i} hours, #{(Random.rand * 10).to_i} minutes"
  end

  source = user.sources.build(
    name: "source #{i}",
    time_received: "#{(Random.rand * 10).to_i} months, #{(Random.rand * 10).to_i} weeks, #{(Random.rand * 10).to_i} days, #{(Random.rand * 10).to_i} hours, #{(Random.rand * 10).to_i} minutes",
    money_received: Random.rand * 100
  )

  received_items = []
  for j in 1..(Random.rand * 10).to_i
    item = user.received_items.build(
      item: "received item #{j}"
    )
    received_items << item
  end

  bible_reference.desires << desire

  target.sown_items = sown_items
  target.to_sow_items = to_sow_items
  seed.targets << target
  bible_reference.seeds << seed

  source.received_items = received_items
  harvest.sources << source
  bible_reference.harvests << harvest

  user.save
end