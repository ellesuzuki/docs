class SiteIndex < Erector::Widget
  @@here = File.expand_path(File.dirname(__FILE__))
  @@project_root = File.dirname(@@here)
  @@sites_dir = File.expand_path("sites", @@project_root)

  def sites
    return @sites if @sites
    all_sites = Dir.glob("#{@@sites_dir}/**").map { |filename| File.basename(filename) }.sort
    @sites = all_sites - ['es']
  end

  def site_link site
    path = "/#{site}/"
    li do
      a(site, :href => path)
    end
  end

  def content
    div id: "site_index", class: "toc" do
      h1 "Site List"
      ul do
        sites.each do |site|
          site_link site
        end
      end
    end
  end
end
