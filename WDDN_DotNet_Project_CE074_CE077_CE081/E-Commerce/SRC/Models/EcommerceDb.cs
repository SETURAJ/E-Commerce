using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace E_Commerce.SRC.Models
{
    public class EcommerceDb : DbContext
    {
        // Your context has been configured to use a 'EcommerceDb' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'E_Commerce.SRC.Models.EcommerceDb' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'EcommerceDb' 
        // connection string in the application configuration file.
        public EcommerceDb()
            : base("name=EcommerceDb")
        {
            Database.SetInitializer<EcommerceDb>(new Initializer());

        }

        public class Initializer : IDatabaseInitializer<EcommerceDb>
        {
            public void InitializeDatabase(EcommerceDb context)
            {
                if (context.Database.Exists() && !context.Database.CompatibleWithModel(false))
                    context.Database.Delete();

                if (!context.Database.Exists())
                {
                    context.Database.Create();
                    context.Database.ExecuteSqlCommand("alter table Users add constraint UniqueUserEmail unique (Email)");
                    context.Database.ExecuteSqlCommand("alter table Users add constraint UniqueUserUsername unique (Username)");
                }
            }
        }


        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        // public virtual DbSet<MyEntity> MyEntities { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Size> Sizes { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<ProductImages> productImages { get; set; }
        public DbSet<ProductSizeQuantity> productSizeQuantities { get; set; }



    }

    [Table("Users")]
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Uid { get; set; }
        [StringLength(100)]
        public String Username { get; set; }
        public String Password { get; set; }
        [StringLength(100)]
        public String Email { get; set; }
        public String Name { get; set; }
        public String UserType { get; set; }

        public User()
        {

        }
        public User(String Username, String Password, String Email, String Name, String UserType="User")
        {
            this.Username = Username;
            this.Password = Password;
            this.Email = Email;
            this.Name = Name;
            this.UserType = UserType;
        }

    }

    [Table("Brands")]
    public class Brand
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BrandID { get; set; }
        public string Name { get; set; }

    }

    [Table("Categoies")]
    public class Category
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CatID { get; set; }
        public string Name { get; set; }

        public ICollection<SubCategory> subCategories { get; set; }

    }

    [Table("SubCategories")]
    public class SubCategory
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SubCatID { get; set; }
        public string Name { get; set; }

        [ForeignKey("MainCategory")]
        public int MainCatId { get; set; }
        public Category MainCategory { get; set; }

    }

    [Table("Genders")]
    public class Gender
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int GenderID { get; set; }
        public string GenderName { get; set; }
    }

    [Table("Sizes")]
    public class Size
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SizeID { get; set; }
        public byte[] SizeName { get; set; }
        
        
    }

    [Table("Products")]
    public class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Pdescription { get; set; }
        public string PProductDetails { get; set; }
        public string PMAterialCare { get; set; }
        public bool FreeDelivery { get; set; }
        public bool _30DayRet { get; set; }
        public bool COD { get; set; }
        public string Size { get; set; }



        [Column(TypeName = "money")]
        public decimal PPrice { get; set; }
        [Column(TypeName = "money")]
        public decimal PSellPrice { get; set; }


        [ForeignKey("Brand")]
        public int BrandID { get; set; }
        public Brand Brand { get; set; }



        [ForeignKey("subCategory")]
        public int SubCategoryID { get; set; }
        public SubCategory subCategory { get; set; }

        [ForeignKey("gender")]
        public int GenderID { get; set; }
        public Gender gender { get; set; }

    }

    [Table("ProductImages")]
    public class ProductImages
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ImgID { get; set; }
        public string Name { get; set; }
        public string Extension { get; set; }

        [ForeignKey("Product")]
        public int ProductID { get; set; }
        public Product Product { get; set; }
    }

    [Table("ProductSizeQuanities")]
    public class ProductSizeQuantity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int  QID { get; set; }
        public int Quantity { get; set; }


        [ForeignKey("Product")]
        public int PID { get; set; }
        public Product Product { get; set; }



    }

}