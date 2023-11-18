/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("t8rkhxo30gyuml9")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mrzk24ip",
    "name": "field",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "t8rkhxo30gyuml9",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("t8rkhxo30gyuml9")

  // remove
  collection.schema.removeField("mrzk24ip")

  return dao.saveCollection(collection)
})
