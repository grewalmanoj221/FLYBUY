package com.servlet;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entity.Category;
import com.entity.Product;
import com.connection.HibernateUtil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {
	 private static String getFilename(Part part) {
		    for (String cd : part.getHeader("content-disposition").split(";")) {
		      if (cd.trim().startsWith("filename")) {
		        String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
		        return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
		      }
		    }
		    return null;
		  }

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

//            servlet 2:
//            add category 
//            add product
			String op = request.getParameter("operation");

			if (op.trim().equals("addcategory")) {
				// add category
				// fetching category data
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");

				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);

				// category databse save:
				CategoryDao categoryDao = new CategoryDao(HibernateUtil.getSessionFactory());
				int catId = categoryDao.saveCategory(category);
//                out.println("Category Saved");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category added successfully : " + catId);
				response.sendRedirect("admin.jsp");
				return;

			} // if
			else if (op.trim().equals("addproduct")) {
				// add product
				// work
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");
				String filename = getFilename(part);				
				pName=pName.toUpperCase();

				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(filename);

				// get category by id
				CategoryDao cdoa = new CategoryDao(HibernateUtil.getSessionFactory());
				Category category = cdoa.getCategoryById(catId);

				p.setCategory(category);

				// product save...
				ProductDao pdao = new ProductDao(HibernateUtil.getSessionFactory());
				pdao.saveProduct(p);

				// pic upload
//                find out the path to upload photo

				@SuppressWarnings("deprecation")
				String path = request.getRealPath("img") + File.separator + "products" + File.separator
						+ filename;
				System.out.println(path);

				// uploading code..
				try {

					FileOutputStream fos = new FileOutputStream(path);

					InputStream is = part.getInputStream();

//                reading data
					byte[] data = new byte[is.available()];

					is.read(data);

//                writing the data
					fos.write(data);

					fos.close();

				} catch (Exception e) {
					e.printStackTrace();
				} // catch

				out.println("Product save sucess...");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product is added successfully..");
				response.sendRedirect("admin.jsp");
				return;

			} // add product
			else if (op.trim().equals("deleteproduct")) {
				ProductDao pdao = new ProductDao(HibernateUtil.getSessionFactory());
				int pid = Integer.parseInt(request.getParameter("pid"));

				if (pdao.deleteProduct(pid)) {
					out.println("Product deleted sucessfully...");
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Product deleted sucessfully...");
					response.sendRedirect("admin.jsp");
					return;
				} // if
				else {
					out.println("Unable to delete Product...");
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Unable to delete Product...");
					response.sendRedirect("admin.jsp");
				} // else

			} // delete product
			else if (op.trim().equals("updateproduct")) {

				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int pid = Integer.parseInt(request.getParameter("pid"));
				ProductDao dao = new ProductDao(HibernateUtil.getSessionFactory());
				Product p = dao.getProduct(pid);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);

				// get category by id
				CategoryDao cdoa = new CategoryDao(HibernateUtil.getSessionFactory());
				Category category = cdoa.getCategoryById(p.getCategory().getCategoryId());

				p.setCategory(category);

				// product update...
				ProductDao pdao = new ProductDao(HibernateUtil.getSessionFactory());
				pdao.saveProduct(p);

				

				out.println("Product updated sucessfully...");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product is updated successfully..");
				response.sendRedirect("admin.jsp");
				return;

			} // update product

		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
