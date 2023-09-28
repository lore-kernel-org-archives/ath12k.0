Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1DBE732DB
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYrtc437RIyOfxJO2EE1fDXHZEhVOK9HtL9iAItXFUk=; b=a2AhN5Y/xWnZjo
	Qa5KAQeTxttP/o6IENlLrBtHCP2NuHKkyTq6MnbeeWwPG4y7kewtzX7GErf4ZeenZRjvb3BauvC7M
	nV55Eb4zOh29zf0Fzb4P02QVgTy82a6P1Z66wsmlTJUijPsk2Mq2bir9hHKMUe/ALYXoy5js2rCR+
	YTdSdY74itXJ98LdnkbDvdgo8xEcwGmCaUZ/g9yCFXD8OJvuIfUhl2cfWXjSTalKaiMHIuhCl3m6j
	63wKekEms1kmZt1ba2Pphzha+33MXkV8Y/6lscJOsDaxkPEHcY4DZqmlm60IPseOCVGLUAlG+odvm
	j8g5OBZrHxNrYFEo2l/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsUj-0059ln-1L
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:00:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsUd-0059j9-1F
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 14:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BF8CCE1C54;
	Thu, 28 Sep 2023 14:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F19CC433C7;
	Thu, 28 Sep 2023 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913192;
	bh=lpOR4Ou6X0Ukp2Qx3zi/x5F5K/rvMjRB0w5E6unmQdQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GUAF/hFf0ZB6v2o5F5zS+Bg6az69VlGSDwjjobk4Z0pTSplNJOvoE+POSvkElf90n
	 3dRWD+p9nmpvn9n3gGSDACeW3QUL8XNzjghCnqJHGYsL32zqHBzPfbQPU9t9DPM3dv
	 VU5ynJIPWlehGQ/aLXkDmV+cbCogpJJA1BTv5kOV7yEFtX8XDt3/4hW2yncM0uz/HL
	 bq+VcKyUkQRDei4RpkzzNU3n36d6FTDg4VH/KkzZaKPMGYYxYGH4dLR6/eBlg+goJe
	 +YYRGm7IGkkog+Y9GX7dk3bFk40WCM9WgmC/gwpbwRSQst18+Ekl9O0BSHDi+uB/wU
	 yM5g+cUJ4MYwg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: add support for hardware rfkill for
 WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230906110412.182176-1-quic_lingbok@quicinc.com>
References: <20230906110412.182176-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
 <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591318971.3019228.13253796564349878064.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 14:59:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_075955_670186_74726428 
X-CRM114-Status: GOOD (  10.41  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> When hardware rfkill is enabled in the firmware, it will report the
> capability using WMI_SYS_CAP_INFO_RFKILL bit in the WMI_SERVICE_READY event
> to the host. Currently ath12k does not process this service capability. In
> order to support this, update ath12k to check if the capability is enabled,
> if so, send the GPIO information to firmware. When the firmware detects
> hardware rfkill is enabled by the user, it will report it using
> WMI_RFKILL_STATE_CHANGE_EVENTID. When ath12k receive the event, it will set
> the value of rfkill_radio_on based on whether radio_state is equal to
> WMI_RFKILL_RADIO_STATE_ON, then send WMI_PDEV_PARAM_RFKILL_ENABLE to
> firmware.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

004ccbc0dd49 wifi: ath12k: add support for hardware rfkill for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230906110412.182176-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
