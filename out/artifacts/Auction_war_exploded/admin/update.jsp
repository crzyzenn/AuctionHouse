<%@page import="org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry"%>
<%@page import="org.apache.tomcat.jni.Directory"%>
<%@page import="com.matisse.MtDatabase"%>
<%@ page import = "java.lang.String,java.io.File,java.sql.*, javax.servlet.*,Help.Connect,Help.Functions,org.apache.tomcat.util.http.fileupload.servlet.*,java.util.*,org.apache.tomcat.util.http.fileupload.*,org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>

<%
    Connect con = new Connect();
    Statement stm = con.getStatement();

    // Get working directory
    String filePath = "C:\\Users\\Cryzenn\\ideawspace\\Auction\\web\\Images";
    //out.println(filePath);
    Map<String, String> formValues = new HashMap<String, String>();


    ServletContext context = pageContext.getServletContext();
    String thePath = context.getInitParameter("file-upload");
    out.println(thePath);

    File file;
    String imageFile = "";
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = upload.parseRequest(new ServletRequestContext(request));
            Iterator iterator = items.iterator();
            while (iterator.hasNext()) {
                FileItem item = (FileItem) iterator.next();

                if (item.isFormField()) //your code for getting form fields
                {
                    String name = item.getFieldName();
                    String value = item.getString();
                    formValues.put(name, value);
                }

                if (!item.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = item.getFieldName();
                    String fileName = item.getName();
                    //                out.println(fileName);
                    boolean isInMemory = item.isInMemory();
                    long sizeInBytes = item.getSize();
                    //String filePath = getServletContext().getRealPath("/") + "admin\\Images";
                    //out.println(filePath);


                    // Name of the image file
                    imageFile = fileName.substring(fileName.lastIndexOf("\\") + 1);
                    //	         	out.println(fileName);


                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath +
                                fileName.substring(fileName.lastIndexOf("\\")));
                        //	               out.println(filePath + fileName.substring( fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath + "\\" +
                                fileName.substring(fileName.lastIndexOf("\\") + 1));
                        //	               out.println(filePath + "\\" +fileName.substring( fileName.lastIndexOf("\\")+1));
                    }
                    //out.println(filePath);
                    // Upload the file
//                    item.write(file);
                        out.println(file);
                    // Display from values

                    //                PreparedStatement stm = conn.prepareStatement("INSERT INTO imagetest values (?)");
                    //                stm.setObject(1, file);
                    //                stm.execute();
                    //                conn.close();
                }
            }


            String query = "UPDATE all_auction_items SET piece_title = '"+ formValues.get("piece_title") + "', production_date = '" + formValues.get("date") + "', category =  '" + formValues.get("category") + "', medium = '" + formValues.get("medium") + "', frame = '" + formValues.get("frame") + "', dimensions =  '" + formValues.get("dimensions") + "', description = '" + formValues.get("description") + "', price = '" + formValues.get("price") + "', item_image = '" + imageFile + "', weight = '" + formValues.get("weight") + "' WHERE item_lot_number = " + formValues.get("item_lot_number");
            out.println(query);
            stm.executeQuery(query);
            con.closeConnection();
            response.sendRedirect("pendinglot.jsp?updated");
        } catch (Exception e) {
            con.closeConnection();
            out.println(e.getMessage());
            response.sendRedirect("pendinglot.jsp?updated");
        }
    } else {
        con.closeConnection();
        out.println("Fill the form again!");
    }

%>
