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