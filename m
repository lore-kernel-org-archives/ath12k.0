Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B29C25B78
	for <ath12k@archiver.kernel.org>; Fri, 17 May 2024 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=; b=bIUgjL6Cxghq8QRUKMEnRTfb5D
	bTNI4e0i4lLk2QZIbNJdFkydPqLaB4WzAS2xHMYQ0cdjuvMQvOLX/dUmnS9ekfLKjhBI8J0OpoA/X
	2T8GKm6L77/fmaiisv8D9ISUURZJOMCxcm5IxKx39vWQWVXi4cgnUcSWZybF8hpjFQ2e9HqF+VT/L
	OkWq83ahsMhVYdKIOjZmsNh1Ay1A1ZV3PgfIdVKvMaV2IOK0cx7UOtDQp5eRsQDgV2xDsEjamW+y6
	KJpqH3kzF6WXjxWg9yPaPDCc1ejlFD9i1mtRFmz7TAmQG6PfJe6KuNa9RD9MtKvXZ0zQgnpQ4+azw
	N7uG66HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s81Vd-00000008YRA-1g3D
	for ath12k@archiver.kernel.org;
	Fri, 17 May 2024 17:36:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s81VY-00000008YNM-1hh1;
	Fri, 17 May 2024 17:36:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1edf506b216so15702345ad.2;
        Fri, 17 May 2024 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715967399; x=1716572199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=;
        b=Lfp5RHAGk5MLzQ219bNil8CSakYjPRA0UYzFBIauRLImYHl0J3KeZ5n/+xG9/mwGgh
         YW9ZVE29CDzFOykFykww+NGRQF31ecImAWO7ArCVkmb7PFbYhcHcMVqEbftcVWioToNp
         icQTxsxXJ8Op0BKIdO/Ki1b82SisNxHp6illTLVZLB+kO5boBMGn3Dmab+S/u4jbXgC5
         nNQyyGO1+9yJtEJ4ai2Vt+DFMn89Q22GilSLcquclzmOw5zRm+IQVFfLaq7Aixon8O/6
         7ulHhUrLCGFsucLYQcK7uV9Q60TatXPsrC40vXhU2bNnA9wYApzdFpDGApY1SqMxGA3J
         vQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715967399; x=1716572199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=;
        b=SUZUahQ6/ir7mjXT1412PB/ooH8O9ZsgbCswxEVifpt47UR2Xb7b0a7PEa6h01RPzK
         ineFbhT/EYS8ImrhWblJmGsszSfGRaXWqUh0nH+JNfCSfYlyYnAlu+bXNHtnhztsXToY
         h3sO3IwSL2lWJete+E7zrIOjorBx8jx1UczwKggbbc3VHXsuaEGI+VYzvOIuKzD2qjON
         EtLgb+ao46bWjiIva+5qr/gz352C47zupQvMQQhGkf9mW40wWCziE4kULtxW697A/vC9
         sQSwhcLqBzGgK2angNumw9m6eki8RWbWg4YuADUI1rZJm9jbDIe5YlWjnUAWiLZpXIf6
         i6jA==
X-Forwarded-Encrypted: i=1; AJvYcCUS7mhR606SwMUzQRyu4j0rXmq4tt9VyfdjzHhRnJBy3aBMjh0FdHVxEpisrVP4yJc/K5TxsJCR1eKsIGTsq/DFIE21NJ29Ou9CCUg2qtjVfb4fGJEnljHdmjW2YIvjKPp0KcmhdPpDj8nst2RzQo7aYDTT+YPwbTLeQjv0Mu66fwgF
X-Gm-Message-State: AOJu0YyLrmB1Q4oYlqCjvatXqiU1DPlvAdVZqZmSdPOGungOiQGoML/d
	jFL45PHyqVrR05tGE+zxFvO7u28WDo48zgDTa8GZlic1BVJos4Xq
X-Google-Smtp-Source: AGHT+IHJ9PZtASiLb9HJkYrHy1DRhdQlVEuKbRr0NYIRv4Tx+av91BIA0wx1gBcIQQlm9sd2COIQnQ==
X-Received: by 2002:a17:90a:9606:b0:2b9:a299:928e with SMTP id 98e67ed59e1d1-2b9a29994c9mr10436893a91.24.1715967398710;
        Fri, 17 May 2024 10:36:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67105666csm15749258a91.8.2024.05.17.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 10:36:38 -0700 (PDT)
Date: Fri, 17 May 2024 10:36:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
	linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	netdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	linux-usb@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	linux-cifs@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-edac@vger.kernel.org, selinux@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-hwmon@vger.kernel.org,
	io-uring@vger.kernel.org, linux-sound@vger.kernel.org,
	bpf@vger.kernel.org, linux-wpan@vger.kernel.org,
	dev@openvswitch.org, linux-s390@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
References: <20240516133454.681ba6a0@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_103640_473218_F420036D 
X-CRM114-Status: GOOD (  21.12  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2024 at 01:34:54PM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 

Building csky:allmodconfig (and others) ... failed
--------------
Error log:
In file included from include/trace/trace_events.h:419,
                 from include/trace/define_trace.h:102,
                 from drivers/cxl/core/trace.h:737,
                 from drivers/cxl/core/trace.c:8:
drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1

This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
So far that seems to be the only build failure.
Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
cxl_general_media and cxl_dram events"). Guess we'll see more of those
towards the end of the commit window.

Guenter

