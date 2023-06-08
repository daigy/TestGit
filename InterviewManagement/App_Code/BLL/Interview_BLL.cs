using InterviewManagement.App_Code.BO;
using InterviewManagement.App_Code.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace InterviewManagement.App_Code.BLL
{
    public class Interview_BLL
    {
        dbConnection obj = new dbConnection();
        public int Submit_StaffInterview(StaffInterview_Model data)
        {
            try
            {
                int bresult = 0;
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_tbl_StaffInterview";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@TranId", data.TranId);
                obj.getcommand.Parameters.AddWithValue("@Interviewer", data.Interviewer);
                obj.getcommand.Parameters.AddWithValue("@RequestForMPRef", data.RequestForMPRef);
                obj.getcommand.Parameters.AddWithValue("@ApplicantName", data.ApplicantName);
                obj.getcommand.Parameters.AddWithValue("@PoitionAppliedFor", data.PoitionAppliedFor);
                obj.getcommand.Parameters.AddWithValue("@PositionAppliedForCode", data.PositionAppliedForCode);
                obj.getcommand.Parameters.AddWithValue("@InterviewType", data.InterviewType);
                obj.getcommand.Parameters.AddWithValue("@JobKnowledge", data.JobKnowledge); 
                obj.getcommand.Parameters.AddWithValue("@InterviewAssessment", data.InterviewAssessment);
                obj.getcommand.Parameters.AddWithValue("@CommunicationSkills", data.CommunicationSkills);
                obj.getcommand.Parameters.AddWithValue("@LeadershipQualities", data.LeadershipQualities);
                obj.getcommand.Parameters.AddWithValue("@Experience", data.Experience);
                obj.getcommand.Parameters.AddWithValue("@Confidence_Attitude", data.Confidence_Attitude);
                obj.getcommand.Parameters.AddWithValue("@PhysicalAppearance", data.PhysicalAppearance);
                obj.getcommand.Parameters.AddWithValue("@Education", data.Education);
                obj.getcommand.Parameters.AddWithValue("@Other_Score", data.Other_Score);
                obj.getcommand.Parameters.AddWithValue("@OverallMark", data.OverallMark);
                obj.getcommand.Parameters.AddWithValue("@InterviewerComments", data.InterviewerComments);
                obj.getcommand.Parameters.AddWithValue("@InterviewResult", data.InterviewResult);
                obj.getcommand.Parameters.AddWithValue("@ERP_Ref", data.ERP_Ref);
                obj.getcommand.Parameters.AddWithValue("@ApplicantDivision", data.ApplicantDivision);
                obj.getcommand.Parameters.AddWithValue("@ApplicantCompany", data.ApplicantCompany);
                obj.getcommand.Parameters.AddWithValue("@PositionRecommended", data.PositionRecommended);
                obj.getcommand.Parameters.AddWithValue("@EntryBy", data.EntryBy);
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
        public DataTable StaffInterviewbyTranId(int TranID)
        {
            DataTable dt = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_StaffInterviewbyTranId";
            obj.getcommand.Parameters.Clear();
            obj.getcommand.Parameters.AddWithValue("@TranId", TranID);
            try
            {
                obj.Openconnection();
                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return dt;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public DataTable Get_StaffInterviewForHRM_Action()
        {
            DataTable dt = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "USP_tbl_StaffInterviewForHRM_Action";
            obj.getcommand.Parameters.Clear();
            try
            {
                obj.Openconnection();
                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return dt;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public DataTable Get_Pending_MNGAction()
        {
            DataTable dt = new DataTable();
            obj.Openconnection();
            obj.getcommand.CommandType = CommandType.StoredProcedure;
            obj.getcommand.CommandText = "Get_Pending_MNG";
            obj.getcommand.Parameters.Clear();
            try
            {
                obj.Openconnection();
                SqlDataAdapter ad = new SqlDataAdapter(obj.getcommand);
                ad.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return dt;
                throw ex;
            }
            finally
            {
                obj.getcommand.Dispose();
                obj.Closeconnection();
            }
        }
        public int SaveSalaryRange(int SalaryRangeTranID,string WorkingAsCode,string WorkingAsName,string MinSalary,string MidSalary,string MaxSalary,string Type)
        {
            try
            {
                int bresult = 0;
                obj.Openconnection();
                obj.getcommand.CommandType = CommandType.StoredProcedure;
                obj.getcommand.CommandText = "USP_tbl_SalaryRangeFromHR";
                obj.getcommand.Parameters.Clear();
                obj.getcommand.Parameters.AddWithValue("@SalaryRangeTranID", SalaryRangeTranID);
                obj.getcommand.Parameters.AddWithValue("@WorkingAsCode", WorkingAsCode);
                obj.getcommand.Parameters.AddWithValue("@WorkingAsName", WorkingAsName);
                obj.getcommand.Parameters.AddWithValue("@MinSalary", MinSalary);
                obj.getcommand.Parameters.AddWithValue("@MidSalary", MidSalary);
                obj.getcommand.Parameters.AddWithValue("@MaxSalary", MaxSalary);
                obj.getcommand.Parameters.AddWithValue("@Type", Type);
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


    }
}