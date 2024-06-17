Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87258C2BA18
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP4LknjPTmOdV+m0Y7OjNRh+P46BrQiM+HR5maoZNA8=; b=co2+Vbya7Aap2n5gVnWkd9sF/J
	/Z/doLZa7leQM/DGGQuR/KRUmOP9adL30RcnLwpDD3hIVjMIMTUzY6rdf/VLHjx2PRVnuhVaalccr
	DwEkt2DkK417fvc7JuOjIdsz0OSj4nMZnkPz7//XJLpnwnZJF75ZLYzKXGNoU9Uaadh44zh+/k4ee
	FRjiyYLQ7xMllGM5AVneRx/+njPw18qYXEdMcQW3lnotCKB5fCao4bIF19WsmULaOVGDUgKJyNEdd
	Dmu8wlqohTVfPDZcx84i9Nn7MMVT2SbU+Dwg9oBVxYSbMljMAX8FFi4gc61VMFgWDitn+7JqmwCXx
	AJGOkEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDc4-0000000BFsX-0oq3
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 14:45:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDc0-0000000BFrV-1w9z
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 14:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A28DE6130B;
	Mon, 17 Jun 2024 14:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63817C4AF1D;
	Mon, 17 Jun 2024 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635535;
	bh=WljONcMYBQiy9twhsd+WU7VgbMMFjDDo3+ZIVzd90/A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YPBUL7qkUvSyAYCq7H8QjyoOuk9RQbKKLnCxPBc63kBP8F8IuqHvDAPNIBNzRB3Dj
	 RePn3NaHOvOZoT8UuArXkrxXHVazRtzACm1uhZ4+XD69EmnJBC6OHFMbLhgGDpOBV3
	 72+HAmqBZ97rDfvqkjYLQ7Or9/uBQFx2WzqfCRYY7F7Hcy+ALUt3dkORRhiurwA2BK
	 Inf3Cg0ia7G1x8Y/fW/fMhMusvZ1FWcvgR/2HpiRoWNe/HMd13wtEoRfHNxqDkOpgx
	 eBPgfrGdPaYeziNjbrsszimWKGka3pTi4b7VSMPUjMFrhJ6DG/c6wvJeVw93brKHGo
	 NYt9V2nBqL5Cg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Fix WARN_ON during firmware crash in
 split-phy
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240529034405.2863150-1-quic_aarasahu@quicinc.com>
References: <20240529034405.2863150-1-quic_aarasahu@quicinc.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171863553279.53335.12406687244110796571.kvalo@kernel.org>
Date: Mon, 17 Jun 2024 14:45:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_074536_665866_7CF5DB01 
X-CRM114-Status: GOOD (  13.83  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> wrote:

> Whenever firmware is crashed in split-phy below WARN_ON() triggered:
> 
> WARNING: CPU: 3 PID: 82 at net/mac80211/driver-ops.c:41 drv_stop+0xac/0xbc
> Modules linked in: ath12k qmi_helpers
> CPU: 3 PID: 82 Comm: kworker/3:2 Tainted: G      D W          6.9.0-next-20240520-00113-gd981a3784e15 #39
> Hardware name: Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C9 (DT)
> Workqueue: events_freezable ieee80211_restart_work
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drv_stop+0xac/0xbc
> lr : ieee80211_stop_device+0x54/0x64
> sp : ffff8000848dbb20
> x29: ffff8000848dbb20 x28: 0000000000000790 x27: ffff000014d78900
> x26: ffff000014d791f8 x25: ffff000007f0d9b0 x24: 0000000000000018
> x23: 0000000000000001 x22: 0000000000000000 x21: ffff000014d78e10
> x20: ffff800081dc0000 x19: ffff000014d78900 x18: ffffffffffffffff
> x17: ffff7fffbca84000 x16: ffff800083fe0000 x15: ffff800081dc0b48
> x14: 0000000000000076 x13: 0000000000000076 x12: 0000000000000001
> x11: 0000000000000000 x10: 0000000000000a60 x9 : ffff8000848db980
> x8 : ffff000000dddfc0 x7 : 0000000000000400 x6 : ffff800083b012d8
> x5 : ffff800083b012d8 x4 : 0000000000000000 x3 : ffff000014d78398
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000014d78900
> Call trace:
>  drv_stop+0xac/0xbc
>  ieee80211_stop_device+0x54/0x64
>  ieee80211_do_stop+0x5a0/0x790
>  ieee80211_stop+0x4c/0x178
>  __dev_close_many+0xb0/0x150
>  dev_close_many+0x88/0x130
>  dev_close.part.171+0x44/0x74
>  dev_close+0x1c/0x28
>  cfg80211_shutdown_all_interfaces+0x44/0xfc
>  ieee80211_restart_work+0xfc/0x14c
>  process_scheduled_works+0x18c/0x2dc
>  worker_thread+0x13c/0x314
>  kthread+0x118/0x124
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> The warning in question is from drv_stop():
> 
>         if (WARN_ON(!local->started))
>                 return;
> 
> The sequence of WARN_ON() is:
> Thread 1:
> -Firmware crash calls ath12k_core_reset().
> -Call ieee80211_restart_hw() inside
>  ath12k_core_post_reconfigure_recovery() which schedules worker
>  for both hardware.
> -Wait for completion of ab->recovery_start.
> 
> Thread 2 (worker thread):
> -One hardware acquires rtnl_lock() inside ieee80211_restart_hw() and
>  calls ath12k_mac_wait_reconfigure() into ath12k_mac_op_start().
> -Hardware is waiting for ab->reconfigure_complete but at this time
>  recovery_start_count value is 1 because another worker thread
>  (local->restart_work) is still waiting for rtnl_lock().
>  recovery_start_count is not equal to number of radios
>  (2 in split-phy). So ab->recovery_start complete does not set
>  due to this, thread 1 is still waiting and not able to perform
>  hif power down up and firmware reload.
> -Wait timeout happens for ab->reconfigure_complete and comeback
>  to caller (ath12k_mac_op_start()) and sends WMI command to
>  crashed firmware and gets error.
> -This returns error to drv_start() and local->started is set to false.
> -Hardware calls cfg80211_shutdown_all_interfaces() after receiving error
>  inside ieee80211_restart_work() and goes to drv_stop(), here we trigger
>  WARN_ON as local->started is false.
> 
> To fix this issue call ieee80211_restart_hw() after firmware has been
> reloaded. Now, each hardware can send WMI command to firmware
> successfully. With this fix we don't need to wait for
> ab->recovery_start completion so remove
> ath12k_mac_wait_reconfigure().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

670d4949bc8e wifi: ath12k: Fix WARN_ON during firmware crash in split-phy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240529034405.2863150-1-quic_aarasahu@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


