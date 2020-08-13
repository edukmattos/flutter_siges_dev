const docClientSave = '''
  mutation (\$ein_ssa:String, \$name:String, \$email:String) {
    insert_clients(objects: {ein_ssa: \$einSsa, name: \$name, email: \$email}) {
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