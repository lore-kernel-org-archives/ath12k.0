Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A1CC54798
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EX5DyLLgT3KvmZlOZYE3EMTr2abrgesZfw6MHEUJYY=; b=JhcoxpxyVTJ34vkPBybl4VKNcp
	aLgSogpgCPWNlFi4jqDuf1aHq5pDwBozXz4KlrHuBjCYWM6/3ugDKo6Hw2qBLUG7+yOx3yMkPr+4m
	yQF17HItUSTto2+7iqvntFqvP0fnQdckmwpT2NiUBqNcCIXC829Ad+i235vgsX8m7mUk8/a3oiZoB
	OYvPNKR1K6DbsepZpVXKPH6gfHh1UyYwTODKwqY5pkMkAz1CZws6wDsQ5J7/mk4rauDWqJOY/h6eN
	d4u67JHqotlfB0clAEfMXXSZ0crV6yAG+Mtmwh35pvzXFDMYvMwQtMGVASZPi4ZroToHaLRX9aXqU
	Q5M7yULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdaYo-0000000AuBM-37qx
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 18:46:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdaXx-0000000Atud-0CF4;
	Fri, 23 Feb 2024 18:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF93861654;
	Fri, 23 Feb 2024 18:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3ACC433C7;
	Fri, 23 Feb 2024 18:45:01 +0000 (UTC)
Date: Fri, 23 Feb 2024 13:46:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-rdma@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-hyperv@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
 <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
 <linux-usb@vger.kernel.org>, <linux-bcachefs@vger.kernel.org>,
 <linux-nfs@vger.kernel.org>, <ocfs2-devel@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
 <linux-edac@vger.kernel.org>, <selinux@vger.kernel.org>,
 <linux-btrfs@vger.kernel.org>, <linux-erofs@lists.ozlabs.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-hwmon@vger.kernel.org>,
 <io-uring@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-wpan@vger.kernel.org>, <dev@openvswitch.org>,
 <linux-s390@vger.kernel.org>, <tipc-discussion@lists.sourceforge.net>,
 Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240223134653.524a5c9e@gandalf.local.home>
In-Reply-To: <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
References: <20240223125634.2888c973@gandalf.local.home>
	<0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_104521_954352_99C4E29E 
X-CRM114-Status: GOOD (  22.40  )
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

On Fri, 23 Feb 2024 10:30:45 -0800
Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > 
> > [
> >    This is a treewide change. I will likely re-create this patch again in
> >    the second week of the merge window of v6.9 and submit it then. Hoping
> >    to keep the conflicts that it will cause to a minimum.
> > ]
> > 
> > With the rework of how the __string() handles dynamic strings where it
> > saves off the source string in field in the helper structure[1], the
> > assignment of that value to the trace event field is stored in the helper
> > value and does not need to be passed in again.  
> 
> Just curious if this could be done piecemeal by first changing the
> macros to be variadic macros which allows you to ignore the extra
> argument. The callers could then be modified in their separate trees.
> And then once all the callers have be merged, the macros could be
> changed to no longer be variadic.

I weighed doing that, but I think ripping off the band-aid is a better
approach. One thing I found is that leaving unused parameters in the macros
can cause bugs itself. I found one case doing my clean up, where an unused
parameter in one of the macros was bogus, and when I made it a used
parameter, it broke the build.

I think for tree-wide changes, the preferred approach is to do one big
patch at once. And since this only affects TRACE_EVENT() macros, it
hopefully would not be too much of a burden (although out of tree users may
suffer from this, but do we care?)

Now one thing I could do is to not remove the parameter, but just add:

	WARN_ON_ONCE((src) != __data_offsets->item##_ptr_);

in the __assign_str() macro to make sure that it's still the same that is
assigned. But I'm not sure how useful that is, and still causes burden to
have it. I never really liked the passing of the string in two places to
begin with.

-- Steve

