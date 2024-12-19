Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38608E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fc5vgIgre54cvDkvGt0cxqw/LAnwyQQTieqNYJWOuRg=; b=S9cjSpmnblC2qfFBCCujvNseZS
	41CbzbQgMsZ9Cam92D9yiC1A1dHEPdsrb4OIPcjP9j7YhSEdyk6ngtoAHdeqbw1HdEQXPhKtxnTV4
	cWUIkv/T+GwTSEgWsfUh2IF3j1c+K3+5M5iafqVSeaaqR/PjGeTAZ8phahRFbJQfXtzY/WLXoR5fI
	kyGTNh2+0vGSWsXpBSHMFJ/2EhsI8rCcFDwVFiFxCEnpbQzueL2Av2dQCNhMCtQY3SzdIsfLS+/lu
	Ihh3ZFWVFtLBfIQS9TtX4hcEpcVq2g+cAu8e/G/zfzW7VG8aP1cU2pwNootIxWUE/mkPgXPrWm0X0
	j6nphkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFBU-00000001jIV-422d
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:59:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFAf-00000001jDL-31lQ
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 363BB5C61DE;
	Thu, 19 Dec 2024 11:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E9CC4CECE;
	Thu, 19 Dec 2024 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734609504;
	bh=AxwDxt2ifzL4QpLmUI5qivVmIl60JW9wAMJVxJ1ZzBs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NQSMeYCl63k5FF6Qsy6dwCIGVRImkP9QD4vKcZeU/m38xrWs0ioCCi9IGMzVYNKL6
	 66eCKlA2QljfmFEEFHfKnaDdCGLitcXandAEGX/zPLuUtFpx0Ql1yQKOcMUf0tvke+
	 q7dtHD0StQl3b0+tNr1rwMqEgNK/bsTFo+uZP5CPEZPQ8c8Xbq/HoE33C7Y08n2/VN
	 KIHObwdljFOr+8BXyYiNiOBMgCKNHO8fu9m3rmmMBoP5wUH6Zi2nwgWMIs9wDmSWAL
	 QfWRjPZJgC6DPbipYE0rqBCLSypq5HyMojEMImgVCvDLwnXYR8YZeWI1jrtryskQoU
	 UH/FO3kMeeHQQ==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 4/6] wifi: ath12k: Add API to print s8 arrays in HTT stats
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
	<20241217095216.1543923-5-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 13:58:22 +0200
In-Reply-To: <20241217095216.1543923-5-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 15:22:14 +0530")
Message-ID: <87zfkrhokh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_035825_845717_4F8DB989 
X-CRM114-Status: GOOD (  19.60  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> Currently, print_array_to_buf() is used to print arrays to HTT
> stats buffer. This API supports printing only arrays with 32-bit
> unsigned integers. Add API print_array_to_buf_s8(), which
> implements print_array_to_buf()'s functionality to all the
> arrays with 8-bit signed integers.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

s/API/function/

And maybe not even use the term 'function' that, saying foo() should be
clear anyone that it's a function.

An example output would be nice.

> ---
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 4569ff40e9d8..621676daf971 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
>  					footer);
>  }
>  
> +static u32
> +print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
> +		      const s8 *array, u32 array_len, const char *footer)
> +{

I would rather have a separate buf_len variable instead of silently
assuming it's ATH12K_HTT_STATS_BUF_SIZE, much safer that way.

> +	int index = 0;
> +	u8 i;
> +
> +	if (header) {
> +		index += scnprintf(buf + offset,
> +				   ATH12K_HTT_STATS_BUF_SIZE - offset,
> +				   "%s = ", header);
> +	}

Empty line here.

> +	for (i = 0; i < array_len; i++) {
> +		index += scnprintf(buf + offset + index,
> +				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
> +				   " %u:%d,", stats_index++, array[i]);
> +	}

Empty line.

> +	index--;
> +	*(buf + offset + index) = '\0';

Avoid pointer arithmetic:

buf[offset + index] = '\0'

But first check that 'offset + index < buf_len'.

> +	if (footer) {
> +		index += scnprintf(buf + offset + index,
> +				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
> +				   "%s", footer);
> +	}

Empty line.

> +	return index;
> +}
> +
>  static const char *ath12k_htt_ax_tx_rx_ru_size_to_str(u8 ru_size)
>  {
>  	switch (ru_size) {

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

