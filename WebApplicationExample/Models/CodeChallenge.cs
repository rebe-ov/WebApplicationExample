namespace WebApplicationExample.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CodeChallenge : DbContext
    {
        public CodeChallenge()
            : base("name=CodeChallengeM")
        {
        }

        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserProject> UserProjects { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Project>()
                .HasMany(e => e.UserProjects)
                .WithRequired(e => e.Project)
                .HasForeignKey(e => e.ProjectId)
                .WillCascadeOnDelete(false);



            modelBuilder.Entity<User>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.LastName)
                .IsUnicode(false);
        }
    }
}
