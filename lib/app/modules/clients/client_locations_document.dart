const String docClientIdLocationsAll = '''
  subscription getClientLocations {
    client_locations {
      client_id
      id
      description
      image_path
      lat
      lng
    }
  }
''';
