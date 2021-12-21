# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EChronicler.Repo.insert!(%EChronicler.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
EChronicler.Repo.insert!(%EChronicler.EChronicler.JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Time is an illustion, teatime doubly so."})
EChronicler.Repo.insert!(%EChronicler.EChronicler.JournalEntry{title: "Cool Blog Post", author: "Grace", entry: "Test."})
EChronicler.Repo.insert!(%EChronicler.EChronicler.JournalEntry{title: "So-So Blog Post", author: "Grace", entry: "Don't panic."})
EChronicler.Repo.insert!(%EChronicler.EChronicler.JournalEntry{title: "Regular Blog Title", author: "Normal Name", entry: "Words."})
