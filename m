Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E297ECD1284
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D05jVT04ubtfeqLgxycRb++touGA4MvlypFtOarNi9M=; b=f49fh+pIYih1OUmlrts1erQYLw
	Sv3jUfrdVZj6jMXf6V9n8Xk5icfVLNoSoApY9z6ARPmNYPUSThV6E8kAiszD82dBWGEfd5iSNdoT6
	h2aFrtGBl7a/Mwnq+BLucyLe3z0K3VgybBoxXjSGJio92hBORBlNwRB7NixV4XyvhERTAqSOYEnpY
	Ml0p8yvyDeY6YH2QmM1raNDuZCNEu0ld23elbUNkkBXfT0YKPD6kycgNsq9vXym3053l61+5YR/80
	bNtLZc8WfF8LXpVtCULt2mfO6kQ9xgI7xeC2QbZvsFnxSRWQQe5uyajbmpDpST1BWEaZ3GA4zm2fw
	OUFezMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBGb-000000024a6-2ZvF
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 13:12:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBGY-000000024Za-3sNh
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 13:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1203D61693;
	Tue,  9 Apr 2024 13:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC47C433F1;
	Tue,  9 Apr 2024 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668317;
	bh=yNWKLlKli6iMQOIcwUEwFPXvgyeGHeWbC8FzjyW/3LU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FiLRhJhbFIFEcuDboqD5uLTzyZZvJksybkUP8jsSVs6shIeTbnSGlcVC8arESbl/o
	 gvMbB/yNs6laNrKeovF0szUXq38kuYhkxTY+bSnZ/4fzCpzAzszWKdWozUUtmwgZOO
	 EViqFlBWIB1AaCdSr+2WAkbgpuTSzXpFMvJz3coWoU6JJcA6e9TCt7ZQbEmqYl+c5z
	 qutGF7hLj9jiFTgx/UoLlghOXGJD05QPBWuOUiZWjrhDnd2jaIQDQKEkPa8jqNMVCI
	 EX/kuYGWexsjfbeRYLYosomCZEgryjbPnwXhpveUbguF5HXlcxfkmG+ETtOFd6K6dg
	 JUMpw5O+WkElg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: add display tx and rx bitrate for 11be
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240104032202.19472-1-quic_lingbok@quicinc.com>
References: <20240104032202.19472-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171266831537.3271006.6908994091119638561.kvalo@kernel.org>
Date: Tue,  9 Apr 2024 13:11:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_061159_103937_B99A04DD 
X-CRM114-Status: UNSURE (   7.88  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> When AP is in 11be state, STA's tx/rx bitrate display error value using iw
> dev wlan command.
> 
> In ath12k_dp_tx_update_txcompl() function, not handle the case when
> pkt_type is equal to HAL_TX_RATE_STATS_PKT_TYPE_11BE, so add a else if
> statement to handle this situation.
> 
> In ath12k_dp_rx_h_rate function, not handle the case when pkt_type is equal
> to RX_MSDU_START_PKT_TYPE_11BE, so add a case statement to handle this
> situation.
> 
> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
> tx bitrate: 1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
> rx bitrate: 1441.1 MBit/s 80MHz EHT-MCS 9 EHT-NSS 3 EHT-GI 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Tested-by: Owen Mesh <owen.mesh@gmail.com>

Lingbo asked me to drop this patch.

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240104032202.19472-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


