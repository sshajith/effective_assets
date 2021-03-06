# With simple_form or formtastic, just use
#
# = f.input :pictures, :as => :asset_box
# = f.input :fav_icon, :as => :asset_box, :limit => 4, :file_types => [:jpg, :gif, :png]
# = f.input :logo, :as => :asset_box, :uploader => false, :dialog => true
# = f.input :logo, :as => :asset_box, :uploader => true, :uploader_visible => true

if defined?(SimpleForm)
  class AssetBoxSimpleFormInput < SimpleForm::Inputs::Base
    include AssetBox

    def input # SimpleForm calls .input
      to_html
    end

    # Redefines some of the Formtastic specific methods so this will work with simple_form with no other changes.
    def method ; attribute_name ; end
    def input_wrapping(&block) ; yield ; end
    def label_html ; '' ; end
  end
end
