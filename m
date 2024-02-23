Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7DDC54798
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 20:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU2NoxvEkiqB91Rg1/kTiKe/8v9P5M7YGnkA7Gr32Yc=; b=feCviuHpZKZbq4OpOup8xey96h
	MVEjDBL46kHa7qwVIGWMJSQLJIpWc2tE6233hFfXJ1ehg29WqTJYWzEVcpnAihyHr3dQLUii3xbP5
	c7jDME5b+tD57sXwLeQwT+lnaL6nMqGOhHgCBwsgpErk7vmjSNx5iGLzPM2m51iRpfqvtdsUBcWHd
	YknlYUZWP1wl4GptJscqNA8uCxWXjQnbMXt05bUsigX/d4lVFQPT/+c2Wzu3+iNyFNawvm6FpLdOw
	c4pIKWtAvjlk2XqKb9E4L/WQ4x8dxP4EUYNgd+qnTZ8CnSfrXP1/vwAi6p2Lffbd+3mf/G7Xqz3l6
	EqqJeDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdbka-0000000B6x8-0Sgy
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 20:02:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdbk2-0000000B6mk-25sj;
	Fri, 23 Feb 2024 20:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B5A9CE2E7B;
	Fri, 23 Feb 2024 20:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C71C433F1;
	Fri, 23 Feb 2024 20:01:46 +0000 (UTC)
Date: Fri, 23 Feb 2024 15:03:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, LKML
 <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org,
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org,
 selinux@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org,
 linux-sound@vger.kernel.org, bpf@vger.kernel.org,
 linux-wpan@vger.kernel.org, dev@openvswitch.org,
 linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net, Julia
 Lawall <Julia.Lawall@inria.fr>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240223150339.2249bc95@gandalf.local.home>
In-Reply-To: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
	<0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
	<20240223134653.524a5c9e@gandalf.local.home>
	<qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_120155_948516_26C84751 
X-CRM114-Status: GOOD (  11.55  )
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

On Fri, 23 Feb 2024 14:50:49 -0500
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> Tangentially related though, what would make me really happy is if we
> could create the string with in the TP__fast_assign() section. I have to
> have a bunch of annoying wrappers right now because the string length
> has to be known when we invoke the tracepoint.

You can use __string_len() to determine the string length in the tracepoint
(which is executed in the TP_fast_assign() section).

My clean up patches will make __assign_str_len() obsolete too (I'm working
on them now), and you can just use __assign_str().

I noticed that I don't have a string_len example in the sample code and I'm
actually writing it now.

// cutting out everything else:

TRACE_EVENT(foo_bar,

	TP_PROTO(const char *foo, int bar),

	TP_ARGS(foo, bar),

	TP_STRUCT__entry(
		__string_len(	lstr,	foo,	bar < strlen(foo) ? bar : strlen(foo) )
	),

	TP_fast_assign(
		__assign_str(lstr, foo);

// Note, the above is with my updates, without them, you need to duplicate the logic

//		__assign_str_len(lstr, foo, bar < strlen(foo) ? bar : strlen(foo));
	),

	TP_printk("%s", __get_str(lstr))
);


The above will allocate "bar < strlen(foo) ? bar : strlen(foo)" size on the
ring buffer. As the size is already stored, my clean up code uses that
instead of requiring duplicating the logic again.

-- Steve

