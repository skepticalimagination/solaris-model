# Selectively expose class members through an auto-generated wrapper.
export default publicize = (PrivateClass, params) ->
  PrivateClass.privateInstances = new WeakMap
  PrivateClass.publicInstances = new WeakMap

  class PublicClass
    constructor: (args...) ->
      privateInstance = new PrivateClass(args...)

      PrivateClass.publicInstances.set(privateInstance, this)
      PrivateClass.privateInstances.set(this, privateInstance)

  if params?.properties?
    for property in params.properties
      do (property) ->
        Object.defineProperty PublicClass.prototype, property,
          get: -> PrivateClass.privateInstances.get(this)[property]
          set: (v) -> PrivateClass.privateInstances.get(this)[property] = v

  if params?.methods?
    for method in params.methods
      do (method) ->
        PublicClass::[method] = (args...) ->
          PrivateClass.privateInstances.get(this)[method](args...)

  if params?.static?.methods?
    for method in params.static.methods
      do (method) ->
        PublicClass[method] = (args...) ->
          PrivateClass[method](args...)

  if params?.expose or publicize.expose or process?.env.PUBLICIZER_EXPOSE
    PublicClass.PrivateClass = PrivateClass
    Object.defineProperty PublicClass.prototype, 'privateInstance',
      get: -> PrivateClass.privateInstances.get(this)

  PublicClass
