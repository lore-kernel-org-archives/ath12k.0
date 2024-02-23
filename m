Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77715C5478C
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=; b=uude00E7JmR1T5ZvhmUVkjw5m1
	9K7G3g5mjhkcmGrAT7NAFDHEhB8BnwHYGar7pKq/CsFrRn3kZKjEMfWCp2c5OC4gJsLXJO2HSHR2z
	c/L1Lj3p7tZgFPw54Q+cttzZXVDBZrPtkQkdB9V97h8R/ZRMxNA5QRgqxSAOY40dUQI4j4CZphqPs
	7A9mM99+gNIOjf36OrIr6Xq8Mk8fyzDjrBKZGIEYItuJYVhXIrvx7IIc49GPrsAauqUIgww8VQkFC
	GstZnppGz4d7lyFwr3+85ZuaNcK3FBtWQ20Qhp6bYa4zmNSUsOSuW9rY8Gwa+Tjdrh6hEPgur6UPw
	YEY8RM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdbZj-0000000B4oc-49y2
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 19:51:15 +0000
Received: from out-175.mta1.migadu.com ([2001:41d0:203:375::af])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdbZd-0000000B4l2-2EE2
	for ath12k@lists.infradead.org;
	Fri, 23 Feb 2024 19:51:13 +0000
Date: Fri, 23 Feb 2024 14:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708717865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=;
	b=uWxPu15jxbBy5Qv8sUU4/FKz9vhwMVdq24ex7AxwdBDTkpdTty7N4oFt5H+WpItVhn5h2q
	QhDNbk6QMiXNrrlkBl7kMfsoV81d2NhOFvXWC0sVWqoHMtRJN5Tm42Zzvb2Qci9w4QIV6Q
	wpkGE4FwRbb7rZDimmKQkBl02FYhYXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, 
	LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org, selinux@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org, 
	dev@openvswitch.org, linux-s390@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
 <20240223134653.524a5c9e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223134653.524a5c9e@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_115109_798373_BA021719 
X-CRM114-Status: GOOD (  24.19  )
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

On Fri, Feb 23, 2024 at 01:46:53PM -0500, Steven Rostedt wrote:
> On Fri, 23 Feb 2024 10:30:45 -0800
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> 
> > On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > 
> > > [
> > >    This is a treewide change. I will likely re-create this patch again in
> > >    the second week of the merge window of v6.9 and submit it then. Hoping
> > >    to keep the conflicts that it will cause to a minimum.
> > > ]
> > > 
> > > With the rework of how the __string() handles dynamic strings where it
> > > saves off the source string in field in the helper structure[1], the
> > > assignment of that value to the trace event field is stored in the helper
> > > value and does not need to be passed in again.  
> > 
> > Just curious if this could be done piecemeal by first changing the
> > macros to be variadic macros which allows you to ignore the extra
> > argument. The callers could then be modified in their separate trees.
> > And then once all the callers have be merged, the macros could be
> > changed to no longer be variadic.
> 
> I weighed doing that, but I think ripping off the band-aid is a better
> approach. One thing I found is that leaving unused parameters in the macros
> can cause bugs itself. I found one case doing my clean up, where an unused
> parameter in one of the macros was bogus, and when I made it a used
> parameter, it broke the build.
> 
> I think for tree-wide changes, the preferred approach is to do one big
> patch at once. And since this only affects TRACE_EVENT() macros, it
> hopefully would not be too much of a burden (although out of tree users may
> suffer from this, but do we care?)

Agreed on doing it all at once, it'll be way less spam for people to
deal with.

Tangentially related though, what would make me really happy is if we
could create the string with in the TP__fast_assign() section. I have to
have a bunch of annoying wrappers right now because the string length
has to be known when we invoke the tracepoint.

