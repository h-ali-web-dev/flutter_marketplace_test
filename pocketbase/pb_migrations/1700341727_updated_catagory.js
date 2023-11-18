/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("t8rkhxo30gyuml9")

  collection.name = "category"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("t8rkhxo30gyuml9")

  collection.name = "catagory"

  return dao.saveCollection(collection)
})
