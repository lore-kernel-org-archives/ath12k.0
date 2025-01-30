Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68546C02190
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpdumRQGPHlNQiX7vM3mx7ljnGieX4Xa92XbaW4CAD4=; b=nfW88ZSulJ/e4AMWnQ+DLBG+mK
	sbgCr8CQ4l39DneRH4rsWt5LJsOUWdvjdkKnOAd6IUSoGasP6bvxAIOhox73IbJQW7HY0Gf2xcsta
	Ec/1DBn58Z6TqBiPg6V3NcovANiWFhsTbTJ6WXxwDGif4OLXf8uaU9MYt+v59KzC4xRmrMQcjwrL5
	z0jLC+OoTGC06F0mD76CdPpgS33LiteD1yM1Y1ZBZjLD3OkH49+q2OSclogMm6eYfskfkHSWGMIxl
	feM5XynUNMSp8WLT3tplM4kils5jti8UFfyYthdqTmekEd5MoQUP8uqqvvnM0cGXE3mznfGiLTaMk
	tzZty0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ5B-00000008QhA-0eax
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 08:39:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ58-00000008Qg1-2ntO
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 08:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1ADBFA41BE0;
	Thu, 30 Jan 2025 08:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC2FC4CED3;
	Thu, 30 Jan 2025 08:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738226365;
	bh=fd3xpF4ktv4ORw9vYuTZ4/WAbOSh+WpvwrJQi9du1UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otwIu41GwAywhOKGwqk7MwV2/izu1h8d3S/HnyVQ/eL01ulpBWP57L3QiHHn9oqKG
	 gCz2XfFVc6Y/1rF5GXRmMU6ic67OccQd0bN/XKHBxW3Fwb/Aq2s4aE8tOQc2cIiUa6
	 4NKmBnP2dn9roup25qTQV1IrkepmW3pwC3bTLPJkh0ncJTcjFgAUpLxJqzwCu1C1mr
	 Lc3AgGMWKzsRmPe0/pQbe1/zR6RbnFcoUPdaX1zhwgdRwFCklmpR7/v6zJU6CjnTHh
	 woU1CrnaO2ab5KHBdMZubE0ze8WhaLYthUM4Du1rQA1vEBg9pwfCm5BpYeZdDUDNBM
	 A3lpr5DgN/+2A==
Date: Thu, 30 Jan 2025 09:39:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>, Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Subject: Re: [RFC PATCH 5/5] wifi: ath12k: Enable IPQ5424 WiFi device support
Message-ID: <20250130-offbeat-sparkling-nyala-042b72@krzk-bin>
References: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
 <20250130051838.1924079-6-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130051838.1924079-6-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_003926_834069_827EED21 
X-CRM114-Status: GOOD (  24.02  )
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

