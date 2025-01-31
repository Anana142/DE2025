﻿using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class Post
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Worker> Workers { get; set; } = new List<Worker>();
}
