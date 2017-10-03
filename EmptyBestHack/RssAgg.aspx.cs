using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmptyBestHack
{
    public partial class RssAgg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListViewFilling();
        }

        private void ListViewFilling()
        {
            List<Feeds> NYList = PopulateRssFeed("http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml");
            List<Feeds> LHList = PopulateRssFeed("https://lifehacker.com/rss");
            List<Feeds> feeds = NYList.Concat(LHList).ToList();
            feeds.OrderBy((x) => x.PublishDate);

            ListView1.DataSource = feeds;
            ListView1.DataBind();
        }

        private List<Feeds> PopulateRssFeed(string dtsource)
        {
            List<Feeds> temp = new List<Feeds>();
            XDocument xDoc = XDocument.Load(dtsource);
            var items = from x in xDoc.Descendants("item")
                        select new
                        {
                            title = x.Element("title").Value,
                            link = x.Element("link").Value,
                            pubDate = x.Element("pubDate").Value,
                            description = x.Element("description").Value,
                        };
            if (items != null)
            {
                foreach (var item in items)
                {
                    DateTime pubDate = Convert.ToDateTime(item.pubDate);
                    Feeds f = new Feeds(item.title, item.link, pubDate, item.description);

                    temp.Add(f);
                }
            }
            return temp;
        }
    }
}