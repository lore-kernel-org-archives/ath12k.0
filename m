Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F50C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beQhNAyDqpLiLcLBumDRsxPLVTh7smTNSjpSf4QrSCA=; b=bA4alCdKmGinFtXMPBz95ypdeT
	UyIniPudbV+X4I6mSHpXHpzox7ySV3gQ9xLviuJcSLmv+dJz2yAHmYYbJ3Cjul5zRW6hIQWZr84QM
	1zYjIuFetMFE/B/J9QxzfepqT3y96G9Tga98z6vRvpqdxZYCC0cOw+inmDE+k7/897HFemfm4ICYE
	vUWW92DS4htPbTAA2vGX0kOnjJ5397m0PxUXtcxtvx9AOcKHsGzOfb9uMIm4pvIdodKn0BetGLevt
	1c32SKWkkPW6edxCwbJzO2tmYL2Ro/fIR47q764VtfH+v1vVX6pDlYwcgHyZmlppV7G37//RMdRM6
	4SFvqg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzwUE-00000007rVO-1tHT
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 10:37:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzwUB-00000007rTs-262Y
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 10:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CBEE61DEE;
	Thu, 25 Apr 2024 10:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F113C2BD10;
	Thu, 25 Apr 2024 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714041468;
	bh=/8CPFyEvI16oarvHvyC+EjrRq2/ekQV6u/DnvDlK3Qw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fPXU9OaDsgRmqOFd2veHHOfncZYF7oySXSfocOXsDjTVqJzH9RtIvgZrvaz98fsLe
	 aGGhIx7/deDTIxNPJGQHI8c6lAMgRIuOLwblvBxIY6ub9YSPKFR/TqydHqQ1twr23J
	 yzxL11hn7NSr8Wu5z9m7im7nBXHJPZ3q00x7MpolM9KlC+lS32Ji9W2OQeVtTXbvUE
	 lKeSwtOfgIVE2cb9EYk75SXMDv3Sh05udC2MwNuODkZ4doL77ly8IUYcRa6cVg/wXk
	 DWHhIh/S7l1DCtI/mtvg1jIUifDDZaOiaZwg9JeGVgslBQKdw5UCSgXESxQ/JjmrS2
	 3ov29XOdZcQEg==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
	<20240419032122.7009-2-quic_lingbok@quicinc.com>
Date: Thu, 25 Apr 2024 13:37:45 +0300
In-Reply-To: <20240419032122.7009-2-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Fri, 19 Apr 2024 11:21:20 +0800")
Message-ID: <87r0etsp6u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_033751_685218_17D377D3 
X-CRM114-Status: GOOD (  12.86  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> Currently, the transmit rate of "iw dev xxx station dump" command
> always show an invalid value.
>
> To address this issue, ath12k parse the info of transmit complete
> report from firmware and indicate the transmit rate to mac80211.
>
> This patch affects the station mode of WCN7850 and QCN9274.
>
> After that, "iw dev xxx station dump" show the correct transmit rate.
> Such as:
>
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  872 ms
>         rx bytes:       219111
>         rx packets:     1133
>         tx bytes:       53767
>         tx packets:     462
>         tx retries:     51
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      403
>         rx drop misc:   74
>         signal:         -95 dBm
>         beacon signal avg:      -18 dBm
>         tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

[...]

> +static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
> +{
> +	if (ar->last_ppdu_id != 0) {
> +		if (ar->last_ppdu_id == ts->ppdu_id ||
> +		    ar->cached_ppdu_id == ar->last_ppdu_id)
> +			ar->cached_ppdu_id = ar->last_ppdu_id;
> +
> +		ath12k_dp_tx_update_txcompl(ar, ts);
> +	}
> +
> +	ar->last_ppdu_id = ts->ppdu_id;
> +}

A code comment would help a lot. Why is ar->cached_ppdu_id needed here?

And if 'ar->cached_ppdu_id == ar->last_ppdu_id' is true why do then do
'ar->cached_ppdu_id = ar->last_ppdu_id'? The value of ar->cached_ppdu_id
is not changing here (unless I'm missing something).

Also I'm worried about locking. How is access to ar->last_ppdu_id and
ar->cached_ppdu_id protected?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

