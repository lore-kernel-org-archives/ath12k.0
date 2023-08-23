Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25957C6FA8F
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wOWGDsrSNas4mWAEzWpCKfuY88osK/YRbt2VZfZpTo=; b=4p8VmJUt8jWfCX
	lFMmwO6oCosmrc14hm2PAsUayASerW2WhGAGHoEjYVwyAo4t50lSu4uDJws75HGP9+5UKFYEXR9Yr
	a6RrZgCQ9ZlXHD0j4Typsi7yU1aata4vSEkiZgnHzlKBl9PsApaHSX5gig7+iK/5smkJ6gAKOXivQ
	hXBHjQkfgYgMK6W76plI1pFXhlFXTuHAtV6GFe3D0/QCRrFPwzK5f4Yxtwpl9Xpe5wRuaxK/E+qI9
	yF+dQCH0J7/Hf8bTC7OCNSFFb+M7BnzKL4IPpELJaD0ks0tnl2tKKfzuO+X3fqxAAF42+qt3mwqq9
	aQzfqYEdd0HL882iwZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsKW-001Hqe-2V
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 18:11:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsKU-001HqG-02
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 18:11:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3298165450;
	Wed, 23 Aug 2023 18:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA70C433C8;
	Wed, 23 Aug 2023 18:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692814300;
	bh=nT7ZQ9rjHf4O6jIk1+HoHbO4AocK4v+azCB1BoCnWzo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dfnXgqyVmjSjtc8txCVK/E1IBDCIGZbOBk7d/lUQW82KQEO8lyThkoLos2bShYx8V
	 xHJT3N6WXdCKehHhNjK1iOzw37sDyJPCY7Sw1gIn9pI1wXej2mbHIwvmlAkPZnxhgN
	 zYfuKOBXkMJ/PJZ9+nZEkmHzn/G53X0UrSDoDxzgTyXuX7iDZK+sElLz3Cdz6DA3kl
	 QQcItw5aQpSNCO7sDhqEOf7TQWxEQ49viGfot52mT7kdBlmPuu513stbxgZNUu9sSG
	 qNiuCodGmvF6+KWYyBsoszZXNVE2iK3bmxp5DuSqBKIADASItKMj+Wm3s63jZE8vcY
	 5IZKqzUU7DWEA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band in
 EHT
 PHY capbility for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230809100124.14732-1-quic_wgong@quicinc.com>
References: <20230809100124.14732-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169281429747.1470109.16590001848593498133.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 18:11:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_111142_111186_3DBE80DE 
X-CRM114-Status: UNSURE (   9.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> 320 MHz bandwidth is reported only for single PHY mode for WCN7850, get it
> from WMI_HOST_HW_MODE_SINGLE ath12k_wmi_caps_ext_params and report it for
> 6 GHz band.
> 
> After this patch, "iw list" show 320MHz support for WCN7850:
> EHT Iftypes: managed
>         EHT PHY Capabilities: (0xe26f090010768800):
>                 320MHz in 6GHz Supported
>         EHT bw=320 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
>         EHT bw=320 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
>         EHT bw=320 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Fails to compile:

drivers/net/wireless/ath/ath12k/wmi.c: In function 'ath12k_wmi_tlv_mac_phy_caps_ext_parse':
drivers/net/wireless/ath/ath12k/wmi.c:4199:48: error: 'const struct ath12k_wmi_caps_ext_params' has no member named 'eht_cap_phy_info_5G'; did you mean 'eht_cap_phy_info_5ghz'?
 4199 |                         support_320mhz = caps->eht_cap_phy_info_5G[0] &
      |                                                ^~~~~~~~~~~~~~~~~~~
      |                                                eht_cap_phy_info_5ghz
make[7]: *** [scripts/Makefile.build:243: drivers/net/wireless/ath/ath12k/wmi.o] Error 1
make[6]: *** [scripts/Makefile.build:480: drivers/net/wireless/ath/ath12k] Error 2
make[5]: *** [scripts/Makefile.build:480: drivers/net/wireless/ath] Error 2
make[4]: *** [scripts/Makefile.build:480: drivers/net/wireless] Error 2
make[3]: *** [scripts/Makefile.build:480: drivers/net] Error 2
make[2]: *** [scripts/Makefile.build:480: drivers] Error 2
make[1]: *** [/home/kvalo/projects/atheros/ath10k/src/ath/Makefile:2032: .] Error 2
make: *** [Makefile:234: __sub-make] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230809100124.14732-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
