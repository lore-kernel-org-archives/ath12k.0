Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FA4C25B74
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTxB8D4oRbHgus1TGCmKjcQOZw8ddb85M/Tm8Q3vHGE=; b=YfaN5n2TEwaPUXq7AVrjncy28O
	jnQG4I+NWpXbWq26T/ZOyH6E6SGRMVXeRR+iE6LLWpBCyX4iLbMUGfwXoj38eqcEVyi+zA+GDWVSM
	7mFzOo1BcHAijn3RGh0N11LSm7HBXCsybBTlb9BXFdb+frw5bidUrFBoaBL4s0n11mQHIU6E8UzQU
	7P+TJhjpkGVkyhA5GVIokqvid786QqHZOJP2kCedO3igG332WtiXsRuATiK6SAjPKMqWBdS7ebVHy
	b0SowjmPYXOmhm7Vk8O0bvnkN06V2o8810UMyBi4k9ANcnVmD4Kg7R6LkGU9/GrivYaOjacQWfx9A
	BlEsCA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KK0-0000000GgEv-1tQa
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 07:54:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KJx-0000000GgDN-0rxg
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 07:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89B2BCE0E58;
	Tue, 21 May 2024 07:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DB1C2BD11;
	Tue, 21 May 2024 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716278041;
	bh=d30O1iXiP/3oLi5EUYET0mR7EIn9+D7O3ZNh0bGwZfE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OqJAPeK2RX0K1Jlk924blA+4kRTR0WGfI+b08xWL1ESb3NEQnoMsQUmL8yAY0EUPI
	 chgCP8z9z9D9EO6yRCcJ9viWlI2evxidXxfIAmUcIR1pCHXpnckmXesxGOD1nk02N3
	 w3YIq8amga80Asqg335cC9juPKJYK5z1CnVhAAqP/m3cXa6vb2dQ8n0b3zf/aDXXhw
	 6x3L4JksH5d9nN+odVtT4SxNUi/Z2eq981qH0viXDEHTQKo4tenChWDWbsJeAn1mSW
	 aWVuOjIIwCnVTkpy7+TQ7JhUS+mxnip6TgaoYhN7zXgqLS/GS6kQi+WahEwhIWprhK
	 gFL9fOo5VnpkA==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH v2 2/5] wifi: ath12k: Add htt_stats_dump file ops support
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-3-quic_rgnanase@quicinc.com>
Date: Tue, 21 May 2024 10:53:59 +0300
In-Reply-To: <20240510050806.514126-3-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Fri, 10 May 2024 10:38:03 +0530")
Message-ID: <87ttird2i0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_005405_765376_6B398D30 
X-CRM114-Status: GOOD (  19.97  )
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
> Add dump_htt_stats file operation to dump the stats value requested
> for the requested stats_type.
> Stats sent from firmware will be cumulative. Hence add debugfs to reset
> the requested stats type.
>
> Example with one ath12k device:
>
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
>         `-- htt_stats
>         |-- htt_stats_type
>         |-- htt_stats_reset
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h        |   2 +
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 202 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   |  30 +++
>  3 files changed, 234 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 3919bc828620..77c0842e5ab0 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -477,6 +477,8 @@ struct ath12k_fw_stats {
>  struct ath12k_dbg_htt_stats {
>  	enum ath12k_dbg_htt_ext_stats_type type;
>  	u32 cfg_param[4];
> +	u8 reset;
> +	struct debug_htt_stats_req *stats_req;

Please document with a code comment how these are protected

>  	/* protects shared stats req buffer */
>  	spinlock_t lock;

I'm guessing "stats req buffer" refers to struct
ath12k_dbg_htt_stats::stats_req. But at least in
ath12k_release_htt_stats() you are using conf_mutex for protection:

static int ath12k_release_htt_stats(struct inode *inode,
				    struct file *file)
{
	struct ath12k *ar = inode->i_private;

	mutex_lock(&ar->conf_mutex);
	kfree(file->private_data);
	ar->debug.htt_stats.stats_req = NULL;
	mutex_unlock(&ar->conf_mutex);

	return 0;
}

> +static int ath12k_debugfs_htt_stats_req(struct ath12k *ar)
> +{
> +	struct debug_htt_stats_req *stats_req = ar->debug.htt_stats.stats_req;
> +	enum ath12k_dbg_htt_ext_stats_type type = stats_req->type;
> +	u64 cookie;
> +	int ret, pdev_id = ar->pdev->pdev_id;
> +	struct htt_ext_stats_cfg_params cfg_params = { 0 };
> +
> +	init_completion(&stats_req->htt_stats_rcvd);
> +
> +	stats_req->done = false;
> +	stats_req->pdev_id = pdev_id;

The locking design is not clear for me yet but I suspect this function
needs:

	lockdep_assert_held(&ar->conf_mutex);

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

