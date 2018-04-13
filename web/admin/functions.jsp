<%@page import="org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry"%>
<%@page import="org.apache.tomcat.jni.Directory"%>
<%@page import="com.matisse.MtDatabase"%>
<%@ page import = "java.lang.String,java.io.File,java.sql.*, javax.servlet.*,Help.Connect,Help.Functions,org.apache.tomcat.util.http.fileupload.servlet.*,java.util.*,org.apache.tomcat.util.http.fileupload.*,org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>

<%
// Create a new database class

//    Class.forName("com.matisse.sql.MtDriver");
//    Connection conn = DriverManager.getConnection("jdbc:mt://localhost/Auction");


//    Delete an auction item
    if(request.getParameter("token") != null){
        Connect con = new Connect();
        Statement stm = con.getStatement();
        try{
            stm.executeQuery("DELETE FROM auction_items WHERE item_lot_number = " + request.getParameter("token"));
            response.sendRedirect("addItem.jsp?deleted=" + request.getParameter("token"));
            con.closeConnection();
        }
        catch (Exception e1){
            response.sendRedirect("addItem.jsp?deleted=" + request.getParameter("token"));
//            response.sendRedirect("addItem.jsp?error=" + request.getParameter("token"));
            con.closeConnection();
        }

    }

//    Delete an auction
    else if(request.getParameter("deleteAuction") != null){
        Connect con = new Connect();
        Statement stm = con.getStatement();
        try{
            stm.executeQuery("DELETE FROM auction WHERE auction_id = " + request.getParameter("id"));
            response.sendRedirect("auction.jsp?deleted=" + request.getParameter("id"));
            con.closeConnection();
        }
        catch (Exception e1){
            response.sendRedirect("auction.jsp?deleted=" + request.getParameter("id"));
//            out.println(e1.getMessage());
            con.closeConnection();
        }

    }



    else if(request.getParameter("logout") != null){
        session.invalidate();
        response.sendRedirect("index.jsp");
    }

    // Adding a new auction
    else if(request.getParameter("addAuction") != null){
        Connect con = new Connect();
        Statement stm = con.getStatement();
        String auctionName = request.getParameter("name");
        String auctionDate= request.getParameter("date");
        String time= request.getParameter("time");
        String theme= request.getParameter("theme");
        String venue= request.getParameter("venue");
        Functions key = new Functions();
        int idx = key.generateAuctionKey();
        try{
            String query = "INSERT INTO auction VALUES (" + idx + ", '"+auctionName+"', '"+theme +"', '" + auctionDate + "', '" +venue + "', '" + time +"')";
//            out.println(query);
            stm.executeQuery(query);
            response.sendRedirect("auction.jsp?added=" + idx);
            con.closeConnection();
        }
        catch (Exception e1){
            response.sendRedirect("auction.jsp?added=" + idx);
//            response.sendRedirect("addItem.jsp?error=" + request.getParameter("token"));
            con.closeConnection();
        }
    }

    // Updation the auction
    else if(request.getParameter("updateAuction") != null){
        Connect con = new Connect();
        Statement stm = con.getStatement();
        String auctionName = request.getParameter("name");
        String auctionDate= request.getParameter("date");
        String time= request.getParameter("time");
        String theme= request.getParameter("theme");
        String venue= request.getParameter("venue");
        int id = Integer.parseInt(request.getParameter("id"));
//        Functions key = new Functions();
//        int idx = key.generateAuctionKey();
        try{
            String query = "UPDATE auction SET auction_name = '"+auctionName+"', auction_theme =  '"+theme +"', auction_date = '" + auctionDate + "', venue = '" +venue + "', time = '" + time +"' WHERE auction_id = " + id;
            out.println(query);
            stm.executeQuery(query);
            response.sendRedirect("auction.jsp?updated");
            con.closeConnection();
        }
        catch (Exception e1){
            response.sendRedirect("auction.jsp?updated");
//            response.sendRedirect("addItem.jsp?error=" + request.getParameter("token"));
            con.closeConnection();
        }
    }
    else if(request.getParameter("publishItem") != null){
        Connect con = new Connect();
        Statement stm = con.getStatement();
        int auction_id = Integer.parseInt(request.getParameter("auction"));
        int id = Integer.parseInt(request.getParameter("id"));
//        Functions key = new Functions();
//        int idx = key.generateAuctionKey();
        try{
            String query = "UPDATE all_auction_items SET auction_id = "+auction_id+" WHERE item_lot_number = " + id;
            out.println(query);
            stm.executeQuery(query);
            response.sendRedirect("pendinglot.jsp?published");
            con.closeConnection();
        }
        catch (Exception e1){
            response.sendRedirect("pendinglot.jsp?published");
//            response.sendRedirect("addItem.jsp?error=" + request.getParameter("token"));
            out.println(e1.getMessage());
            con.closeConnection();
        }
    }


    else {
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
                        item.write(file);
                        //	            out.println(file);
                        // Display from values

                        //                PreparedStatement stm = conn.prepareStatement("INSERT INTO imagetest values (?)");
                        //                stm.setObject(1, file);
                        //                stm.execute();
                        //                conn.close();
                    }
                }


                //	   // Get item lot number
                Functions ln = new Functions();
                int item_lot_number = ln.generateKey();

                String query = "INSERT INTO auction_items VALUES (" + item_lot_number + ",'" + formValues.get("name") + "', '" + formValues.get("date") + "', '" + formValues.get("category") + "', '" + formValues.get("medium") + "', '" + formValues.get("frame") + "', '" + formValues.get("dimensions") + "', '" + formValues.get("description") + "', '" + formValues.get("price") + "', '" + imageFile + "', '" + formValues.get("weight") + "')";
                //        out.println(query);
                stm.executeQuery(query);
                con.closeConnection();
                response.sendRedirect("addItem.jsp?added");
            } catch (Exception e) {
                con.closeConnection();
                out.println(e.getMessage());
                response.sendRedirect("addItem.jsp?added");
            }
        } else {
            con.closeConnection();
            out.println("Fill the form again!");
        }

    }
%>