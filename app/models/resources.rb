module Resources
  def column_names
    self.attribute_names.reject {|name| ["id", "created_at", "updated_at"].include?(name)}
  end
end
