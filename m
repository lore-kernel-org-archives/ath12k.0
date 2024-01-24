Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F543C46CD2
	for <ath12k@archiver.kernel.org>; Wed, 24 Jan 2024 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzNZFg1zg4ysvnEBv9FncBYUtKENhaGJARyzdELhfZI=; b=3aVoHw4nCXME6TfUJk7AKOSIrh
	GPmtVIlJ+KKrz1WPDGqdALtCmzdMIevwVmXzlsXXC8tbe8bC0uUoIPZXUFyv6kKO7vibCakKdJ2op
	oZ2u8lCt1VlMj5JCgyS9okEZVsGMcaaKpNoS060KwfeCT70Wp39LVNm6Q0ox2EWajcRB5M/eotF1N
	srZilAluHGJXKFpNNWl0D66r7lw06ia3BGHyByJpxhCvNPz3xebvVbo0QJEg5Y3FZtWH4GX8e2XEc
	nhOS8XBVxeBx5ClKr7fyNt/S/vD3hpTquVbiyDJyLFs/Wee/e8v25Qy3Ge32KlwQL3IyGnM5Yx8GP
	sxbpuabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSaJZ-002T0A-1h
	for ath12k@archiver.kernel.org;
	Wed, 24 Jan 2024 10:17:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSaJW-002Syq-1o
	for ath12k@lists.infradead.org;
	Wed, 24 Jan 2024 10:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE996CE3113;
	Wed, 24 Jan 2024 10:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D405C433F1;
	Wed, 24 Jan 2024 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706091413;
	bh=NLdkkXoTiIMolocfXm6PVQHmv3SB01JgzPmD0mLfXN4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Mn2/xZ51ozbd77hsmxQAinFOoollD7b3iJVKPkEzPvO3/9oHyHJP733Ls/nJoX1pF
	 MtJs2IevlOkOu7ds7GQMSRPjExzrZWjqF12Et+7QP31VUuGcUjzeT1hOLS9VTSuUk3
	 nsQABS6+1RrN+RPIU/ynQ3AdM7kz19D514y4M3fFgm32uy64O3YU3C945EG7KWr78w
	 thhZGqTJp13TojQIVU8ArlIHl94MlCty1/c3YPui95oEB67gNh3fWl/vgknVVeiT4I
	 swV3FZ7B9egnjQB/JoCaolXhvGJExypyLdm5PUzlzbMEZESKXLpSJqi3mIN6uJhi8v
	 dN3MyrCKc1fMw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Fix issues in channel list update
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240117062628.8260-1-quic_srirrama@quicinc.com>
References: <20240117062628.8260-1-quic_srirrama@quicinc.com>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170609140987.4105728.14737574219710540443.kvalo@kernel.org>
Date: Wed, 24 Jan 2024 10:16:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_021658_790119_36DC6490 
X-CRM114-Status: GOOD (  17.06  )
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

Sriram R <quic_srirrama@quicinc.com> wrote:

> Currently, the logic used to select the 6 GHz band is incorrect,
> which may cause 6 GHz supported channels to not be updated properly.
> This is because the 6 GHz Max frequency supported by the driver is
> being compared to the Max frequency supported on the board. If in
> some cases, the 6 GHz Max frequency supported on the board is less
> than the defined 6 GHz Max frequency, all 6 GHz channels are disabled.
> To address this, compare the max frequency supported by the board to
> the defined 6 GHz Minimum frequency by the driver.
> 
> Similarly, when a dual mac card supports both 6 GHz and 5 GHz radios,
> if the 5 GHz radio gets enumerated first before 6 GHz, the checks in
> ath12k_mac_setup_channels_rates() can cause the 5 GHz channels which
> were enabled earlier to get disabled when the 6 GHz channel list is
> updated. This is because the Min 6 GHz frequency defined in the driver
> is 5945 MHz, which should be 5925 MHz since channel 2 is not considered
> currently, but the firmware can pass 5925 MHz as the minimum.
> Hence, update the Min frequency supported by the driver to 5925 MHz.
> 
> In addition, ensure that the channel list update to firmware updates
> only the channels that the current radio (ar) supports rather than
> considering the wiphy support. This would be required when multiple pdevs
> are supported in a wiphy and they support different ranges of frequencies
> or bands as in single wiphy support.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

67a48d937fac wifi: ath12k: Fix issues in channel list update

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240117062628.8260-1-quic_srirrama@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


