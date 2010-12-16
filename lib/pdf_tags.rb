# -*- coding: utf-8 -*-
module PdfTags
  include Radiant::Taggable
  
  desc %{
    Renders a form for printing pages to PDF.
    
    *Usage:*
    <pre><code><r:pdf cssfile="filename"/></code></pre>
  }
  tag 'pdf' do |tag|
    %{
      <form action="/pages/#{tag.locals.page.id}/pdf" method="post">
        <div id="pdf_form">
          <input type="hidden" id="cssfile" name="cssfile" value="#{tag.attr['cssfile']}"/>
          <input src="/system/themes/1/homo/images/pdf.png" class="pdf_image" id="pdf_submit" type="image" rel="tipsy" title="PDF erzeugen" />
        </div>
      </form>
    }
  end
                                                                  
end
                                                                  