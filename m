Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DDFC001DF
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 16:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVxtBBMypwJrlMaA/UajmUf5h1UjEOvfhcW7JKXGf/U=; b=lDoIvYEPG2swQR
	g521GDBAMJ5Ia7QWqQKqZNon4g+g/NMKh+tvAXlVlXeIBPLD66TiRDeR0WsWhEJFVKWmA8waHcC9Z
	Trq+lPvU/2xtkPAOFxGM7XPKyawNk0ne/0Rtq0wOWmpMdDwb6Z7rUtLDRCQpMbROAQZnTJGlCbr45
	aWeDPzddkCQvVKfdlhz1svvydVnMaVLus0bXc+9DJxIJuT1guXr0Qww0ftNZMBewXGTiyvGtJEpmW
	Gn6oxIJQm+2V4eXr2DQDd4LG9gdBBra8zh7B9dWO5jsA8rp+1wK8nfq+QuFWWC1OkvGDGWvW7otIH
	cZaAmjwPFqjzKRRQCvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFAp-005Qj0-15
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 16:58:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFAl-005Qhq-2g
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 16:58:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22AD5615D2;
	Wed,  2 Aug 2023 16:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A81C433C8;
	Wed,  2 Aug 2023 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995486;
	bh=tDMJ1+pHyzwwwR9rnXV5McJ0yCrErYjLjZesacbe4Zg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=hxg2lrFRjHjv8wAlZgyfbtmVYmRq9tHFWULhicYvlJVOOvLR2UnXBLoTXPiel/xAO
	 Ji+4KlBta2TYhOz1YRhMVJQ2gn2h9F5jZa7U2mwYa8fx6ire1NSN9n2NL+n948nwNj
	 FAFoOgLfBrUpZ1MLA9zNLG3g1ZH5at6Fqc/7J5qspKI9s3nkwFzlqpZTQT643IFA7E
	 6auMyT79ZgmshlDBCGgCdVxrVAfZQATtb3YQgo3fyR7D10XeejO8NlFwdf60hKIu70
	 QregPSmqwlKH0qh7BUcn0QvFQxO8XOkswrGlBISrEd159cyE5WFXc5YFNta18rzwvO
	 R8bn2JfZEezUg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: avoid array overflow of hw mode for
 preferred_hw_mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230714072405.28705-1-quic_wgong@quicinc.com>
References: <20230714072405.28705-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099548389.463701.90643016319296272.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 16:58:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095807_931298_8D3B726B 
X-CRM114-Status: GOOD (  12.47  )
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

> Currently ath12k define WMI_HOST_HW_MODE_DBS_OR_SBS=5 as max hw mode
> for enum wmi_host_hw_mode_config_type, it is also same for the array
> ath12k_hw_mode_pri_map.
> 
> When tested with new version firmware/board data which support new
> hw mode eMLSR mode with hw mode value 8, it leads overflow usage for
> array ath12k_hw_mode_pri_map in function ath12k_wmi_hw_mode_caps(),
> and then lead preferred_hw_mode changed to 8, and finally function
> ath12k_pull_mac_phy_cap_svc_ready_ext() select the capability of hw
> mode 8, but the capability of eMLSR mode report from firmware does
> not support 2.4 GHz band for WCN7850, so finally 2.4 GHz band is
> disabled.
> 
> Skip the hw mode which exceeds WMI_HOST_HW_MODE_MAX in function
> ath12k_wmi_hw_mode_caps() helps to avoid array overflow, then the 2.4
> GHz band will not be disabled.
> 
> This is to keep compatibility with newer version firmware/board data
> files, this change is still needed after ath12k add eMLSR hw mode 8 in
> array ath12k_hw_mode_pri_map and enum wmi_host_hw_mode_config_type,
> because more hw mode maybe added in next firmware/board data version
> e.g hw mode 9, then it will also lead new array overflow without this
> change.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1e9b1363e2de wifi: ath12k: avoid array overflow of hw mode for preferred_hw_mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230714072405.28705-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
