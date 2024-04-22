Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BDEC4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjp1AQ9rkr7Yrkh3eZX+SphG9SdKzG7MzkdXBRALZ2M=; b=lwyTbyiAraTpZf4VeaKNoXWaNU
	5lxl/sOv6NC9PrvpUD0Z/ENMNHGb2AbKMWGr/lZv4+1off3tiiMqwgzDDLC7h+jOHgXYfVUyuaUi9
	emHxWprNSRSRy+CUH9CmoUEyXCuX8o9FwrPlaR2UkXH+bk5EbsRjsQKjobGT9AzlEUu8fKifv4flI
	u7gWA5OqCcU2mA7RK1ysS7ztCopoaqdLe+y5tOqhfQQRSgBJmGaFJ9tbl6On5VWFM7rTmjUFB4dcZ
	aIbrijutVO5yIfbOVMXQHAY/GB/z3ppmY6BcifItSfBzazJtZTRvgIvqtfBgUFnT1lDnI20x8sfdI
	XP1pN1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysSs-0000000DSFN-1bgf
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 12:08:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysSp-0000000DSEo-2oPB
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 12:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 875DA60CF6;
	Mon, 22 Apr 2024 12:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0378AC113CC;
	Mon, 22 Apr 2024 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713787682;
	bh=4teQusw/frW2YkbHTwRL4Zs5nlti7cBw2MbjQWXL43Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=c+o+JEF+3fzKamn3fQhCChUNlKOCshpHiTrfcZS+kwGlIV3KtPZ57Q/+5FpGQKZBE
	 035KBuEiB9838PXbYhiWzKc1ZIm0WU5o7OZ4K+uzm+oGWXzu4MYqGqc3zor+wfWHhS
	 UJfcOFl9hY1oSeygccxbzT8edDPuiEBeAdo7qqqpBq41Ze0P3lkH6t2zDj90AUaMX3
	 D0eKyIJGCYoe6C2TMy9opfYsTYt1vzqUexOU1SsQIpRaDtPGgPaI9SqC8AsDH4/HGf
	 gwJ586J1+HhZmCV36NHg6vAvioMYa3D1s9ipolRRZPuGQVPmiQOoZv/1lzffCm8Zcj
	 e44vUc0sVFZTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: fix out-of-bound access of
 qmi_invoke_handler()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240416080234.2882725-1-quic_kathirve@quicinc.com>
References: <20240416080234.2882725-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171378767925.1358009.1322280791259157852.kvalo@kernel.org>
Date: Mon, 22 Apr 2024 12:08:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_050803_794275_289B7071 
X-CRM114-Status: UNSURE (   8.55  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> Currently, there is no terminator entry for ath12k_qmi_msg_handlers hence
> facing below KASAN warning,
> 
>  ==================================================================
>  BUG: KASAN: global-out-of-bounds in qmi_invoke_handler+0xa4/0x148
>  Read of size 8 at addr ffffffd00a6428d8 by task kworker/u8:2/1273
> 
>  CPU: 0 PID: 1273 Comm: kworker/u8:2 Not tainted 5.4.213 #0
>  Workqueue: qmi_msg_handler qmi_data_ready_work
>  Call trace:
>   dump_backtrace+0x0/0x20c
>   show_stack+0x14/0x1c
>   dump_stack+0xe0/0x138
>   print_address_description.isra.5+0x30/0x330
>   __kasan_report+0x16c/0x1bc
>   kasan_report+0xc/0x14
>   __asan_load8+0xa8/0xb0
>   qmi_invoke_handler+0xa4/0x148
>   qmi_handle_message+0x18c/0x1bc
>   qmi_data_ready_work+0x4ec/0x528
>   process_one_work+0x2c0/0x440
>   worker_thread+0x324/0x4b8
>   kthread+0x210/0x228
>   ret_from_fork+0x10/0x18
> 
>  The address belongs to the variable:
>   ath12k_mac_mon_status_filter_default+0x4bd8/0xfffffffffffe2300 [ath12k]
>  [...]
>  ==================================================================
> 
> Add a dummy terminator entry at the end to assist the qmi_invoke_handler()
> in traversing up to the terminator entry without accessing an
> out-of-boundary index.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e1bdff48a1bb wifi: ath12k: fix out-of-bound access of qmi_invoke_handler()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240416080234.2882725-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


