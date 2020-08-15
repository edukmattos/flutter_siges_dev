const String docClientAll = '''
  subscription getClients {
    clients (
      order_by: {
        name: asc
      }
    )
    {
      id
      name
      ein_ssa
      email
      created_at
      updated_at
      deleted_at
    }
  }
''';

const docClientSave = '''
  mutation (\$ein_ssa:String, \$name:String, \$email:String) {
    insert_clients(objects: {ein_ssa: \$ein_ssa, name: \$name, email: \$email}) {
     affected_rows
     returning {
        id
        ein_ssa
        name
        email
        created_at
        updated_at
        deleted_at
     }
    }
  }
''';

const docClientEinSsaUnique = '''
  query getClientEinSsaUnique (\$ein_ssa:String)
  { 
    clients (
      where: {
        _or: [
          { ein_ssa: {_eq: \$ein_ssa}},
          { deleted_at: {_eq: null}}
        ]
      }
    )
    {
      ein_ssa
      email
      deleted_at
    }
  }
''';

const docClientEmailUnique = '''
  query getClientEmailUnique (\$email:String)
  { 
    clients (
      where: {
        _and: [
          { email: {_eq: \$email}},
          { deleted_at: {_eq: null}}
        ]
      }
    )
    {
      ein_ssa
      email
      deleted_at
    }
  }
''';