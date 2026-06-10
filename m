Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9B0CD98C7
	for <ath12k@archiver.kernel.org>; Wed, 10 Jun 2026 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVy2JmiDScr+o6xC3nZ1IUbCbzhQKrbZ7/aFWDNXxFI=; b=UuNdDCBGXmSDm4x4KLYAMhSsJS
	Ukfusk24yzZ+60mA78EP8MPCiOSxy3J1Z96PksdAZwvzlFSGVtbwv7ZcyJFnimqbKPbHrooipebZY
	eLemc30ipx2+fr5Y0rQrts5J7QnyzigkwjlhT/5ts7k1AyD4MIqW0HSfCp5H5Y+t7cb8hxg0hP7x0
	gC6/UcWIh1zmO46F/aHzdZcUI5KOQJ5uD/NATw717TjHk/xACK7yN4WHa+BbyI6qi10XNXICFBVam
	L6h96PF0zu+e4SYn1C6cok5PoeQKwhfuxgel0BCl5MxlkmJLFx50eC11I4BkUfUcsDBlsvoBwkJnl
	bnkCQ3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXOOd-00000008GOd-3LFm;
	Wed, 10 Jun 2026 19:15:27 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXOOZ-00000008GNv-3Qqo;
	Wed, 10 Jun 2026 19:15:25 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id F053B1D00018;
	Wed, 10 Jun 2026 15:15:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 10 Jun 2026 15:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781118919;
	 x=1781205319; bh=CVy2JmiDScr+o6xC3nZ1IUbCbzhQKrbZ7/aFWDNXxFI=; b=
	Gm/6IVI91Zc/JG+ombwZiuLgrzMLHSXnGDVtABxnArwqn2nqlpSpTvBsKRbNZGZG
	Yz/ja+ig/TO+rmJ7JJKBhfrYFtaC4ofneMI/yvB+3z6b7nLbDhR9pa3AI1KZjSvU
	yHWaCewWvPZd/PQ+bC7xujhGabuonupj8JpJZ3IrAcjuStlMYugUgBztyNmgKzFr
	TJBwTt8ysks0dPxvaJjh5xnH8NfINUmYuAfQCZtrsaK1HOLHIZANBmDoefmVh4xS
	Jo/3KiDTZGOD3WSrjQXvdISj7PuqGhvLZ412yVN71GF+sC9KULPppXj0VEUJlWfU
	RUEsSH27bYhJ3Q7yCwC7gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781118919; x=
	1781205319; bh=CVy2JmiDScr+o6xC3nZ1IUbCbzhQKrbZ7/aFWDNXxFI=; b=I
	ifd/wVMXad4h+Q+pRYOcuwKq6qlgm69ZyqmzpfHc8XBIyRrZnoM126Mgw0yX7M2D
	o6x4oLZCROgqXnweQETTEI8aTcIw+cM3sRsbiAKVpqLdomJX9AO+BfHL2oFfhubP
	o1LMx18aELOdNp+AVitRcFFSz/OwQ8yszvQkOdy/qiwaB68kfHiPOin9hjl61CI6
	86SkAjx0fQj3AfsuSGB+kML6strk6b9lWoPfIwLYqUxzkkna+ULOg4qX1ItJ5ZPm
	sjoUSAvhZrLh7MQFh8WcAJ4cAcxXnOOgaxXr6ZzQJVQXH0Cc3N3cIyiNbCbljMcz
	TOwoN5IB4al4NaR+1GlDQ==
X-ME-Sender: <xms:x7cpamCjkfFGc9EmOEpD1kZA2NiP17hjQi2ySPsgHCH07BYpNWy-ow>
    <xme:x7cpaoqhSbuWQdfGZwxOepqVETldXraIVB9YZFn9wsrHYTXYgIKBtfrvnWjx9XIxO
    jXLN8jx5GPfkGpgUCOuh764eVuhSCbzkZJttjAHO7WT1B5dSvCsSg>
