namespace WebApplicationExample.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserProject")]
    public partial class UserProject
    {
        public int UserProjectId { get; set; }

        public int UserId { get; set; }

        public int ProjectId { get; set; }

        public bool IsActive { get; set; }

        public string TimeToStart {
            get
            {
                var days = (Project.StartDate - AssignedDate).TotalDays;
                return (days < 0) ? "Started" : days.ToString();
            }
        }

        public DateTime AssignedDate { get; set; }

        public virtual Project Project { get; set; }

        public virtual Project User { get; set; }
    }
}
