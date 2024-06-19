Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B5C27C53
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F2g3VSAVfou68zwhEuOCaOAWzqSxBIHwLmbZ6lyAew=; b=QHovERJ9qtMEy2dL7C0r32pPYa
	zRHZ99lYITkmS5XzZWcBwqvUdxp6NawmJ/iSn9rqfe56quGW3bNYDL+Ad1PR5UvwwcL7wvFOlHXQY
	WUa0LxSRd09WNzBVQX77nDGbuK3/GiMKzWJwwZuCg0RTVeUUivc4+GwPAsSIIGccpmIfU8k1+M9pn
	gLp2rmIFjLt4ANwMukIhSUEUhrC6pGFPCbmw+GAySCvaWE0gid4JI5lMLCvLcLA7YvvGpksKaXIAY
	0hAInlWRAMObOnxK9mwj8iI5ayKUpmsgMSIpBKIx9AOOV1Vt7W5Nzs6toM42JxPTogyBCnTG5ueKK
	W+FxMW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzDY-00000002F4C-1BhH
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 17:35:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzDV-00000002F3k-2Psb
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 17:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6D1C61EAE;
	Wed, 19 Jun 2024 17:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C450C2BBFC;
	Wed, 19 Jun 2024 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818528;
	bh=oze187ZZReIDVRa21rN3O6QaiO6jCdWekl7qUIOJ+ws=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=R841AzNda+0OiAiOCj8ICcGtg4DhRHALd7bUSi34XLhWH/79TQdCJyfiBTRWUBSLw
	 F63ni/qFgJUdEJvvCsFZOXlp80nqGuYe1tcleFHi3hdRksE9qDlXrlvIY/H7BziZUm
	 ECyUyEAY/H2xhQYcWWlo+MZ9mOORjVooylyMl1PTHE2XqV62APnqs7vGhkcbcTEIAP
	 LDdyTyomUmKUBMibXxtT+S0Qc40qm5Ee4FlRFwMWm04j6B7ysKC5ALxUtyjNkTYaKb
	 hAWz+yvWPtyw19QYdBJuSnRJeDg7cG9AS3R4CWk7Sg4rbuAcoPsfzwkFnaiwjUEwwN
	 A6AcD3Qb+nWOg==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Lingbo
 Kong <quic_lingbok@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single
 phy devices
References: <20240611043342.2672998-1-quic_rgnanase@quicinc.com>
Date: Wed, 19 Jun 2024 20:35:25 +0300
In-Reply-To: <20240611043342.2672998-1-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Tue, 11 Jun 2024 10:03:42 +0530")
Message-ID: <87zfrgkf8i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_103529_778457_0EFF214F 
X-CRM114-Status: GOOD (  16.80  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> From: Lingbo Kong <quic_lingbok@quicinc.com>
>
> Pdev id from mac phy capabilities will be sent as a part of
> HTT/WMI command to firmware. This causes issue with single pdev
> devices where firmware does not respond to the WMI/HTT request
> sent from host.
>
> For single pdev devices firmware expects pdev id as 1 for 5 GHz/6 GHz
> phy and 2 for 2 GHz band. Add wrapper ath12k_mac_get_target_pdev_id()
> to help fetch right pdev for single pdev devices.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

[...]

> +static bool ath12k_mac_band_match(enum nl80211_band band1, enum WMI_HOST_WLAN_BAND band2)
> +{
> +	return (((band1 == NL80211_BAND_2GHZ) && (band2 & WMI_HOST_WLAN_2G_CAP)) ||
> +		(((band1 == NL80211_BAND_5GHZ) || (band1 == NL80211_BAND_6GHZ)) &&
> +		   (band2 & WMI_HOST_WLAN_5G_CAP)));
> +}

This is not really pleasent to read. What about something like this:

switch (band1) {
case NL80211_BAND_2GHZ:
        if (band2 & WMI_HOST_WLAN_2G_CAP)
                return true;

        break;
case NL80211_BAND_5GHZ:
case NL80211_BAND_6GHZ:
        if (band2 & WMI_HOST_WLAN_5G_CAP)
                return true;

        break;
}

return false;

Or any other ideas?

> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar)
> +{
> +	struct ath12k_vif *arvif;
> +	struct ath12k_base *ab = ar->ab;
> +
> +	if (!ab->hw_params->single_pdev_only)
> +		return ar->pdev->pdev_id;
> +
> +	arvif = ath12k_mac_get_vif_up(ar);
> +
> +	if (arvif)
> +		return ath12k_mac_get_target_pdev_id_from_vif(arvif);
> +	else
> +		return ar->ab->fw_pdev[0].pdev_id;
> +}

I find this easier to read:

arvif = ath12k_mac_get_vif_up(ar);
if (!arvif)
	return ar->ab->fw_pdev[0].pdev_id;

return ath12k_mac_get_target_pdev_id_from_vif(arvif);

But I still would prefer to have some a code comment explaining the idea
behind here, especially why it's safe to use fw_pdev[0].pdev_id directly
and what scenario that is.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

