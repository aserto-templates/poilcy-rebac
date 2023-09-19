package rebac.check_permission

# resource context is expected in the following form:
# {
#   "permission": "permission name",
#   "object_type": "object type that carries the permission",
#   "object_key": "key of object instance with type of object_type"
# }
allowed {
  ds.check_permission({
    "object": {
      "key": input.resource.object_key,
      "type": input.resource.object_type
    },
    "permission": {
      "name": input.resource.permission
    },
    "subject": {
      "key": user.key,
      "type": "user"
    }
  })
}
