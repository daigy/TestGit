using InterviewManagement.App_Code.BO;
using InterviewManagement.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Net.Http;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Text;
using Telerik.Web.UI.com.hisoftware.api2;

namespace InterviewManagement.App_Code.BLL
{
    public class General_BLL
    {
        dbConnection obj = new dbConnection();
        public DataTable LoginValidate(string EmployeeCode)
        {
            try
            {
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_LoginValidateInterview";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@EmployeeCode", EmployeeCode);
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                DataSet ds = new DataSet();
                dataAdapter.SelectCommand = obj.getcommand;
                dataAdapter.Fill(ds);
                return ds.Tables[0];
            }
            catch
            {
                throw;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public DataTable epromiseLoginValidated(string _EmployeeCode, string _EmployeePassword)
        {
            obj.OpenconnectionFR();
            obj.getcommandFR.CommandType = CommandType.Text;
            obj.getcommandFR.CommandText = "select * from tbl_EmployeeLogin where EmployeeCode = @EmployeeCode and EmployeePassword = @EmployeePassword";
            obj.getcommandFR.Parameters.Clear();
            obj.getcommandFR.Parameters.AddWithValue("@EmployeeCode", _EmployeeCode);
            obj.getcommandFR.Parameters.AddWithValue("@EmployeePassword", _EmployeePassword);
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            dataAdapter.SelectCommand = obj.getcommandFR;
            dataAdapter.Fill(ds);
            return ds.Tables[0];
        }
        public DataTable NextReferenceNoForStaffIntrw()
        {
            try
            {
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "NextReferenceNoForStaffIntrw";
                obj.getcommand.Parameters.Clear();
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                DataSet ds = new DataSet();
                dataAdapter.SelectCommand = obj.getcommand;
                dataAdapter.Fill(ds);
                return ds.Tables[0];
            }
            catch
            {
                throw;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }

        public DataTable Get_epromiseMaster(string epromise)
        {
            string epromis = epromise.TrimStart('0');
            DataTable dt = new DataTable();
            IEnumerable<epromise_Model> Epromiseobj = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("http://in-housewebapp:8087/api/epromise/");
            var consumeapi = hc.GetAsync("GetByEpromise?staffno=" + epromis);
            consumeapi.Wait();
            var readData = consumeapi.Result;
            if (readData != null)
            {
                if (readData.IsSuccessStatusCode)
                {
                    var displayResult = readData.Content.ReadAsAsync<IList<epromise_Model>>();
                    displayResult.Wait();
                    Epromiseobj = displayResult.Result;
                    dt = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(Newtonsoft.Json.JsonConvert.SerializeObject(Epromiseobj));
                }
            }
            return dt;
        }
        public StaffInterview_Model Get_InterviewDetails(int TranID)
        {
            DataTable dt = new DataTable();
            StaffInterview_Model StaffInterviewObj = new StaffInterview_Model();
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterview/");
            var consumeapi = hc.GetAsync("GetStaffInterviewbyTranId?TranId="+TranID);
            consumeapi.Wait();
            var readData = consumeapi.Result;
            if (readData != null)
            {
                if (readData.IsSuccessStatusCode)
                {
                    var displayResult = readData.Content.ReadAsAsync<StaffInterview_Model>();
                    displayResult.Wait();
                    StaffInterviewObj = displayResult.Result;
                }
            }
            return StaffInterviewObj;
        }
        public DataTable GetInterviewAttachments(int TranID)
        {
            DataTable Result = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_InterviewAttachments";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@TranId", TranID);
            try
            {
                obj.Openconnection();

                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(Result);
                return Result;
            }
            catch (Exception ex)
            {
                return Result;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }

        public bool SubmitTransaction(StaffInterview_Model objd)
        {
            var Flag = true;
            var data = JsonConvert.SerializeObject(objd);
            HttpClient _client = new HttpClient();
            _client.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterview");
            StringContent content = new StringContent(data, Encoding.UTF8, "application/json");
            HttpResponseMessage response = _client.PostAsync(_client.BaseAddress + "/AddNewtransaction", content).Result;
            if (response.IsSuccessStatusCode)
            {
                Flag = true;
            }
            else
            {
                Flag = false;
            }
            return Flag;
        }
        public bool UpdateTransaction(int TranID, StaffInterviewUpdate_Model objd)
        {
            var Flag = true;
            var data = JsonConvert.SerializeObject(objd);
            HttpClient _client = new HttpClient();
            _client.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterview");
            StringContent content = new StringContent(data, Encoding.UTF8, "application/json");
            HttpResponseMessage response = _client.PutAsync(_client.BaseAddress + "/UpdateTransaction?tarnid="+ TranID, content).Result;
            if (response.IsSuccessStatusCode)
            {
                Flag = true;
            }
            else
            {
                Flag = false;
            }
            return Flag;
        }
        public int DeleteTranID(int TranID)
        {
            int Result = 0;
            HttpClient _client = new HttpClient();
            _client.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterview/");
            var consumeapi = _client.DeleteAsync("DeleteTranID?TranID=" + TranID);
            consumeapi.Wait();
            var readData = consumeapi.Result;
            if (readData != null)
            {
                if (readData.IsSuccessStatusCode)
                {
                    Result = 1;
                }
                else
                {
                    Result = 0;
                }
            }
            return Result;
        }
        public int DeleteAttachments(int TranID)
        {
            try
            {
                int bresult = 0;
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_tbl_DeleteStaffInterviewDoc";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@TranID", TranID);
                bresult = obj.getcommand.ExecuteNonQuery();
                return bresult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }

        }
        public int SubmitAttachments(string REF_ID, DataTable InterviewAttach,int TranID)
        {
            try
            {
                int bresult = 0;
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_tbl_StaffInterviewDoc";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@REF_ID", REF_ID);
                obj.getcommand.Parameters.AddWithValue("@TranID", TranID);
                obj.getcommand.Parameters.AddWithValue("@InterviewAttach", InterviewAttach);
                bresult = obj.getcommand.ExecuteNonQuery();
                return bresult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }

        }
        public DataTable Get_AttachmentDocument(int TranID)
        {
            DataTable Result = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_Get_AttachmentDocument";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@TranID", TranID);
            try
            {
                obj.Openconnection();

                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(Result);
                return Result;
            }
            catch (Exception ex)
            {
                return Result;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public DataTable Get_StaffInterviewbyRequestForMPRef( string RequestForMPRef)
        {
            DataTable Result = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_StaffInterviewbyRequestForMPRef";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@RequestForMPRef", RequestForMPRef);
            try
            {
                obj.Openconnection();

                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(Result);
                return Result;
            }
            catch (Exception ex)
            {
                return Result;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }

        //----------------------------InterviewOffer------------------------
        #region
        public int SubmitInterviewOffer(InterviewOffer_Model objd)
        {
            try
            {
                int bresult = 0;
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_tbl_InterviewOffer";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@InterviewTranId", objd.InterviewTranId);
                obj.getcommand.Parameters.AddWithValue("@PositionOffered", objd.PositionOffered);
                obj.getcommand.Parameters.AddWithValue("@GroupSalaryRangeMin", objd.GroupSalaryRangeMin);
                obj.getcommand.Parameters.AddWithValue("@GroupSalaryRangeMid", objd.GroupSalaryRangeMid);
                obj.getcommand.Parameters.AddWithValue("@GroupSalaryRangeMax", objd.GroupSalaryRangeMin);
                obj.getcommand.Parameters.AddWithValue("@OfferStatus", objd.OfferStatus);
                obj.getcommand.Parameters.AddWithValue("@OfferRejectReason", objd.OfferRejectReason);
                obj.getcommand.Parameters.AddWithValue("@OfferComments", objd.OfferComments);
                obj.getcommand.Parameters.AddWithValue("@EntryUser", objd.EntryUser);
                bresult = obj.getcommand.ExecuteNonQuery();
                return bresult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }

        }
        public DataTable Get_InterviewOffer(int TranID)
        {
            DataTable Result = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_Get_InterviewOffer";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@TranId", TranID);
            try
            {
                obj.Openconnection();

                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(Result);
                return Result;
            }
            catch (Exception ex)
            {
                return Result;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public DataTable Get_HRMInterviewOffer(int TranID)
        {
            DataTable Result = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_Get_HRMInterviewOffer";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@TranId", TranID);
            try
            {
                obj.Openconnection();

                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(Result);
                return Result;
            }
            catch (Exception ex)
            {
                return Result;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public DataTable Get_MngInterviewOffer(int TranID)
        {
            DataTable Result = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_Get_MngInterviewOffer";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@TranId", TranID);
            try
            {
                obj.Openconnection();

                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(Result);
                return Result;
            }
            catch (Exception ex)
            {
                return Result;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        #endregion
        //----------------------------HRM Action------------------------
        #region
        public DataTable Get_HRMAction()
        {
            DataTable dt = new DataTable();
            IEnumerable<InterviewHRM_Model> StaffInterviewObj = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterviewHRM/");
            var consumeapi = hc.GetAsync("GetPendingHRMAction");
            consumeapi.Wait();
            var readData = consumeapi.Result;
            if (readData != null)
            {
                if (readData.IsSuccessStatusCode)
                {
                    var displayResult = readData.Content.ReadAsAsync<IList<InterviewHRM_Model>>();
                    displayResult.Wait();
                    StaffInterviewObj = displayResult.Result;
                    dt = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(Newtonsoft.Json.JsonConvert.SerializeObject(StaffInterviewObj));
                }
            }
            return dt;
        }
        public bool SubmitHRMAction(InterviewHRM_Approval_Model objd)
        {
            var Flag = true;
            var data = JsonConvert.SerializeObject(objd);
            HttpClient _client = new HttpClient();
            _client.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterviewHRM");
            StringContent content = new StringContent(data, Encoding.UTF8, "application/json");
            HttpResponseMessage response = _client.PostAsync(_client.BaseAddress , content).Result;
            if (response.IsSuccessStatusCode)
            {
                Flag = true;
            }
            else
            {
                Flag = false;
            }
            return Flag;
        }
        #endregion
        //----------------------------HRM Action------------------------
        #region
        public DataTable Get_MNGAction()
        {
            DataTable dt = new DataTable();
            IEnumerable<InterviewHRM_Model> StaffInterviewObj = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterviewMNG/");
            var consumeapi = hc.GetAsync("Get_Pending_MNG");
            consumeapi.Wait();
            var readData = consumeapi.Result;
            if (readData != null)
            {
                if (readData.IsSuccessStatusCode)
                {
                    var displayResult = readData.Content.ReadAsAsync<IList<InterviewHRM_Model>>();
                    displayResult.Wait();
                    StaffInterviewObj = displayResult.Result;
                    dt = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(Newtonsoft.Json.JsonConvert.SerializeObject(StaffInterviewObj));
                }
            }
            return dt;
        }
        #endregion
        //------------------Management-------------------
        #region
        //public bool SubmitMNGAction(InterviewMNG_Approval_Model objd)
        //{
        //    var Flag = true;
        //    var data = JsonConvert.SerializeObject(objd);
        //    HttpClient _client = new HttpClient();
        //    _client.BaseAddress = new Uri("http://in-housewebapp:8085/api/StaffInterviewMNG");
        //    StringContent content = new StringContent(data, Encoding.UTF8, "application/json");
        //    HttpResponseMessage response = _client.PostAsync(_client.BaseAddress + "/AddNewtransaction", content).Result;
        //    if (response.IsSuccessStatusCode)
        //    {
        //        Flag = true;
        //    }
        //    else
        //    {
        //        Flag = false;
        //    }
        //    return Flag;
        //}
        public int SubmitMNGAction(int InterviewTranId,string MNGAction, string MNGComments,string MNGActionBy)
        {
            try
            {
                int bresult = 0;
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_tbl_InterviewOffer_MNG";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@InterviewTranId", InterviewTranId);
                obj.getcommand.Parameters.AddWithValue("@MNGAction", MNGAction);
                obj.getcommand.Parameters.AddWithValue("@MNGOfferComments", MNGComments);
                obj.getcommand.Parameters.AddWithValue("@MNGActionBy", MNGActionBy);
                bresult = obj.getcommand.ExecuteNonQuery();
                return bresult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }

        }
        #endregion
    }
}