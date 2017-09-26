package tfd.system.unit.userinfo.act;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tfd.system.unit.account.data.Account;
import tfd.system.unit.userinfo.logic.UserInfoExportLogic;

import com.component.datamodel.Record;
import com.component.office.util.ExcelUtil;
import com.system.db.DbPoolConnection;
import com.system.tool.HttpUtil;
import com.system.tool.SysTool;

public class UserInfoExportAct {
	private UserInfoExportLogic logic=new UserInfoExportLogic();
	
	public String dataExport(HttpServletRequest request,HttpServletResponse response) throws Exception{
		OutputStream ops=null;
		Connection conn=null;
		try {
			conn = DbPoolConnection.getInstance().getConnection();
			
			Account account=(Account) request.getSession().getAttribute("ACCOUNT_ID");
			List<Record> records=logic.getExportRecords(account,conn);
			
			String exportFileName="用户信息列表.xls";
			
			String ContentDisposition=HttpUtil.getReponseHeader_ContentDisposition(exportFileName, request.getHeader("user-agent"));

			response.setHeader("Cache-control", "private");
			response.setHeader("Cache-Control", "maxage=3600");
			response.setHeader("Pragma", "public");
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-disposition",ContentDisposition);
			
			ops=response.getOutputStream();
			ExcelUtil.writeExcel(ops, records);
			
		} catch (Exception e) {
			throw e;
		}finally{
			logic.dao.close(null, null, conn);
			SysTool.closeOutputStream(ops);
		}
		return null;
	}
}
