for j in 1..100
  i = Random.new.rand(100)

  desire = Desire.new(name: "desire #{i} name", description: "desire #{i} description")
  desire.bible_references.build(reference: "Bible reference #{i} reference", content: "Bible reference #{i} content")
  desire.bible_references.first.seeds.build
  desire.bible_references.first.seeds.first.targets.build(name: "target #{i} name", money_sown: i, money_to_sow: i, time_sown: "#{i} months #{i} weeks #{i} days #{i} hours #{i} minutes", time_to_sow: "#{i} months #{i} weeks #{i} days #{i} hours #{i} minutes")
  desire.bible_references.first.seeds.first.targets.first.sown_items.build(item: "sown item #{i}")
  desire.bible_references.first.seeds.first.targets.first.to_sow_items.build(item: "to sow item #{i}")
  desire.bible_references.first.harvests.build
  desire.bible_references.first.harvests.first.completed = i % 2 == 0
  desire.bible_references.first.harvests.first.time_to_completion = "#{i} months #{i} weeks #{i} days #{i} hours #{i} minutes" if desire.bible_references.first.harvests.first.completed
  desire.bible_references.first.harvests.first.sources.build(name: "sources #{i} name", money_received: i, time_received: "#{i} months #{i} weeks #{i} days #{i} hours #{i} minutes")
  desire.bible_references.first.harvests.first.sources.first.received_items.build(item: "received item #{i}")

  desire.save
end
