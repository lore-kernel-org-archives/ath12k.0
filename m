Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE36C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tli+SbNbJw7AOoMFb+jQf6e3EkD3oxlSBseAwT5DaOA=; b=hiSfywfrmn9q7Px9HavV+vqg51
	kuHaEsRLcc52cXb8hFFAn1E6jzVQbyWhcFSYK6DRWfIxAMX7dTPOSCSji0r5EwKYfxR0rI9FRwF6M
	1caVdwbpSd5NtvEVwHl/+fsNmWxCCJOU5lyEu6zxQSlx9mXsXEigNBcnW8GjgQiJxzmctjlzvw5dz
	nUPL9ryV7SyibHFFphuvAHQ0NzX68txgDFdRN5XKiM8BXXYgGaogK8FA9eNL/zmPlIylMpG0nsExK
	WzccwC2WiEPlUAjbZki250tEVeVUSOoIBHOtS2KAfMFBck9gxmf7kq7hb0E7qx/UFPHFbV6dYbj9z
	94L+klMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02VZ-00000009Uyn-3X1o
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 17:03:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02VV-00000009UyE-3FOh
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 17:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D861661C2E;
	Thu, 25 Apr 2024 17:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CE0C113CC;
	Thu, 25 Apr 2024 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714064616;
	bh=ZyoqEPbEvn8/zC/o4LKp22S1ZTGNejLzpE70/PethaA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bhfo4OsR+JvB5m1R56auuAfC8CrTymXT0Wyf7YptzzOAjhloTMw/E5f+5BqLQIOBG
	 30hlmlEPwEt87B9muHLTmbp4kMEl4xlWXRq9Wo5wZMtFNm/6K4QjH0KMhuM5TDHgkn
	 3O4Zg+bu95Kpc1M2TRoT1KhHdZtOzoFtehA0xbTLILZFIEUaVBePODlSz6JwoaBbRI
	 qdRxhSp864GS0jpTJNBmyY3t4+gfn+ym632Hymew37yX76kLUiP6e/AHAr5Yj4g1SN
	 ZCD0iSVbfBfGAMNQGXUvhy7KBV56cSa0/rArQ5eLStiP10y/95M0WI29Pq52cpWvS3
	 awpO8gYJW6/MA==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] wifi: ath12k: report station mode signal strength
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
	<20240419032122.7009-4-quic_lingbok@quicinc.com>
Date: Thu, 25 Apr 2024 20:03:17 +0300
In-Reply-To: <20240419032122.7009-4-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Fri, 19 Apr 2024 11:21:22 +0800")
Message-ID: <877cgls7ca.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_100338_033033_81E0E264 
X-CRM114-Status: GOOD (  17.57  )
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

> Currently, the signal strength of "iw dev xxx station dump" always show an
> invalid value.
>
> This is because signal strength is only set in ath12k_mgmt_rx_event()
> function, and not set for received data packet. So, change to get signal
> from firmware and report to mac80211.
>
> After that, "iw dev xxx station dump" show the correct signal strength.
> Such as:
>
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  36 ms
>         rx bytes:       61571
>         rx packets:     336
>         tx bytes:       28204
>         tx packets:     205
>         tx retries:     49
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      83
>         rx drop misc:   66
>         signal:         -24 dBm
>         beacon signal avg:      -22 dBm
>
> For WCN7850, the firmware supports db2dbm, so not need to add noise floor.
> For QCN9274, the firmware not support db2dbm, so need to add noise floor.
>
> This patch affects the station mode of WCN7850 and QCN9274.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

[...]

> +static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
> +				   u32 vdev_id, u32 stats_id)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	int ret, left;
> +
> +	mutex_lock(&ar->conf_mutex);
> +
> +	if (ar->state != ATH12K_STATE_ON) {
> +		ret = -ENETDOWN;
> +		goto err_unlock;
> +	}
> +
> +	reinit_completion(&ar->fw_stats_complete);
> +
> +	ret = ath12k_wmi_send_stats_request_cmd(ar, stats_id, vdev_id, pdev_id);
> +
> +	if (ret) {
> +		ath12k_warn(ab, "failed to request fw stats: %d\n", ret);
> +		goto err_unlock;
> +	}
> +
> +	ath12k_dbg(ab, ATH12K_DBG_WMI,
> +		   "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
> +		   pdev_id, vdev_id, stats_id);
> +
> +	left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
> +
> +	if (!left)
> +		ath12k_warn(ab, "time out while waiting for get fw stats\n");
> +err_unlock:
> +
> +	mutex_unlock(&ar->conf_mutex);
> +	return ret;
> +}

Shouldn't we return an error if there's a timeout?

> @@ -8202,8 +8242,18 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>  
>  	/* TODO: Use real NF instead of default one. */
> -	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +	signal = arsta->rssi_comb;
> +
> +	if (!signal &&
> +	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +	    !(ath12k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
> +				      WMI_REQUEST_VDEV_STAT)))
> +		signal = arsta->rssi_beacon;
> +
> +	if (signal) {
> +		sinfo->signal = db2dbm ? signal : signal + ATH12K_DEFAULT_NOISE_FLOOR;

Can this be simplified to:

if (db2dbm)
        signal += ATH12K_DEFAULT_NOISE_FLOOR;

A lot more readable.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

