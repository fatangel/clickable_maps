# -*- coding: utf-8 -*-
module PdfTags
  include Radiant::Taggable
  
  desc "
    Renders a form for printing pages to PDF.
  
    *Usage:*
    <pre><code><r:pdf /></code></pre>"
  tag 'pdf' do |tag|
    %{
      <form action="/pages/#{tag.locals.page.id}/pdf" method="post">
        <div id="pdf_form">
          <input class="submit" id="pdf_submit" type="submit" value="PDF erzeugen" />
        </div>
      </form>
    }
  end
                                                                  
end
                                                                  