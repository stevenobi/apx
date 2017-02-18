/***

In Apex you can make a page that is completely generated from a procedure of your making:

1. Create a blank page.
2. Under Processes, click Create, and choose PL/SQL.
3. Give it a name, and leave the default option "On Load - Before Header".
4. For PL/SQL Page Process, enter the following:

on the page you want to provide the download link:

1. Create a static content region and set the source to something like
<a href="f?p=110:7:&SESSION.:MyList123::::YES">Download</a>

***/

-- Word HTML Doc Name will be $REQUEST.doc
begin OWA_UTIL.MIME_HEADER ('Content-Type:application/vnd.ms-word;charset=utf-8', false); -- 	application/msword
      htp.print('Content-Disposition:attachment;filename="'||v('REQUEST')||'.doc"');
      OWA_UTIL.HTTP_HEADER_CLOSE;
      htp.p('<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">');
      htp.p('<head><meta name=ProgId content=Word.Document></head>');
      htp.p('<body>');
        for x in (select app_user_id, app_username, app_user_first_name, app_user_last_name from apx$app_user) loop
          htp.p('<table><tr><td>'||x.app_user_id ||'</td><td>'||x.app_username ||'</td></tr></table><br>');
          htp.p('<p>&nbsp.</p>');
        end loop;
      htp.p('</body></html>');
      htmldb_application.g_unrecoverable_error := true;
end;

-- DOCX Format
begin OWA_UTIL.MIME_HEADER ('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document;charset=utf-8', false); -- 	application/msword
      htp.print('Content-Disposition:attachment;filename="'||v('REQUEST')||'.docx"');
      OWA_UTIL.HTTP_HEADER_CLOSE;
      htp.p('<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">');
      htp.p('<head><title>'||v('REQUEST')||'</title>');
      htp.p('<meta name="ProgId" content="Word.Document">');
      --The setting specifies document's view after it is downloaded as Print
      --instead of the default Web Layout
      htp.p('<!--[if gte mso 9]>');
      htp.p('<xml>');
      htp.p('<w:WordDocument>');
      htp.p('<w:View>Print</w:View>');
      htp.p('<w:Zoom>90</w:Zoom>');
      htp.p('<w:DoNotOptimizeForBrowser/>');
      htp.p('</w:WordDocument>');
      htp.p('</xml>');
      htp.p('<![endif]-->');
      htp.p('<style><!--');
      htp.p('   /* Style Definitions */');
      htp.p('@page Section1');
      htp.p(' { size: 21cm 29.7cm;  /* A4 */');
      htp.p('   margin: 2cm 2cm 2cm 2cm; /* Margins: 2 cm on each side */');
      htp.p('   mso-page-orientation: portrait;');
      htp.p('   mso-header-margin:.5em; ');
      htp.p('   mso-footer-margin:.5em; mso-paper-source:0;');
      htp.p(' }');
      htp.p('   div.Section1');
      htp.p('   {page:Section1;}');
      htp.p('--></style>');
      htp.p('</head>');
      htp.p('<body lang=EN-US style="tab-interval:.5in">');
      htp.p('<div class="Section1">');
      htp.p('<h1>Time and tide wait for none</h1>');
      htp.p('<p style="color:red"><I>DateTime.Now</I></p>');
      htp.p('<p class="report"');
      htp.p('<table class="rtab">');
      for x in (select app_user_id, app_username, app_user_first_name, app_user_last_name from apx$app_user) loop
        htp.p('<tr>');
        htp.p('  <td class="rod">'||x.app_user_id ||'</td><td class="rod">'||x.app_username ||'</td>');
        htp.p('</tr>');
      end loop;
      htp.p('</table></p></div></body></html>');
      htmldb_application.g_unrecoverable_error := true;
end;
