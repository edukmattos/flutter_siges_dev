const String docMaterialAll = '''
  subscription getMaterials {
    materials {
      id
      code
      description
      material_unit_id
      material_unit {
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

const String docUnitsMeasureAll = '''
  query {
    units_measure (
      order_by: {
        code: asc
      }
    )
    {
      id
      code
      description
      created_at
      update_at
      deleted_at
    }
  }
''';