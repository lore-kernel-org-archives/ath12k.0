Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF5E7717F
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApHy1BUGNOlS0sAVaC1Gr02x4Xn7iWbwohl8J3IGQ/c=; b=P7+a9OTOrcTz2CJoX5fz8qEqhw
	Qt2lMRSPltMjrvrmmm2bRw+n41USeFhmLzkmnrQ732gQVP4LklFpJ5Sq4e5QrE477P3DYboJt6wYq
	ZmysS6qU7yJCp/FNzg84RdQE/LhOWNpqSPG81ptj9Xas7dE9/n8CU9B7yqoSNDrTLxLRLCeixk8us
	R17U/aGXf4017mrb7pfV38VDtYmQRE9II/hYqERIaGe30L1iXcXyzijRMwhVSBaZ7Ymwxk5x9fGKr
	P03Cv4th5+6B2XtmkycyI+PkWPPAyN29gthjJ1KqjKNxI72q0Tz2Xl4X3UR7nfebK/BQdrra8bYxB
	X8ut8C9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe3V-0000000HDKQ-3XJa
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 07:56:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe3T-0000000HDJa-2Icq
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 07:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73150A40CA8;
	Thu, 12 Dec 2024 07:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C06C4CECE;
	Thu, 12 Dec 2024 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733990174;
	bh=D3zlEDcL4QLLYv4J9NPmxlbqpr4tLNzH9v7WwkjbKJI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mf5Jz7okKQSj+bwBrfYUF7dAisuuodNaejtDAJdTyLdeFKoEclA/mOnvL3ZS+syu3
	 lQXP4gYat2vlBZY8NKsCBebOm/7krtB40NuEx4i03+xGMSzoQ+TANRStGSiup3lDnA
	 tNXtXvpP6XyvSJXAueJb/vUeuRTeXLVVezhk9N/uf6+wBU67EnvnPgbOX9nbVxdtJD
	 atBZnPU4ZMCRoo8ou6oj0RkXHrL1ObKvDTgVUTVkeWYvihaB15ye17RxKPh+iEfytf
	 Xahva59/g5gZpw6gDb1Qfdn17CfcutbvfQ5sxXoHKPEb3eGI59jpZmsz3XHaxReRyi
	 KRkmRY2EemKVg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 4/4] wifi: ath12k: Fix uninitialized variable access in
 ath12k_mac_allocate() function
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
	<20241212004906.3087425-5-quic_periyasa@quicinc.com>
Date: Thu, 12 Dec 2024 09:56:11 +0200
In-Reply-To: <20241212004906.3087425-5-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 12 Dec 2024 06:19:06 +0530")
Message-ID: <87v7vppc6c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_235615_716576_3DB17460 
X-CRM114-Status: GOOD (  20.76  )
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

> Currently, the uninitialized variable 'ab' is accessed in the
> ath12k_mac_allocate() function. Initialize 'ab' with the first radio device
> present in the hardware abstraction handle (ah). Additionally, move the
> default setting procedure from the pdev mapping iteration to the total
> radio calculating iteration for better code readability. Perform the
> maximum radio validation check for total_radio to ensure that both num_hw
> and radio_per_hw are validated indirectly, as these variables are derived
> from total_radio. This also fixes the below Smatch static checker warning.
>
> Smatch warning:
> ath12k_mac_allocate() error: uninitialized symbol 'ab'
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 5cdc1c38b049..98b2f853d243 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -10962,8 +10962,20 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>  	u8 radio_per_hw;
>  
>  	total_radio = 0;
> -	for (i = 0; i < ag->num_devices; i++)
> -		total_radio += ag->ab[i]->num_radios;
> +	for (i = 0; i < ag->num_devices; i++) {
> +		ab = ag->ab[i];
> +		if (!ab)
> +			continue;
> +
> +		ath12k_mac_set_device_defaults(ab);
> +		total_radio += ab->num_radios;
> +	}
> +
> +	if (!total_radio)
> +		return -EINVAL;

'total_radio == 0' is more readable as it's a counter. Also please add ath12k_warn()

> +
> +	if (WARN_ON(total_radio > ATH12K_GROUP_MAX_RADIO))
> +		return -ENOSPC;

BTW ath12k_warn() is preferred over WARN_ON(), but this is just for the
future as this WARN_ON() was already there before.

>  
>  	/* All pdev get combined and register as single wiphy based on
>  	 * hardware group which participate in multi-link operation else
> @@ -10976,14 +10988,16 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>  
>  	num_hw = total_radio / radio_per_hw;
>  
> -	if (WARN_ON(num_hw >= ATH12K_GROUP_MAX_RADIO))
> -		return -ENOSPC;
> -
>  	ag->num_hw = 0;
>  	device_id = 0;
>  	mac_id = 0;
>  	for (i = 0; i < num_hw; i++) {
>  		for (j = 0; j < radio_per_hw; j++) {
> +			if (device_id >= ag->num_devices || !ag->ab[device_id]) {
> +				ret = -ENOSPC;
> +				goto err;
> +			}

ath12k_warn()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

