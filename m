Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41540D735FE
	for <ath12k@archiver.kernel.org>; Sat, 30 Nov 2024 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBtSjQGUcRo8PXHCMxoEP5e4qxyhiYgoy+VP7iUjSLk=; b=QYtGQ89uTMhxLcO2osd9uFS6gt
	NInpQtWywGxLXTo/amLcaGgAEG7+ndOwBgSqf6FAO0FjalFddR2Wd+P4pQjeHqIM/VRFcZLmNa8YN
	tCA0MNjkOXCb29mp+FcEMbPc9EFAPNX+iQYI+Mz+1xDicdq8d6C6mu7eWYAv85epwgsXLD0bsBGT3
	6Tn0cR5Zpw0jujl+EvuCvnb7dnWHOOx/iMbAhvqqmOqwuvw94WVDCAgjkItDHHYxPI9QV4iZj6Wud
	ns0csg03i9EVItCqc5bx2FmYwq1RQbFB7Lv2ys4L1AJcyecBm7jNGGnDu4oLUu/WxX0BKuu0c99J3
	wO/nnYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHMJP-000000020IO-47bZ
	for ath12k@archiver.kernel.org;
	Sat, 30 Nov 2024 12:10:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHMJM-000000020I4-3teR
	for ath12k@lists.infradead.org;
	Sat, 30 Nov 2024 12:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D345A4027C
	for <ath12k@lists.infradead.org>; Sat, 30 Nov 2024 12:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D57BC4CECC;
	Sat, 30 Nov 2024 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732968654;
	bh=m3Jrm8YjvacCE73jKzt5JMFeAXiSolKV9VW1bYBpAvg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KbzCtLRB8/uq3h58EQ4JGeDbRh6H06yP2x0A5X0qLFeOmcPpPAJnO+ssZyoGT4wRH
	 SGNuX0Tk2E9MAPCk0YXYYnl9mpJqeon+nElKptODFl/CLCGoq3xNndU/WAR4VoCIAd
	 SUOkkYtYiCuiZmazBXSYUJkHhNtwwmDEY0QMhEkN54+JtXXHZnRMURftynSQ29ZQCP
	 Vlx5EdbYycVSyfWG1OPsD2CJE9WbBH0XL/e52WkYd9E1NzZupJ6YUPFzBmUbRwGzRS
	 Wtxh39p3XkTeNscvL/F4aB9NsFWo7x59kPsfdCeM92xvyDRi2fKqXzvbR4DFernO0D
	 hn8W4EAdI7Cbg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] wifi: ath12k: Refactor core startup
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20241128165026.2618331-2-kvalo@kernel.org>
References: <20241128165026.2618331-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173296865210.2878719.18308390110786354265.kvalo@kernel.org>
Date: Sat, 30 Nov 2024 12:10:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_041057_039898_51870332 
X-CRM114-Status: UNSURE (   8.33  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> In the upcoming hardware device group abstraction radios across different
> devices can be grouped together to support multi-link operation and register as
> a device group to mac80211.
> 
> Currently, ath12k_mac_allocate() and ath12k_mac_register() are part of
> ath12k_core_start() and ath12k_core_pdev_create() respectively and are based on
> per device (struct ath12k_base). These APIs can be decoupled and moved out to
> ath12k_core_qmi_firmware_ready() itself. This refactor is helpful for device
> group abstraction when mac80211 allocate and register will be changed from per
> device (struct ath12k_base) to per device group (struct ath12k_hw_group).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

fc38e9339c47 wifi: ath12k: Refactor core startup
016abac20b83 wifi: ath12k: add ath12k_ab_to_ah() and ath12k_ab_set_ah()
17dd22aff527 wifi: ath12k: add ath12k_get_num_hw()
45e72c306c08 wifi: ath12k: introduce QMI firmware ready flag

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20241128165026.2618331-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


