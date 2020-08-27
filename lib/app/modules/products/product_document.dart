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
      title
      description
      
      image
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
