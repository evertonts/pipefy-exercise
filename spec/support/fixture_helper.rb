module FixtureHelper
  def load_fixture_file(path)
    full_path = Rails.root.join('spec/fixtures', path)
    File.read(full_path)
  end

  def load_fixture_json(path)
    JSON.parse(load_fixture_file(path), symbolize_names: true)
  end
end
