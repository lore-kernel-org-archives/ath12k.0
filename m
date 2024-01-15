Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E73C3DA79
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcKkT4fAORDkszvd1b+2x2512Z1/t3hFQekm2FK0TL4=; b=dlJnf3JXVzb5JrlWC1SGGlYsis
	Ret2EUeOWPhezQQpdoLqbdWb9PXB10FroHQSudZZ90Pxm4PVOSI8V7zUGR6xJ0TklkjLIEdEDDxVY
	gapSmFCXnUNPhP3AzNgrLMkhOZzjlg4GCSdsMPa/CrjMUwK6WZkmqCEL5tiYnLMCSJrbve2iaG0En
	7P6+M0+c2KeQRCxXoQavahtXAXbsWhCL7MYgafK6A8qqHv95+3B3gkq0wuSfzSWvYbLiuRD14CAIC
	bLqpEORJsLqRKgwH6Z6r0Jgs2+2wrwVYTXlhM3dvWhwdM5jtwenqhERrC3NBS+hVopV3Y7djEV88z
	XbbD0fRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP6C-009S4V-0I
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 15:42:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP68-009S2m-0t
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 15:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EBDA5B80A4C;
	Mon, 15 Jan 2024 15:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88159C43390;
	Mon, 15 Jan 2024 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705333318;
	bh=K9G1atDFEt7CyyLz6rqv/1ZDMZxiGJZ4BwS+d5OtP84=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nNumTzzgyv12/X6toNlinVCbzDL6EOVw1z+41vT1BVlHJwCbHuIdzabBuiOlrNyxL
	 hYrBqNk6mKlDxByDMubGw/JkhVmiD+xn6m9X8JnU2aiVztdR/1gkLSI357W1sJPIKU
	 79NFiQMdNfGh/p1OYDQlcQaIco2bvlSV6NwfDWkK3YpnoCGX0fTwkRTsUB/kC8hXzZ
	 TwgVtJ2CAmNOdPo5QxtnO/HQaWrl8UGO1V+WtUR5COp713xMSJHInTfxlb4lFF//WQ
	 UnbPHG0iy1+deTFLwfGoIK2gNxOg+8IkN5n2qA7FDgGU50kBLOms6IqS3w8KnOrVtC
	 Xg3lUzsZSd6Hg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath12k: Introduce the container for mac80211 hw
References: <20240109051252.3325106-1-quic_periyasa@quicinc.com>
	<20240109051252.3325106-3-quic_periyasa@quicinc.com>
Date: Mon, 15 Jan 2024 17:41:55 +0200
In-Reply-To: <20240109051252.3325106-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 9 Jan 2024 10:42:52 +0530")
Message-ID: <87mst67ge4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_074200_592700_88F82987 
X-CRM114-Status: GOOD (  12.37  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> To support multi link operation, we need to combine all the link/pdev
> under a single wiphy. This avoids the overhead of synchronization
> across multiple hardware instances in both the cfg80211 and mac80211
> layers. Currently, each link/pdev is registered as separate wiphy,
> tightly coupled with link/pdev/radio (ar) structure. To enable single
> wiphy registration within the chip, we decouple the wiphy data entity from
> the link/pdev/radio (ar) structure and move it under the chip (ab)
> structure with a new data container (ath12k_hw) structure. This approach
> improves scalability for future multi link operation support.
>
> 		mac80211 hw private data structure diagram
> 		------------------------------------------
>
> 	Now						After
>
>  +---------------------+                          +---------------------+
>  |mac80211 hw priv data|                          |mac80211 hw priv data|
>  |                     |                          |                     |
>  |                     |                          |                     |
>  |                     |                          |                     |
>  |                     |                          |   ath12k_hw (ah)    |
>  |                     |                          |                     |
>  |                     |  +------------------->   |                     |
>  |    ath12k (ar)      |                          |   +-------------+   |
>  |                     |                          |   |             |   |
>  |                     |                          |   | ath12k (ar) |   |
>  |                     |                          |   |             |   |
>  |                     |                          |   |             |   |
>  |                     |                          |   +-------------+   |
>  |                     |                          |                     |
>  |                     |                          |                     |
>  +---------------------+                          +---------------------+
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[...]

> @@ -3790,6 +3831,10 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	     new_state == IEEE80211_STA_NOTEXIST))
>  		cancel_work_sync(&arsta->update_wk);
>  
> +	mutex_lock(&ah->conf_mutex);
> +
> +	ar = ath12k_ah_to_ar(ah);
> +
>  	mutex_lock(&ar->conf_mutex);

Do we really need two mutexes? I don't see any analysis about that. And
even if we do, I feel that it should be added in a separate patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

