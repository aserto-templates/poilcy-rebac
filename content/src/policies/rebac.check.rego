# currently this calls ds.check_relation. It will be updated to call the new ds.check built-in once it is available in prod. 
package rebac.check

# default to a closed system (deny by default)
default allowed = false

# resource context is expected in the following form:
# {
#   "relation": "relation name",
#   "object_type": "object type that carries the relation",
#   "object_key": "key of object instance with type of object_type"
# }
allowed {
  ds.check_relation({
    "object": {
      "key": input.resource.object_key,
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
