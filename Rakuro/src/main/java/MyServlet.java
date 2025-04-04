
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.MyObject;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/api/*")  // Matches all requests under /api
public class MyServlet extends HttpServlet {

    //converts strings to objects and objects to strings
    //ajax automatically knows the type
    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        String path = request.getPathInfo(); // Get endpoint path after /api/

        String param = request.getParameter("param2");

        if ("/hello".equals(path)) {
            // Sending an object
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            MyObject responseObject = new MyObject();
            responseObject.myProp = 42;
            responseObject.myName = param;
            out.write(objectMapper.writeValueAsString(responseObject));
        } else {
            // sending a string
            response.setContentType("text/plain");
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            out.println("404 - Not Found");
        }

        out.close();
    }
}
