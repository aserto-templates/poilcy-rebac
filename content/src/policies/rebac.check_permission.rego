package rebac.check_permission

# default to a closed system (deny by default)
default allowed = false

# resource context is expected in the following form:
# {
#   "permission": "permission name",
#   "object_type": "object type that carries the permission",
#   "object_id": "id of object instance with type of object_type"
# }
allowed {
  ds.check_permission({
    "object_type": input.resource.object_type,
    "object_id": input.resource.object_id,
    "permission": input.resource.permission,
    "subject_type": "user",
    "subject_id": input.user.id
  })
}
