using DevOpsDemo.Client.Controllers;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace DevOpsDemo.Tests
{
  public class HomeUnitTest
  {
    [Fact]
    public void Test_Index()
    {
    //Given
      var sut = new HomeController();
      var view = sut.Index();
    //When
    
    //Then
      Assert.NotNull(view);
    }

    [Fact]
    public void Test_Privacy()
    {
    //Given
      var sut = new HomeController();
      var view = sut.Privacy();
    //When
    
    //Then
      Assert.NotNull(view);
      Assert.IsType<ViewResult>(view);
    }
  }
}