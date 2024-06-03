Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373C0C25B76
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajxqbOIlQf4ZCBIRR/erADUL9o2yEbHEZf5ZNM2up2w=; b=dx61aI5n/B2vxnCeFtfYOEMjXY
	+93Js2QrabapaBjcwM52lolDaFw7oKsIeqx74Vx3oRpyLSgQUFx4L4RFpfEBvapuqq/67KFKdho4m
	QVDrBRiMLP1B/OvuRGrlwq5fi62g4R2sSipEiyaLxGWlnoxLb+LkPk5xtdIkngBeOHgF7RDuPn/i/
	9KG72YzdE/kBmp5dGtXv0z8PYgvcN8pZNa+oU9bq4OWCgdqQuxIfljUsmqjmPeSAZO7aBy4XGF9Fj
	/JdC6y3cYBBd+mO0oNijXxjQ67phSFAI6bNGTAFSxUJ4G5AoLXWEaSRvNHyrwswg92UK0P6Qeds5J
	/KMGRgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Vx-0000000GrzU-3hh5
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 13:14:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Vv-0000000GryL-0mOl
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 13:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA90460C51;
	Mon,  3 Jun 2024 13:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89381C2BD10;
	Mon,  3 Jun 2024 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717420453;
	bh=WW6dGlXKLeOoL1hqzQ1d1JJ/1RgcIKTS3/T/1bLcvQQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ggo1yQBkBMceBtsQBu1YGjyZi0AGqHJaMcrf+mTYNlEzR04198TBXrArF9DxoeDMd
	 553N7gp2NhMJNhNZmEsyQgu+9ccRC3P4wsFeX5STZe+h3kE5ZixBX0urb7uZxpvG89
	 ZKpf7YpSPfaDb65KkyOVTSBECLqqXxnq4e+7ugA4oMGGGHEhYvlwSscmqmcaKcXMd0
	 PdyZ2oRUOY+o2PvAKshOBwPLU5aQQSiZ+j+zTXGx6a+evbd9Bllxn05+WL8fWlEYgO
	 f/ms3yz995os8/qun7PI8KR/ls86qSx58DgiuieNEtlhVkRmwoSZ1qk42qpVVgdl4M
	 HrzKP3IrQz9TA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: add panic handler
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240529021533.10861-1-quic_bqiang@quicinc.com>
References: <20240529021533.10861-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171742045096.1515473.13427996557283949873.kvalo@kernel.org>
Date: Mon,  3 Jun 2024 13:14:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_061415_330941_CB1BB44C 
X-CRM114-Status: GOOD (  12.19  )
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

> Currently for ath12k PCI devices, firmware could be running in one of
> several execution environments, e.g., PBL, SBL and mission mode etc. Among
> which PBL is the only stage where PCIe link negotiation could happen. So
> normally firmware runs in PBL in order to be enumerated during system reboot.
> 
> However it might not work in kernel crash scenario: ath12k target is not
> found after warm reboot from kernel crash. This is because when kernel crashes,
> ath12k host does nothing to firmware. And during warm reboot, WLAN power
> is sustained. So firmware is likely to keep running in mission mode throughout
> the bootup process. As a result PCIe link is not established and thus target
> not enumerated.
> 
> So add a handler in panic notification list for ath12k. When kernel crashes,
> this handler gets called and tries to reset target to PBL state. Then PCIe
> link negotiation could happen and target gets enumerated.
> 
> This change applies to all PCI devices including WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

809055628bce wifi: ath12k: add panic handler

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240529021533.10861-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


