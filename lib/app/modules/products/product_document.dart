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
