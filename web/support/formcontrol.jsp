<%@page import="org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry"%>
<%@page import="org.apache.tomcat.jni.Directory"%>
<%@page import="com.matisse.MtDatabase"%>
<%@ page import = "java.lang.String,java.io.File,java.sql.*, javax.servlet.*,Help.Connect,Help.Functions,org.apache.tomcat.util.http.fileupload.servlet.*,java.util.*,org.apache.tomcat.util.http.fileupload.*,org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>

<%
    if(request.getParameter("approve") != null) {

        Connect con = new Connect();
        Statement stm = con.getStatement();


        try {
            String query = "UPDATE client_requests SET evaluation_date = '" + request.getParameter("approval_date") + "', declined = 'no' WHERE piece_name = '" + request.getParameter("old_name") + "'";
            out.println(query);
            stm.executeQuery(query);
            response.sendRedirect("sales_request.jsp?done");
            con.closeConnection();
        } catch (Exception e) {
            out.println(e.getMessage());
            response.sendRedirect("sales_request.jsp?done");
            con.closeConnection();
        }
    }
    else{
        Connect con = new Connect();
        Statement stm = con.getStatement();

        // Get working directory
        String filePath = "C:\\Users\\Cryzenn\\ideawspace\\Auction\\web\\Images";
        //out.println(filePath);
        Map<String, String> formValues = new HashMap<String, String>();


        ServletContext context = pageContext.getServletContext();
        String thePath = context.getInitParameter("file-upload");
//        out.println(thePath);


        File file;
        String[] imageFile = new String[2];
//        String imageFile = "";
        int i = 0;
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
                        boolean isInMemory = item.isInMemory();
                        long sizeInBytes = item.getSize();


                        // Name of the image file
                        imageFile[i++] = fileName.substring(fileName.lastIndexOf("\\") + 1);


                        // Write the file
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(filePath +
                                    fileName.substring(fileName.lastIndexOf("\\")));
                        } else {
                            file = new File(filePath + "\\" +
                                    fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        // Upload the file
                        item.write(file);
                    }

                }


                //	   // Get item lot number
//                Functions ln = new Functions();
//                int item_lot_number = ln.generateKey();

                String query = "INSERT INTO all_auction_items VALUES ('" + formValues.get("pNumber") + "','" + formValues.get("piece_title") + "', '" + formValues.get("date") + "', '" + formValues.get("artist") + "', '" + formValues.get("category") + "', '" + formValues.get("description") + "', '" + formValues.get("medium") + "', '" + formValues.get("frame") + "', '" + formValues.get("dimensions") + "', '" + formValues.get("price") + "',  '" + imageFile[0] + "', '" + imageFile[1] + "' ,'" + formValues.get("weight") + "')";
                        out.println(query);
                stm.executeQuery(query);

//                for(Map.Entry a : formValues.entrySet()){
//                    out.println(a.getKey() + " = " + a.getValue() + "<br>");
//                }

                con.closeConnection();
//                response.sendRedirect("addItem.jsp?added");
            } catch (Exception e) {
                con.closeConnection();
                out.println(e.getMessage());
//                response.sendRedirect("addItem.jsp?added");
            }
        } else {
            out.println("Fill the form again!");
        }
    }
%>