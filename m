Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B44C47DA9
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++g/B4Fx0mJBm46AsuM6dvIUIe+XR5Xv7gCXODDT5W4=; b=a4C1VhDWspQ+vkhs1lSLy8Oxj8
	BVCwIZEk2KFXotXJAKzUU11KRT0Xf5MkWd3RV4w2d5OxuQm3LhtfiMNYH6ae81Np3p1YnQc9pP1+2
	5OxGvKiso+dVY75ZLrsFKYwwLhmjTAcOJH4NuIiEVbkN+8Rh6v0Um9Q6Kjewbw+b5TagjRUuArkoz
	r/izBLhLb54u6UyGk9HuG54lIer68ITWHYogpq0j9unbchjTgSUYaCv4A+lwhRmgad7DBerZVKmNF
	qrmjwoaDl21lfVf4sa9+2OL+vNgqJ56Xi22qCiRdT39XKGU6MA2+0nvTarPSVInTbYOnAVTBGx6oU
	gx5ywyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURJc-0000000Cl6t-123R
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 13:04:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURJZ-0000000Cl55-1QvJ
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 13:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B41ABCE10D6;
	Mon, 29 Jan 2024 13:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6456FC433C7;
	Mon, 29 Jan 2024 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706533479;
	bh=6MQzYvdPPLMRUnzpMLuFCWicQsE1R3xKrZuA7OvwvXc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tQydaG271NVpYHrjd3xpsisoxs7jYP0PeW15/QOsDO/+njCQ2CrHu5QHtCnbwwm1u
	 SwDcoJj8+O4rhEvVKOat+opCTsM/KKckIL4UHIiiqe2df285mjMu/i5Fys2BNSt1jK
	 gBUAp5Eoon/fmaneHu2T08OqzX6wBGx1wDgAS24tSHd9gjU+znl2OFVkQGkE+vO7xw
	 a5nd/rPUPJdT+LiLEGCbApGFBIe0+UdZW8DvBfsap0f/BWvjERPXPiOJFnnGSHRuIe
	 9lzIVBrfMMOAdPeQl+OIQdAjqhS7faK18S/bbJu90BB74PhXQljhtJQbrGy6l7B1tc
	 bODly2qBGIk1Q==
From: Kalle Valo <kvalo@kernel.org>
To: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Cc: ath12k@lists.infradead.org
Subject: Re: qcn9274 hw2.0 in banana pi r64 - LTSSM read fail
References: <CAFED-jma7ZB17Rcgx9H+eVZ=N6Pty4__gz3B+O2V34XtcEzOGg@mail.gmail.com>
Date: Mon, 29 Jan 2024 15:04:36 +0200
In-Reply-To: <CAFED-jma7ZB17Rcgx9H+eVZ=N6Pty4__gz3B+O2V34XtcEzOGg@mail.gmail.com>
	(Janusz Dziedzic's message of "Mon, 29 Jan 2024 12:34:51 +0100")
Message-ID: <87o7d4wasb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_050441_602522_2A5B818E 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

Janusz Dziedzic <janusz.dziedzic@gmail.com> writes:

> I have this card in bpi-r64 board. Need to hash: ath12k_pci_enable_ltssm()
> While board hang here (next board restart):
>
> val = ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM);
>
> Is it a 12k bug/MTK pci controller bug?
> When hash it works correctly.
>
> root@OpenWrt:~# lspci -nn
> 00:00.0 PCI bridge [0604]: MEDIATEK Corp. Device [14c3:3258]
> 01:00.0 Network controller [0280]: Qualcomm Device [17cb:1109] (rev 01)
> root@OpenWrt:~#

Sorry, I'm not following you. What do you exactly mean with "hash it"?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

