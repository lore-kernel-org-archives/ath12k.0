Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C6DC2D0CD
	for <ath12k@archiver.kernel.org>; Thu, 15 May 2025 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo2iRKVm1IIkM8VCXT+97aSCM+vMFIU8Nd4I7xZhjAU=; b=ELLgkCNKN2EkIfK3Anqf81wJTW
	D0+zsYebK2FrBU55JDw/SVZmdC0zcjXSxYu/muzMWc/+dWyCISRLE1l4KyqW3g8xpFNJ1LgGATKCC
	edxguKYibv5wat2oTsiMpTfsXTf7hlPRI4M0WcqdVESqfYcRZxYb4kMOv4Ob2IAFK6zctv0axgLMo
	FjrYPIhr64bpRLKehvRabhV4g0Lv2xGPB+xRuNzP8dTGM4bjK2UAZy6w7HrJgrub+9hPjPn9Qd3p4
	H2ieOzg+OscbPxUWg+pTs//kNYSlhFlpqAKIQPjTtLnNcp3hIsFU9CbnVXtY4i0PlhLRBgvjvwWKk
	tfge6v7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZhy-00000000u9K-3NZr;
	Thu, 15 May 2025 14:37:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZUP-00000000sBl-1Qyo
	for ath12k@lists.infradead.org;
	Thu, 15 May 2025 14:23:15 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9E60721ECB;
	Thu, 15 May 2025 16:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747318989;
	bh=oo2iRKVm1IIkM8VCXT+97aSCM+vMFIU8Nd4I7xZhjAU=; h=From:To:Subject;
	b=Cy9SzCiHcYS43AI/FCDXrrMGHoaPKOjyrxQro4WtKGis49v1Krd3oAjf5e9/yEwhh
	 AHpFhDgsj48O/fBL8Jz2IIOUxiJtBk6yXiJpno/dZilngABD+KapRKDMg6jGJE9IIl
	 Xi7VLtI7auvO/D/k4XJt/GmMawNCgtuo5KBujL4G4W1E8OjB9JFh6IchkOkQAZDcrD
	 ks3SMcEek5AMOKcJZXODKpNGw7LJ1PDAdLGvOHjLLFUtiwsq5wy5LnCurA1FiIq1F0
	 P+xNBqP7ea/Qd7ZkHLEvRuOb8hdtEddVhP5Aj+KsE8lkFFSdYzqb33P59pLBSk0XHZ
	 XgDpr1Cp5QB2Q==
Date: Thu, 15 May 2025 16:23:05 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Parth Panchoil <parth105105@gmail.com>,
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
Message-ID: <20250515142305.GA74294@francesco-nb>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
 <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
 <28b5436a-556b-4b0e-a66c-eec453f4f5b8@quicinc.com>
 <6aa877c8-322d-44eb-a8ca-5d00ffa63d8f@quicinc.com>
 <479bd0f6ef7fbb5f0e0d0d8f71a804002e6b5f6b.camel@gmail.com>
 <6ee296a1-1cb9-4187-9c74-222bea54843b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ee296a1-1cb9-4187-9c74-222bea54843b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_072313_972431_5E700970 
X-CRM114-Status: GOOD (  12.78  )
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

Hello,

On Tue, May 06, 2025 at 01:56:11PM +0800, Baochen Qiang wrote:
> On 4/30/2025 8:50 PM, Parth Panchoil wrote:
> > On Wed, 2025-02-19 at 18:18 +0800, Baochen Qiang wrote:
> >> On 2/5/2025 10:20 AM, Baochen Qiang wrote:
> >>> On 1/27/2025 10:01 PM, Parth Panchoil wrote:
> >>>> I am currently debugging the ath12k_pci_enable_ltssm start up
> >>>> crash/bug
> >>>> with the mainline kernel on my system and would like to share my
> >>>> observations so far:
> >>>>
> >>>> The ath12k mainline driver gets stuck at this specific line: 
> >>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L295
> >>>> in the ath12k_pci_enable_ltssm  which attempts to read
> >>>> GCC_GCC_PCIE_HOT_RST, particularly
> >>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L1209

...

> >>
> >> -#define GCC_GCC_PCIE_HOT_RST                   0x1e38338
> >> +#define GCC_GCC_PCIE_HOT_RST                   0x1e40304

...

> 
> GCC_GCC_PCIE_HOT_RST is wrongly defined, normally this should not cause any critical
> issue, because IMO the RC is expected to return 0xffffffff when accessing a non-exist
> register. However in your case kernel crashes, so seems RC does not behave well, maybe not
> following spec?
> 
> anyway I will submit a patch to fix it.

Any update on this? I can easily submit a patch myself, just let me
know. Because of this bug we have a crash that is preventing us to use
the device.

Francesco


