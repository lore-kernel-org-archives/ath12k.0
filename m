Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67728C52D6F
	for <ath12k@archiver.kernel.org>; Wed,  7 Aug 2024 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOfamGn0P+UIpsbiPJZIqn2KtJqafTj8S41RiVGkPUY=; b=khwxIFLeGejHELNGFVCNteMY/A
	EfaaF8JUeIFnrkcqzGPgT61w/TtOeHhm4TqLlaCPeiUlCO4iGbuLlZheXMKIgmKLkHh/9MeL6p4Gy
	bokAZE+Qe5iDmY4/lF/0PFnHzY/TKk18xqwVKT6R0Vz+TVcz4doUIdXBPrksnWNKz4qlxKywOSVdI
	U36WNZI3hD82ZLQuMkXJ/fpMpr7LoSbSGMt/6ppcUHO1RYhZ4CJYcyWRnclfKOts48uQWwAuqasv0
	fFpGRT1h145A/srZ+a10ivQIe3fSi8tgGErlHIkcuMA62LsnGnVRfLrCyup5nkmT6rGYRPzFCTsbM
	XfqiuRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbma-00000004JwW-4AGT
	for ath12k@archiver.kernel.org;
	Wed, 07 Aug 2024 08:12:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbmY-00000004Jw6-06Zo
	for ath12k@lists.infradead.org;
	Wed, 07 Aug 2024 08:12:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41D596115E;
	Wed,  7 Aug 2024 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D27C32782;
	Wed,  7 Aug 2024 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723018349;
	bh=z4jy2OldyQ2272u65CGvY4b6tkV3J9CS4dsiIX6ncog=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=XmhdBrco0MnGDmCc8JvBF19yHCzan136xatlPgqlzMktKWkksGfwXriuWfV43z6RV
	 IcSbYC9tnIp12gu0xTFoQsTwtnk6jWcr3qip2JxJMFxleJupw0nQmO+JGfBM+eyqWZ
	 RsiLseKxn/wiDr1Un/Vo0Pav14NcPM9O1uRVPZ+lTCDq6CoSfT7PgfGOylcjQ+h1G4
	 nYuAY0fcaryx7PvHIg4JGDyKH07ln73j2yq5pHG7dVLPxWzj6XdW9owbcYKhUjyGAx
	 1I386TqCS6h5X8E4g2A8hQNrqa5ZhdoTslFbYkG/Djov6PK7+toT7dcL62+3yi1uK0
	 cCKyAiOt8/T9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: fix BSS chan info request WMI command
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240331183232.2158756-2-quic_kathirve@quicinc.com>
References: <20240331183232.2158756-2-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172301834629.3837211.1799134700273766054.kvalo@kernel.org>
Date: Wed,  7 Aug 2024 08:12:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_011230_139412_1230C28A 
X-CRM114-Status: UNSURE (   7.64  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> Currently, the firmware returns incorrect pdev_id information in
> WMI_PDEV_BSS_CHAN_INFO_EVENTID, leading to incorrect filling of
> the pdev's survey information.
> 
> To prevent this issue, when requesting BSS channel information
> through WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID, firmware expects
> pdev_id as one of the arguments in this WMI command.
> 
> Add pdev_id to the struct wmi_pdev_bss_chan_info_req_cmd and fill it
> during ath12k_wmi_pdev_bss_chan_info_request(). This resolves the
> issue of sending the correct pdev_id in WMI_PDEV_BSS_CHAN_INFO_EVENTID.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

59529c982f85 wifi: ath12k: fix BSS chan info request WMI command
dd98d54db29f wifi: ath12k: match WMI BSS chan info structure with firmware definition

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240331183232.2158756-2-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


