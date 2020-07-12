const String docUnitsMeasureAll = '''
  subscription {
    units_measure {
      id
      code
      description
      created_at
      update_at
      deleted_at
    }
  }
''';

const docUnitsMeasureSave = '''
  mutation (\$code:String, \$description:String) {
    insert_units_measure(objects: {code: \$code, description: \$description}) {
     affected_rows
     returning {
       id
       code
       description
     }
    }
  }
''';