X-ME-Received: <xmr:x7cpapHRTEY3MuiFHABxYzE1iPN5V0pIXddzqakdFvMwXFjlok0bECPPhDY>
X-ME-Proxy-Cause: dmFkZTENsJBpTOZ6YX/UOOE51y07s8b8SVjd2U/sBvvG7WPM7QaG22AiPLgsvtwA9p430B
    CnyEyxsm53+lIa6P5muTNjBXD+k9Z0UKK24ENec4OWuaR2h6Gn82lHTTfWSwkTT0tPhJuq
    ePnbvDc2uHk3EE/CYJwaWAqhqruRcaf3AljRIz9dOjW8IiRfzXdwjXVOnUelFUBRldRAWc
    KG+E6MQwx4gzKpzX5cFwfw0C0WFNel+9bPdNpXfAqlkfk/jbeK9Gp4vy4wcwjHhFsgx2BL
    r6c+YYwN+dNSmt5vAENm7R37LycxdRcYO0TJnwoMRyAdHY1cyDYZKN6I4obp+/ZUKD9BoQ
    1OWbIEI5qNFY7/J8J/wCRGPCa/RHaO3N6uzzYmULgc9qZEbB2R8N/PMp9CEEere4niCwbR
    DJNQ3Tx7bQ0wyvewZVWlkSVvS8I1JajyqV7MDE3S8f1HtwrtA5IiMzri12xaU44bebLJNT
    sasMe59kizUEJHRDyMaNtk4k8pBfAYZ76odlyuszWW1sybZJPd84gAVgacXA9OGYjhU6Xc
    bZ9PSl5+D48NmOP3fKV/7c/kGfd7x/ifeWosHGrmtqmeLpWOoxD2Bf5LIDM9ZsnOAJTTSo
    mkNG3lH07rPbW73TpBRdz7TFZV53XkhVbHGDH973/iJ2DH5Lb0SgO/93cj5Q
X-ME-Proxy: <xmx:x7cpakv_EzW2UhkEPqeCuRflpFC4KwX4RYwM0SGZCDg8ORUx-NIWiQ>
    <xmx:x7cpanY29XA5mgNAkPsye3SRd8X_i2KK6UGGkUt5-kIJxaU5obH9Iw>
    <xmx:x7cpas7Ti1UEGl3FAXtavMumA4H0rQiULnFaDPzPqDY7A9yHWuXqMQ>
    <xmx:x7cpan9NpovVd1qoDNWqY9sJAkiF_2npBovgtxchW6iKBpjUxy6jyg>
    <xmx:x7cpanskE_RjhJVMhfjRSLMFqDbr2qNNaYZbwMMkBZZhnuAzWSi3-jrU>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 15:15:18 -0400 (EDT)
Date: Wed, 10 Jun 2026 13:15:17 -0600
From: Alex Williamson <alex@shazbot.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 bhelgaas@google.com, jjohnson@kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, mani@kernel.org,
 mhi@lists.linux.dev, alex@shazbot.org
Subject: Re: [PATCH v8 2/3] PCI: Add device-specific reset for Qualcomm
 devices
Message-ID: <20260610131517.6d7bd63a@shazbot.org>
In-Reply-To: <20260610100059.19235-1-jtornosm@redhat.com>
References: <20260609115352.32acb6fe@shazbot.org>
	<20260610100059.19235-1-jtornosm@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_121524_521284_6B96079B 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, 10 Jun 2026 12:00:59 +0200
Jose Ignacio Tornos Martinez <jtornosm@redhat.com> wrote:

> Hi Alex,
> 
> > My only complaint is that this is positioned a bit generically...  
> Ok, I'll make the comment of the function more specific for these Qualcomm
> devices.
>   
> > Has each of these devices been tested on a platform where D3cold is
> > actually achieved through this method?  
> No, I don't have access to platforms with _PR3 support. All testing was on
> M.2 adapters (D3hot fallback only). Since D3hot works reliably and D3cold
> is a stronger reset mechanism, the approach should work - but I cannot
> confirm the D3cold path through testing.

This seems to suggest that the D3cold reset method is also untested...
I'd suggest dropping the D3cold throughout, unless you can get someone
to volunteer to test it.  It seems like you really just want this quirk
to do a D3hot regardless of NoSoftRst+ with a select set of devices
where it appears to do more than nothing, where doing nothing is
effectively what's left after the other reset methods are being quirked
off for being worse than nothing.  Thanks,

Alex

