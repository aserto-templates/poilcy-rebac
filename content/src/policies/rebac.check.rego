package rebac.check

# default to a closed system (deny by default)
default allowed = false

# resource context is expected in the following form:
# {
#   "relation": "relation or permission name",
#   "object_type": "object type that carries the relation or permission",
#   "object_id": "id of object instance with type of object_type"
# }
allowed {
  ds.check_relation({
    "object": {
      "key": input.resource.object_id,
      "type": input.resource.object_type
    },
    "relation": {
      "name": input.resource.relation,
      "object_type": input.resource.object_type
    },
    "subject": {
      "key": input.user.key,
      "type": "user"
    }
  })
}
