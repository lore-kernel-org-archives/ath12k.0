Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D43DCA5FCE
	for <ath12k@archiver.kernel.org>; Thu,  1 Oct 2026 20:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFa6HvAarHDlIrjmTAUOJ7RLBY11icZwWxARmx5iXy8=; b=39ZxeYOjC2ROpytOwZJ0p4b3lN
	rTc291p1CclGhQSO3RJYuM4cExp83NjBV62NuqokMpEYwpgZ32s0g/EH4TDqSRmT6BnG/piiEbLSz
	HFPAItdHmaSneXB/W4YbJPPq24OUGE+9h0SH5gc0S16LpTLyZDieEu2dF28QQcANah1R9QImqkhq7
	vjAhKVGqz8Sp/uxKIBe3buBCaEezqrvLNcI2tkk/6uwIpVbIlTA7tvRtGc+fIE1DHX8VFVVTNxZdl
	VRoP3xoEYUNglHWAocZIjqlqYdOGQ0OdLk9V7a6mnaxU6f3Zl51szfcN40NLa/+Rb9uc8cvGxCqwa
	Wy8L3rHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCN1y-0000000A7jF-3bry;
	Thu, 01 Oct 2026 20:05:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCN1w-0000000A7j1-2IQi;
	Thu, 01 Oct 2026 20:05:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C20B4340A;
	Thu,  1 Oct 2026 20:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D974B1F00893;
	Thu,  1 Oct 2026 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790885123;
	bh=gFa6HvAarHDlIrjmTAUOJ7RLBY11icZwWxARmx5iXy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oFkvLWac2KsZh3NfUjCP/h7/HaiDSvHH7LZO0D+Iifpk/isoYSSxhI2v3BWzn3FE3
	 ezPWKN5dBMirfln9QwBABBts0lU4yCJGluJ9V/VhUTd+ZBBRDwsyzZLXDcKCmbvuHn
	 weSfehPmwqdfc0w/3m30Pxs66Mivq+g5gBaMq+pOoNTzFy0lYhkbSwj3FX6Qk5MyiN
	 SQLtwwBKnaT1X8J1Z1sMhAHSdQsrac6gpvJIlWjBeFXj4V7HwE7EL6+tumL9iaeWb/
	 cViDa1SdbWNXvATKsmMJmiE7FSMKp018IxkjR135SkAFeLIVLA08eFdCVezKskDigm
	 WfgD1TkfwukMw==
Date: Thu, 1 Oct 2026 22:05:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <6isrx67suid5qcha47ihlphxmmeiiapdl57h57hejkwchwtfdb@i3g2cwz6oavn>
References: <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
 <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
 <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
 <0A4EB216-06E0-4A7D-A0FD-821DD371773B@holtmann.org>
 <19433f85-4cf1-4ec1-a26f-0eab7df062df@app.fastmail.com>
 <A709172A-40F7-4986-B7D3-02A422F6584A@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A709172A-40F7-4986-B7D3-02A422F6584A@holtmann.org>
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

On Thu, Oct 01, 2026 at 05:39:47PM +0200, Marcel Holtmann wrote:
> Hi Juha-Matti,
> 
> >>> Well, in defense of Manivannan's patchset it currently works for PCI+AHB
> >>> setups better than the last version of that by Denis/Mihai/me (although 
> >>> I could easily fix that), and it may be simpler for userspace to
> >>> continue using nid than having to bind to an endpoint, which requires
> >>> more changes in userspace code.
> >>> 
> >>> The userspace just needs to know the nid.
> >> 
> >> and existing userspace? You can _NOT_ break existing userspace.
> >> 
> >> Don’t you need to re-write all existing QRTRIPC packets to actually even make this work?
> > 
> > Well, from what I understand this rewriting is the plan.
> > 
> > It is true that if someone has a single card, the nid changes, thus
> > maybe breaking userspace if the userspace has hardcoded nid.
> > 
> > But if someone has multiple cards, the breakage to userspace is less
> > with this patch, since userspace can keep on using the same code and
> > just change the nid, whereas with the endpoint_id patch, the userspace
> > needs code changes to bind to an endpoint.
> 
> the general rule for Linux is to _not_ break existing userspace.
> 

The rule is that the kernel must not break ABI and the node id is not ABI.

Node ids are assigned dynamically and discovered at runtime through qrtr lookup.
They are not a fixed property of a device. For an AUTO endpoint, the id is
simply whatever the firmware advertised and nothing guarantees it stays
constant.

I internally checked with the other uses of QRTR, ModemManager and QAIC teams:

- ModemManager never computes or hardcodes node ids. It discovers them live over
AF_QIPCRTR (via libqrtr-glib) and groups ports into modems by physdev_uid, not
by node id. It is not affected by this series.

- The QAIC userspace queries the device's serial number over its own control
channel and then assumes that BHI serial number is same as node id. That
assumption is what breaks. The kernel never guaranteed it. QAIC devices just
happened to advertise the serial as the node id, so only QAIC userspace had this
assumption.

So I don't agree this is an ABI break.

To give QAIC a proper interface to migrate to, I will expose the assigned node
id via sysfs entry in next version, and the QAIC team has agreed to update their
userspace to read it from there. That sysfs attribute will become the documented
stable ABI, the specific node id value never was.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

