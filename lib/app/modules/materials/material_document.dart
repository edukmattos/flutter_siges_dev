const String docMaterialAll = '''
  subscription getMaterials {
    materials (
      order_by: {
        description: asc
      }
    )
    {
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

const String docMaterialUnitsMeasureAll = '''
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

const docMaterialSave = '''
  mutation (\$code:String, \$description:String, \$material_unit_id:uuid) {
    insert_materials(objects: {code: \$code, description: \$description, material_unit_id: \$material_unit_id}) {
     affected_rows
     returning {
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
  }
''';