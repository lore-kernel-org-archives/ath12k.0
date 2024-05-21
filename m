Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D59C25B75
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEc0QuVBUd2o7X360MpDYm930EmDXJmlCM84QFnICZU=; b=IfOHzyIHIinAnYMBcyyOeyGmdC
	eQfV41u2d7FIEByPfrbT5/m/LQiMH+ed/ltd4uRzccXrTmCM4dPA50lvk1hftMyRLzWBkc/DSbbq7
	i+9Ot2FrhbKgiBb1jMGespcjXq1zMsLi+EsSsGlPNNtFTAdUfhiD96v1Mxm1/fCaBANKKT1pBIbSO
	9+iMUUD4hK9NosGIgIFD1Cz7gnRIHTmt3dTMsOfmk7e+rVtXBDznBspSGosGMzvEBYpUnEn3lwAFV
	KoUqQrOQX/EZolk4dGFkM03jeo5U1BYrKxdj8VKVMtuPHrBZqwOWPc1raygS037ah5dLJa2JHoBc2
	FMqSWIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KFl-0000000Gei6-3mPf
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 07:49:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KFi-0000000GehP-0DyK
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 07:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CEA57CE0E58;
	Tue, 21 May 2024 07:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052A8C2BD11;
	Tue, 21 May 2024 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716277779;
	bh=1pUKTv82FJURgsr0jI314SPDaLC5Gow+Yuxa7TBb6gY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WjQL6EkzTNzIp6IqPBUKkV7iuiiX5ozhGvm+nFryRRfFqIliH2UmoAk40dK9KLi4c
	 j64vVj/QuaFRyyARbZXnKBifbEcF+xAGEBesPHmTQLupqGu083n8W0z7epYulcU/fj
	 x4Cjkp1Ckm5vgUnBuRPJXZ3lPg6yJif9NbmmLUbS4ClDMm9+lwAjww8IMSQegtLSD4
	 EqiMLyFeN7gmDVuxtMkDIHCRha58MiVxLl0CXgDpAxaJQu5lOTXxHTRHKC/9Tnm0rq
	 cbugK7PhfEkbO2a77xzn5JimRoxd6TBSOoAsWN2rpyphtru3zaW3vl7PTG8JfbOen/
	 oqEaVpMtJr34g==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH v2 1/5] wifi: ath12k: Add support to enable
 debugfs_htt_stats
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-2-quic_rgnanase@quicinc.com>
Date: Tue, 21 May 2024 10:49:36 +0300
In-Reply-To: <20240510050806.514126-2-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Fri, 10 May 2024 10:38:02 +0530")
Message-ID: <87y183d2pb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_004942_510544_C817AA35 
X-CRM114-Status: GOOD (  17.32  )
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

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>
> Create debugfs_htt_stats file when ath12k debugfs support is enabled.
> Add basic ath12k_debugfs_htt_stats_init and handle htt_stats_type
> file operations.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

[...]

> +struct ath12k_dbg_htt_stats {
> +	enum ath12k_dbg_htt_ext_stats_type type;
> +	u32 cfg_param[4];
> +	/* protects shared stats req buffer */
> +	spinlock_t lock;
> +};

Is there a specific reason why a new lock is needed? Why not just use
struct ath12k::data_lock?

> +
>  struct ath12k_debug {
>  	struct dentry *debugfs_pdev;
> +	struct ath12k_dbg_htt_stats htt_stats;
>  };
>  
>  struct ath12k_per_peer_tx_stats {
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index 8d8ba951093b..30a80f04d824 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -6,6 +6,7 @@
>  
>  #include "core.h"
>  #include "debugfs.h"
> +#include "debugfs_htt_stats.h"
>  
>  static ssize_t ath12k_write_simulate_radar(struct file *file,
>  					   const char __user *user_buf,
> @@ -87,4 +88,6 @@ void ath12k_debugfs_register(struct ath12k *ar)
>  				    ar->debug.debugfs_pdev, ar,
>  				    &fops_simulate_radar);
>  	}
> +
> +	ath12k_debugfs_htt_stats_init(ar);

Let's try to have consistent naming: ath12k_debugfs_htt_stats_register()

> +static ssize_t ath12k_read_htt_stats_type(struct file *file,
> +					  char __user *user_buf,
> +					  size_t count, loff_t *ppos)
> +{
> +	struct ath12k *ar = file->private_data;
> +	char buf[32];
> +	size_t len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%u\n", ar->debug.htt_stats.type);
> +
> +	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
> +}

Access to ar->debug.htt_stats.type isn't protected in any way.

> +
> +static ssize_t ath12k_write_htt_stats_type(struct file *file,
> +					   const char __user *user_buf,
> +					   size_t count, loff_t *ppos)
> +{
> +	struct ath12k *ar = file->private_data;
> +	enum ath12k_dbg_htt_ext_stats_type type;
> +	unsigned int cfg_param[4] = {0};
> +	int num_args;
> +
> +	char *buf __free(kfree) = kzalloc(count, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(buf, user_buf, count))
> +		return -EFAULT;
> +
> +	num_args = sscanf(buf, "%u %u %u %u %u\n", &type, &cfg_param[0],
> +			  &cfg_param[1], &cfg_param[2], &cfg_param[3]);
> +	if (!num_args || num_args > 5)
> +		return -EINVAL;
> +
> +	if (type >= ATH12K_DBG_HTT_NUM_EXT_STATS)
> +		return -E2BIG;
> +
> +	if (type == ATH12K_DBG_HTT_EXT_STATS_RESET)
> +		return -EPERM;
> +
> +	ar->debug.htt_stats.type = type;
> +	ar->debug.htt_stats.cfg_param[0] = cfg_param[0];
> +	ar->debug.htt_stats.cfg_param[1] = cfg_param[1];
> +	ar->debug.htt_stats.cfg_param[2] = cfg_param[2];
> +	ar->debug.htt_stats.cfg_param[3] = cfg_param[3];
> +
> +	return count;
> +}

Same here with both type and cfg_param. Maybe it's ok to skip
protection, I didn't do analysis yet, but this makes me suspicious.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

