module Resources
  def index_tag
    "index-name #{self.class.name.downcase}_#{id}"
  end
end
