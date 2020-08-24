const String docProductAll = '''
  subscription getProducts {
    products (
      order_by: {
        description: asc
      }
    )
    {
      id
      code
      description
      product_type_id
      product_type {
        id
        code
        description
      }
      created_at
      updated_at
      deleted_at
    }
  }
''';

const docClientEinSsaUnique = '''
  query qryClientEinSsaUnique (\$ein_ssa: String) { 
    clients(
      where: {
        _and: [
          { ein_ssa: {_eq: \$ein_ssa}},
          { deleted_at: {_eq: null}}
        ]
      }
    ) {
      name
      ein_ssa
      email
      deleted_at
    }
  }
''';

const docClientEmailUnique = '''
  query qryClientEmailUnique (\$email:String)
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
      name
      ein_ssa
      email
      deleted_at
    }
  }
''';

const docProductById = '''
  query qryProductById (\$id:String)
  { 
    prducts (
      where: {
        _and: [
          { id: {_eq: \$id}},
          { deleted_at: {_eq: null}}
        ]
      }
    )
    {
      id
      code
      description
      title
      image
      color
      price
      size
      product_type_id
      product_type {
        id
        code
        description
      }
      created_at
      updated_at
      deleted_at
    }
  }
''';
