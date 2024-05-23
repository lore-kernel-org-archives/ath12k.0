Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9029AC25B79
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ecj33QZXZXVevJHdyLfH5OZKEAadHxrsR7tRQqP8K0=; b=czY6VXSeadX3KJCZ9PVKJH/bnW
	/VAlvy+ENrsCK7q8jJ+msKSSq7GLEixELRLaNd9FcB39+/TKY1Uob9h7JTz/NdcS7QaHLB81+p29x
	V7yNu3vMl8f5JwGdTegrzoQYIbOezw94qSzVMPRtBj3bXqwxX8hLWt5d7Zp6Ii7LYqbeXLJ2CtYH9
	quPANibXlIsO/YdZGs7OoPEdnq5ivSpbJuyyPAv/PLl2VeteOUApRofEOOUQJdnXamzP8fiKmS41I
	FSukTnZcmREKxBvrxhttBvImswKPaHHCiJ7kXUsH2TU9aZyGcUb7/+Aj4JQcs/veD2W8+VyTycrrG
	xEXUxPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA8JZ-00000006KuO-0yWu
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 13:17:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA8JW-00000006KtR-0kLl
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 13:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1508862DF3;
	Thu, 23 May 2024 13:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011B4C2BD10;
	Thu, 23 May 2024 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716470216;
	bh=J5sH+IM11mBCk3fnWcNmwtCQ+GTlbAmt2HVgytd/hmc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=emYKTxduxBpDO12T2xwVodY7YjreMBh9rc90N+1HiMMwq4BYKuneR4jiSMezbRv+v
	 eshWiyqm5GVTsJPBPmqxGQh0B0luEo4WppDy3h66d0KQGNF+vhsQ/OCUnoCa24FUj4
	 vQYufD+/mAT2lAtLQ6Vj+ARuiYHetzdhldo6dYes+1VWrevYXybWaWPOGjsi46iQ2S
	 U4IkV5UqqdiVqsI4RMsMP1hy4dAAlmZ+q6ZJClVen3EvvsMP9RP9qAlubqlTSv97yf
	 QIwbHhwH/+FE5uWJo6Bd2NcoZNdvyMlFkvIWInExWEePPzsIsXIIzyr4UEVrlTO6LL
	 CkhRJFjA2HeXw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath12k: improve the rx descriptor error
 information
References: <20240516000807.1704913-1-quic_periyasa@quicinc.com>
	<20240516000807.1704913-3-quic_periyasa@quicinc.com>
Date: Thu, 23 May 2024 16:16:53 +0300
In-Reply-To: <20240516000807.1704913-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 16 May 2024 05:38:07 +0530")
Message-ID: <87a5kgbrcq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_061658_406973_4AF64AC3 
X-CRM114-Status: GOOD (  14.84  )
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

> The ath12k_dp_get_rx_desc() failure log currently contains the same
> information across multiple Rx data paths and lacks sufficient detail for
> debugging purposes. To address this, change the ath12k_dp_get_rx_desc()
> failure log to include cookie information along with Rx path details.
> This will provide more specific data for debugging purposes.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 37205e894afe..85ce6e840efa 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -2625,7 +2625,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
>  		if (!desc_info) {
>  			desc_info = ath12k_dp_get_rx_desc(ab, cookie);
>  			if (!desc_info) {
> -				ath12k_warn(ab, "Invalid cookie in manual desc retrieval");
> +				ath12k_warn(ab, "Rx, invalid cookie 0x%x\n", cookie);
>  				continue;
>  			}
>  		}
> @@ -3323,7 +3323,7 @@ ath12k_dp_process_rx_err_buf(struct ath12k *ar, struct hal_reo_dest_ring *desc,
>  	if (!desc_info) {
>  		desc_info = ath12k_dp_get_rx_desc(ab, cookie);
>  		if (!desc_info) {
> -			ath12k_warn(ab, "Invalid cookie in manual desc retrieval");
> +			ath12k_warn(ab, "Rx Exception, invalid cookie 0x%x\n", cookie);
>  			return -EINVAL;
>  		}
>  	}
> @@ -3742,7 +3742,8 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
>  		if (!desc_info) {
>  			desc_info = ath12k_dp_get_rx_desc(ab, err_info.cookie);
>  			if (!desc_info) {
> -				ath12k_warn(ab, "Invalid cookie in manual desc retrieval");
> +				ath12k_warn(ab, "WBM Rx err, invalid cookie 0x%x\n",
> +					    err_info.cookie);
>  				continue;
>  			}
>  		}

In the error messages please try to use full english sentences to make
them at somehow useful to users. I tried add those now, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=4033754ea78119ede328f09005b8ae1e9dd3f4f2

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

