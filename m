Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A37BC25B74
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntGqwjlw/VpUBdoIKGESwsg/nQn6FWvV2bdS6BwnAMs=; b=SHSuTiptHA+RGGSs3qU+qJ5ca4
	0mSeF8FEhcxjPNRKvowpWJ06lcYtEcnRbwLJwGBfT34ojshxAT/fu6m6Y9o3/Ysj+jjCiCknXooXZ
	mP5GuvxgZfP5CnGYcP8Yb/ApKBWr7uMXzo36qMFSvryU1Hzh4AC5nTDy92NPj5BWoljRp7Sgv+Hkm
	faCsCv/gNzgSpT4RNmJDFX9NM1FKQ7FItvHpolCfuxkKrOoBgxENp/G4wCOhkLtFy6ik+2Qpyqbf3
	ggCIqvybDD2RmR4Qe/oPVDbhR7Pa3NrjyDbwr+A26pNSduvKTouKOsl5M9zuWcr37rxwf39TMXyIp
	ehs1GW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KVM-0000000GiWM-02XS
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 08:05:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KVJ-0000000GiVx-32nk
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 08:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0161862027;
	Tue, 21 May 2024 08:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BAAC2BD11;
	Tue, 21 May 2024 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716278748;
	bh=R5x1eX0Ez4WjR44vMnMHTWgfZRTKYLOH3IUFemOI+PE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GjxIbjOhQcI0p6Sr5nzrlHc6uBEsuTnfkeMOfrqrWi31r2I7AfvCEiJcrf1ilAlwE
	 P+ziaQS6BdbiHrDD/mw9aeELEX6zIL3pEvawhiND+sZno6ZXqyBTzqrK+SW3tj5nET
	 s7YOcJT5QiBdLLnxvTK/FV6hVej/WFZQT5qANb/LNhP+1wyFAybH8lNCmSvNe3/368
	 wbxUTxt4HhggwTx6OOKCbbY14c8YGU7i+JJ76+jsu0BC09Sko1SU564EHjzYp7Xm+c
	 oupLhrb11ALmWgK302+T0iUp05U+3giblhtj0ZoxHRnkR10huNCXES131dwAX2/Wjt
	 rMZAadGRk4CEA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix Smatch warnings on
 ath12k_core_suspend()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240511095045.9623-1-quic_bqiang@quicinc.com>
References: <20240511095045.9623-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171627874515.3970531.14849401766701912789.kvalo@kernel.org>
Date: Tue, 21 May 2024 08:05:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_010549_923344_B3B5BB1F 
X-CRM114-Status: GOOD (  15.80  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Smatch is throwing below warning:
> 
> Commit 692921ead832 ("wifi: ath12k: flush all packets before
> suspend") leads to the following Smatch static checker warning:
> 
>         drivers/net/wireless/ath/ath12k/core.c:58 ath12k_core_suspend()
>         warn: sleeping in atomic context
> 
> and also gives the reason:
> 
> drivers/net/wireless/ath/ath12k/core.c
>     48         int ret, i;
>     49
>     50         if (!ab->hw_params->supports_suspend)
>     51                 return -EOPNOTSUPP;
>     52
>     53         rcu_read_lock();
>                ^^^^^^^^^^^^^^^
> Disables preemption.
> 
>     54         for (i = 0; i < ab->num_radios; i++) {
>     55                 ar = ath12k_mac_get_ar_by_pdev_id(ab, i);
>     56                 if (!ar)
>     57                         continue;
> --> 58                 ret = ath12k_mac_wait_tx_complete(ar);
>                                         ^^^^^^^
> Sleeping in atomic context.
> 
>     59                 if (ret) {
>     60                         ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
>     61                         rcu_read_unlock();
>     62                         return ret;
>     63                 }
>     64         }
>     65         rcu_read_unlock();
> 
> But it is weird that no warning on this in run time even with
> CONFIG_DEBUG_ATOMIC_SLEEP=y. With some debug it is found that this is
> because: when system goes to suspend, ath12k_mac_op_stop() gets called
> where then in ath12k_mac_stop() ab->pdevs_active[ar->pdev_idx] is cleared.
> This results in ath12k_mac_get_ar_by_pdev_id() always returning a NULL ar,
> and thereby ath12k_mac_wait_tx_complete() never gets a chance to run.
> 
> Fix it by retrieving ar directly from ab->pdevs[].ar instead of using
> ath12k_mac_get_ar_by_pdev_id(). Since ab->pdevs[].ar is set at boot time
> and won't get cleared when suspend, ath12k_mac_wait_tx_complete() won't
> be skipped. In addition, with ath12k_mac_get_ar_by_pdev_id() removed,
> rcu_read_lock()/unlock() are not needed any more, so remove them. This
> also fixes the warning above.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Fixes: 692921ead832 ("wifi: ath12k: flush all packets before suspend")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/ath12k/7a96ca11-80b5-4751-8cfc-fa637f3aa63a@moroto.mountain/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

33370412eced wifi: ath12k: fix Smatch warnings on ath12k_core_suspend()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240511095045.9623-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


