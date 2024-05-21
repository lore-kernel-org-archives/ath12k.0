Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B9C25B78
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 07:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DklijF3J0N4TmJn3JvdV1Jz9yjGV/AkhWaYucKD12g=; b=Ch5s7/ZYTMQPYgftBiCMNDjhRI
	b+EAFAG0RIn640cshDP0hkMWzskUhSLFhlFAXKAEEgXx531c9JVLjZKunBZJsVH/BoRkVpM9sU/Zh
	/Kt/DtI36GvLwXM9c7jKSZffGJMwJQIgGzGyZmvjFdGg9beBoF1xrdgtxexl+7EdbfoKMGnvGSQnx
	cxjrk7as8L1fMLqqGpGqy/Kw2Z9ezRZDjGYGYiChZjdFqVvGIlz35l2w09v8eBLVKON3cKFtE5GDN
	ollgckWd5rJ4oNpz9HD5VmxTonaRiVOzP6QujH4QAwEr0FE2R7+A0mWTNHiDOp6509T20Qd3/yqJc
	RN3WjmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KNn-0000000Ggma-0gez
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 07:58:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KNX-0000000GgaN-3V9C
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 07:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 983DACE0EA6;
	Tue, 21 May 2024 07:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8ACC2BD11;
	Tue, 21 May 2024 07:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716278264;
	bh=MAdx8Mdn59U5MBMX6ChvO9+b/TWwcpyF+wMtPtUy4X4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AUXgJErRpQChC99frxsYW/Z8RGKJhzwHy1ZjZktzWV0XH9SiOZPso0FGH4GnjAwqU
	 +3owAbbqxaxxKJxe/+RWXU68AXW5zMEfBzKf7tqhMzvuBlKQ/gavhfedxyI8eT1DcS
	 JLI+yN9wddNByT162UzqFv9f9qg68pc60QBpL3rMEr5TTqEGJto7A2YXhJY3wTf+b0
	 xewdENv/Og0rSSZDqt3lqJbg2DJNgETCmZKX5SWXFP9l97PjhqxrADR9Q+wPd0iCPa
	 phjcE19mkSFLb0PbwJxZzUkIXQVapzWyiATgLPXANnzsQaMe8M1w0Httpzw+34/ZGq
	 XN5+Ba72gaE2Q==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Lingbo
 Kong <quic_lingbok@quicinc.com>
Subject: Re: [PATCH v2 3/5] wifi: ath12k: Fix Pdev id in HTT stats request
 for WCN7850
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-4-quic_rgnanase@quicinc.com>
Date: Tue, 21 May 2024 10:57:42 +0300
In-Reply-To: <20240510050806.514126-4-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Fri, 10 May 2024 10:38:04 +0530")
Message-ID: <87pltfd2bt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_005748_177685_C71A4EDB 
X-CRM114-Status: GOOD (  16.69  )
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
> HTT stats request to firmware. This causes issue with single pdev
> devices where fimrware does not respond to the stats request
> sent from host.
>
> Single pdev devices firmware expects pdev id as 1 for 5GHz/6GHz
> phy and 2 for 2GHz band. Handle pdev id for single phy device
> while sending HTT stats request message to firmware.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

[...]

> @@ -1029,7 +1030,12 @@ ath12k_dp_tx_htt_h2t_ext_stats_req(struct ath12k *ar, u8 type,
>  	memset(cmd, 0, sizeof(*cmd));
>  	cmd->hdr.msg_type = HTT_H2T_MSG_TYPE_EXT_STATS_CFG;
>  
> -	cmd->hdr.pdev_mask = 1 << ar->pdev->pdev_id;
> +	if (ab->hw_params->single_pdev_only)
> +		pdev_id = ath12k_mac_get_target_pdev_id(ar);
> +	else
> +		pdev_id = ar->pdev->pdev_id;

Wouldn't it be cleaner to have the single_pdev_only check in
ath12k_mac_get_target_pdev_id()?

> +struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k_base *ab)
> +{
> +	struct ath12k *ar;
> +	struct ath12k_pdev *pdev;
> +	struct ath12k_vif *arvif;
> +	int i;
> +
> +	for (i = 0; i < ab->num_radios; i++) {
> +		pdev = &ab->pdevs[i];
> +		ar = pdev->ar;
> +		list_for_each_entry(arvif, &ar->arvifs, list) {
> +			if (arvif->is_up)
> +				return arvif;
> +		}
> +	}
> +
> +	return NULL;
> +}

I'm not seeing any protection here, is that on purpose?

> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar)
> +{
> +	struct ath12k_vif *arvif;
> +
> +	arvif = ath12k_mac_get_vif_up(ar->ab);
> +
> +	if (arvif)
> +		return ath12k_mac_get_target_pdev_id_from_vif(arvif);
> +	else
> +		return ar->ab->fw_pdev[0].pdev_id;
> +}

No need to have else after return.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

