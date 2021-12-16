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
EChronicler.Repo.insert!(%EChronicler.EChronicler.Journal_Entry{title: "Awesome Blog Post", author: "Grace", entry: "Time is an illustion, teatime doubly so."})
EChronicler.Repo.insert!(%EChronicler.EChronicler.Journal_Entry{title: "Cool Blog Post", author: "Grace", entry: "For instance, on the planet Earth, man had always assumed that he was more intelligent than dolphins because he had achieved so much — the wheel, New York, wars and so on — whilst all the dolphins had ever done was muck about in the water having a good time. But conversely, the dolphins had always believed that they were far more intelligent than man — for precisely the same reasons."})
EChronicler.Repo.insert!(%EChronicler.EChronicler.Journal_Entry{title: "So-So Blog Post", author: "Grace", entry: "Don't panic."})
