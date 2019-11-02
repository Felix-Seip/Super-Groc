using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Service.UnitTest
{
    [TestClass]
    public class DummyTest
    {
        [TestMethod]
        public void True_Should_BeTrue()
        {
            true.Should().BeTrue();
        }
    }
}
