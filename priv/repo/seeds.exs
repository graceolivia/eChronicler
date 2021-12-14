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
EChronicler.Repo.insert!(%EChronicler.EChronicler.Journal_Entry{title: "Awesome Blog Post", author: "Grace", entry: "Test."})
