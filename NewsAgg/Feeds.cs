using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NewsAgg
{
    public class Feeds
    {
        public string Title       { get; set; }
        public string Link        { get; set; }
        public DateTime PublishDate { get; set; }
        public string Description { get; set; }
        public string[] Categories { get; set;}

        public Feeds(string title, string link, DateTime pubDate, string description)
        {
            this.Title = title;
            this.Link = link;
            this.PublishDate = pubDate;
            this.Description = description;
        }
    }
}