On Thu, Jan 30, 2025 at 10:48:38AM +0530, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> Currently, ath12k AHB (in IPQ5332) uses SCM calls to authenticate the
> firmware image to bring up userpd. From IPQ5424 onwards, Q6 firmware can
> directly communicate with the Trusted Management Engine - Lite (TME-L),
> eliminating the need for SCM calls for userpd bring-up.
> 
> Hence, to enable IPQ5424 device support, use qcom_mdt_load_no_init() and
> skip the SCM call as Q6 will directly authenticate the userpd firmware.
> 
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.5-01053-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Co-developed-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/ahb.c | 80 +++++++++++++++++----------
>  drivers/net/wireless/ath/ath12k/ahb.h |  9 +++
>  2 files changed, 61 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index d502b59a78d8..75767915dec3 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -21,6 +21,9 @@ static const struct of_device_id ath12k_ahb_of_match[] = {
>  	{ .compatible = "qcom,ipq5332-wifi",
>  	  .data = (void *)ATH12K_HW_IPQ5332_HW10,
>  	},
> +	{ .compatible = "qcom,ipq5424-wifi",
> +	  .data = (void *)ATH12K_HW_IPQ5424_HW10,
> +	},
>  	{ }
>  };
>  
> @@ -398,8 +401,8 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>  		ATH12K_AHB_UPD_SWID;
>  
>  	/* Load FW image to a reserved memory location */
> -	ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region, mem_phys, mem_size,
> -			    &mem_phys);
> +	ret = ab_ahb->ahb_ops->mdt_load(dev, fw, fw_name, pasid, mem_region, mem_phys,
> +					mem_size, &mem_phys);
>  	if (ret) {
>  		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
>  		goto err_fw;
> @@ -430,11 +433,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>  		goto err_fw2;
>  	}
>  
> -	/* Authenticate FW image using peripheral ID */
> -	ret = qcom_scm_pas_auth_and_reset(pasid);
> -	if (ret) {
> -		ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
> -		goto err_fw2;
> +	if (ab_ahb->scm_auth_enabled) {
> +		/* Authenticate FW image using peripheral ID */
> +		ret = qcom_scm_pas_auth_and_reset(pasid);
> +		if (ret) {
> +			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
> +			goto err_fw2;
> +		}
>  	}
>  
>  	/* Instruct Q6 to spawn userPD thread */
> @@ -491,13 +496,15 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>  
>  	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
>  
> -	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
> -		ATH12K_AHB_UPD_SWID;
> -	/* Release the firmware */
> -	ret = qcom_scm_pas_shutdown(pasid);
> -	if (ret)
> -		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
> -			   ab_ahb->userpd_id, ret);
> +	if (ab_ahb->scm_auth_enabled) {
> +		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
> +			 ATH12K_AHB_UPD_SWID;
> +		/* Release the firmware */
> +		ret = qcom_scm_pas_shutdown(pasid);
> +		if (ret)
> +			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> +				   ab_ahb->userpd_id);
> +	}
>  }
>  
>  static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
> @@ -707,6 +714,14 @@ static int ath12k_ahb_map_service_to_pipe(struct ath12k_base *ab, u16 service_id
>  	return 0;
>  }
>  
> +static const struct ath12k_ahb_ops ahb_ops_ipq5332 = {
> +	.mdt_load = qcom_mdt_load,
> +};
> +
> +static const struct ath12k_ahb_ops ahb_ops_ipq5424 = {
> +	.mdt_load = qcom_mdt_load_no_init,
> +};
> +
>  static const struct ath12k_hif_ops ath12k_ahb_hif_ops_ipq5332 = {
>  	.start = ath12k_ahb_start,
>  	.stop = ath12k_ahb_stop,
> @@ -1041,19 +1056,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>  	struct device_node *mem_node;
>  	struct ath12k_ahb *ab_ahb;
>  	enum ath12k_hw_rev hw_rev;
> -	u32 addr, userpd_id;
> +	u32 addr;
>  	int ret;
>  
> -	hw_rev = ath12k_ahb_get_hw_rev(pdev);
> -	switch (hw_rev) {
> -	case ATH12K_HW_IPQ5332_HW10:
> -		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
> -		userpd_id = ATH12K_IPQ5332_USERPD_ID;
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}

You just added this code in previous patchset, why are you moving it?

> -
>  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to set 32-bit coherent dma\n");
> @@ -1067,13 +1072,32 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	ab_ahb = ath12k_ab_to_ahb(ab);
> +	ab_ahb->ab = ab;
> +
> +	hw_rev = ath12k_ahb_get_hw_rev(pdev);
> +	switch (hw_rev) {
> +	case ATH12K_HW_IPQ5332_HW10:
> +		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
> +		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
> +		ab_ahb->scm_auth_enabled = true;
> +		ab_ahb->ahb_ops = &ahb_ops_ipq5332;
> +		break;
> +	case ATH12K_HW_IPQ5424_HW10:
> +		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
> +		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
> +		ab_ahb->scm_auth_enabled = false;
> +		ab_ahb->ahb_ops = &ahb_ops_ipq5424;

Why you cannot store just proper driver data structure in match data?
This entire switch is redundant.

Best regards,
Krzysztof


