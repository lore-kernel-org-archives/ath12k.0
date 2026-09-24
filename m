Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6010C9830E
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntCPRNmhHP0xEpdWDgj6ZKP31wN/fxbhz+6bG3Gb24k=; b=m7gkg3f8SIMarMMWyhabFD+520
	nv8nFfktuU8O7di3oC6+uDbtKf3Y1acL9YrZSs2bPFpSGe5vBgUEcvfFcBfFTX5xQukrro7if18OC
	I9rXUNRWZtCEVdI4XFuG4BT6vfpAX5tfJRWPlJgolGsMNTdGj/KViVjZuXE4lCttIQJqg1NhEsP99
	Wf1Wasp936g86Oslp0YsmVnCQGQIhefc3QeMwEU7TpkgBfe1tEDLkP5EHu7z8Wbie5FXPSuJBH73Z
	f75hsge6R7Cu8jL8UzqyzHM7c+Se3ZsDDnpTuejKtPt2U1f321//JO093rXuAGEtuUxrAjDXhZzDv
	S5rT+79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lqK-0000000BVC1-1gST;
	Thu, 24 Sep 2026 15:58:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lqI-0000000BVBh-3FeE;
	Thu, 24 Sep 2026 15:58:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D697F601DE;
	Thu, 24 Sep 2026 15:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30C51F000FF;
	Thu, 24 Sep 2026 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790265517;
	bh=ntCPRNmhHP0xEpdWDgj6ZKP31wN/fxbhz+6bG3Gb24k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IuWWk/ehkegX/ttgIRCu0DLztu+mvo32r6PgEGd9HryTT44P3aBcJxQPfSvfVY1XA
	 O4QRPNnGtQNEDb5nlxrbDmMFN240bWTyPmrY+xYGQ7+SPGRuKhqk2hgInQPV0aqMsM
	 S7NKZk+t7prFPLguTH2qrdOTYx+xxwPPbaTwFu9TpnQnjI/D2/cPpIBTci0jtORbPw
	 B70lWjPeN9I2drRegbZS9zEjSRnduMjfHz07hOCcirqwayUBsPh/ilDwDeS9LqVv7C
	 MzREzUOg0b06utFzXw50TGVLFw38rqFXOs46EIQdVfy9MmZzwPuvDbTE/mDiW1Tgzo
	 vpG8LaduoGTeQ==
Date: Thu, 24 Sep 2026 17:58:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
 <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> On Tue, Sep 22, 2026 at 6:24 PM Juha-Matti Tilli
> <juha-matti.tilli@iki.fi> wrote:
> >
> > On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > +
> > > > +/* The offset is chosen carefully to not collide with the node ids allocated by
> > > > + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> > > This assumption does not hold up for QRTR V1 headers where the node ids are 32bit.
> > > QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely larger than
> > > 0xFFFF.> + */
> >
> > Does that mean we have to go back to my endpoint id patchset?  It's an
> > option, but a quite complex one.
> I'm not sure. Last time I tested the endpoint ID series was its v5 and it was
> functionally acceptable, and other than switching to sendmsg(2) instead of
> send(2) and sendto(2), it did not require much changing on the user-space
> side. But as you mentioned, it was/is complex compared to this one.
> >
> > However, what is the likelihood that serial number would clash with
> > these host node id values? Maybe just adjusting the comment could be
> > acceptable.
> The chance of collision is slim, but still not impossible.

When you mean collision, do you mean node id collision due to bridged nodes?
Because, even if the directly connected QAIC devices use 32bit node ids, the
collision won't affect the functionality.

Also, there is a collision with SMD and TUN endpoints, but that's out of scope
for this series.

> I think a solution would be to treat qrtr_host_node_id(idx) as the
> preferred id, not
> the one that will actually be assigned to the node. And before
> assigning the nid,
> we check it against the radix tree, and if it exists, we try to probe
> the next available
> id (so an IDA). This will also require exposing the nid to the user in
> sysfs (i.e. /sys/bus/mhi/devices/mhix/mhix_IPCR/nid).
> 

I guess the QAIC userspace tooling needs the allocated node id. This can be
added.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

