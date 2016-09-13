require 'spec_helper'

describe JsonTableSchema::Schema do

  it 'should validate a simple schema' do
    schema = load_schema('schema_valid_simple.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should validate a full schema' do
    schema = load_schema('schema_valid_full.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should validate a schema with a primary key as a string' do
    schema = load_schema('schema_valid_pk_string.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should validate a schema with a primary key as an array' do
    schema = load_schema('schema_valid_pk_array.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should return false for an empty schema' do
    schema = load_schema('schema_invalid_empty.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false for a wrong type' do
    schema = load_schema('schema_invalid_wrong_type.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false when primary key string value is wrong' do
    schema = load_schema('schema_invalid_pk_string.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false when primary key array value is wrong' do
    schema = load_schema('schema_invalid_pk_array.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return true with a valid foreign key string' do
    schema = load_schema('schema_valid_fk_string.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should return true with a valid foreign key self reference' do
    schema = load_schema('schema_valid_fk_string_self_referencing.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should return true with a valid foreign key array' do
    schema = load_schema('schema_valid_fk_array.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(true)
  end

  it 'should return false with an invalid foreign key string' do
    schema = load_schema('schema_invalid_fk_string.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false with a foreign key with no reference' do
    schema = load_schema('schema_invalid_fk_no_reference.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false with an invalid foreign key array' do
    schema = load_schema('schema_invalid_fk_array.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false where foreign key reference is an array and fields are a string' do
    schema = load_schema('schema_invalid_fk_string_array_ref.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false where foreign key reference is an string and fields are an array' do
    schema = load_schema('schema_invalid_fk_string_array_ref.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false where there is a foreign key reference and field count mismatch' do
    schema = load_schema('schema_invalid_fk_array_wrong_number.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end

  it 'should return false when the primary key is not a valid type' do
    schema = load_schema('schema_invalid_pk_is_wrong_type.json')
    schema = JsonTableSchema::Schema.new(schema)
    expect(schema.valid?).to eq(false)
  end


  #
  # def test_primary_key_is_not_a_valid_type(self):
  #   filepath = os.path.join(self.data_dir,
  #                           'schema_invalid_pk_is_wrong_type.json')
  #   with io.open(filepath) as stream:
  #       schema = json.load(stream)
  #       errors = [i for i in jsontableschema.validator.iter_errors(schema)]
  #   self.assertEquals(2, len(errors))
  #
  #
  #
  # class TestValidator(base.BaseTestCase):
  # def test_schema_multiple_errors(self):
  #   filepath = os.path.join(self.data_dir,
  #                           'schema_invalid_multiple_errors.json')
  #   with io.open(filepath) as stream:
  #       schema = json.load(stream)
  #       errors = [i for i in jsontableschema.validator.iter_errors(schema)]
  #   self.assertEquals(5, len(errors))
  #
  # def test_schema_no_fields(self):
  #   filepath = os.path.join(self.data_dir,
  #                           'schema_invalid_pk_no_fields.json')
  #   with io.open(filepath) as stream:
  #       schema = json.load(stream)
  #       errors = [i for i in jsontableschema.validator.iter_errors(schema)]
  #   self.assertEquals(3, len(errors))

end
