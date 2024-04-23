Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A3C4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9vRUuLPnnTeGsk5QGE2vszeG8HIHYIiV7CeDWxr8cg=; b=SUTIJ+weliYKfO0zvpTJ6QsLan
	aFyJFXw5dx8uhoxdYT7VamU9J+utqqrcpetKVd3yr9JG6dcUpg+kBLU15fQe6VXbrtIRuQcBI6r+z
	ZYPl81VUoS4eLDPOFmOKdFSFsxTSZp03uubkjZj0LP8j+UjF91LtBUvVKJF+fCPuXrOtmjeRHeF12
	PnVdcJI57eGmUb39BIDxlZwmC0bs4pFEzsiNHC3q3LuQWFh45cfTnz4pSK5UIsLZtdAR15/YVRP2w
	VbMKQ34NjiuBA8cg7UiUks502sK0Ht5z5yJnJegknsCpCnAPFeUtBznfSpY1TdH481XZJuLvTiSXK
	KWCcXrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCRO-0000000GfSM-2Cf4
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 09:27:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCRJ-0000000GfQ7-2Gcp
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 09:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52E15CE0AE8;
	Tue, 23 Apr 2024 09:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F9EC116B1;
	Tue, 23 Apr 2024 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713864466;
	bh=ECWTb2iE+CGBQc8OeI8roPjx2FSWW579wCFKlUd/JVo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ebe3wOk2BP6th2xKZ58hHBzDRuuhSpeUKE1BzA8siqnB79eZ0bQz6L7R0aOt7Em/G
	 5KIGGiqj9QsXXCurBV1mN+zeqspypzKwK/CzPFGmAxEglRA2O/UTUIGjY0daKgLWeH
	 1yfCU4FpXjALHinBcabWahhkeEgOELow/x/px8ywJNfUrlsU6LyhrgcmexznecRkmd
	 gZcLAm552qoXMJCT/TYV9JwwQjz9ooKuaHPpJ0q3UIoGKkKYNWFtTHbg5B0MkYFfZz
	 B+XeY/Owo9EjNyGTqxQlqOvJjk++6DlIRWsTEoYJp3DWyMx6sYp9EmNqnYba/a5mRv
	 GaCrLW9Zl9H+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/10] wifi: ath12k: rearrange IRQ enable/disable in reset
 path
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240412060620.27519-2-quic_bqiang@quicinc.com>
References: <20240412060620.27519-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171386446361.1790113.11680836995300295379.kvalo@kernel.org>
Date: Tue, 23 Apr 2024 09:27:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_022750_629334_CC685186 
X-CRM114-Status: UNSURE (   5.78  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> For non-WoW suspend/resume, ath12k host powers down whole hardware
> when suspend and powers up it when resume, the code path it goes
> through is very like the ath12k reset logic.
> 
> In order to reuse that logic, rearrange IRQ handling in the reset
> path.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

10 patches applied to ath-next branch of ath.git, thanks.

c7b2da3c0a57 wifi: ath12k: rearrange IRQ enable/disable in reset path
b8b50a489d51 wifi: ath12k: remove MHI LOOPBACK channels
8591b2baaee4 wifi: ath12k: do not dump SRNG statistics during resume
1623bf78c846 wifi: ath12k: fix warning on DMA ring capabilities event
7b3d4eb283d2 wifi: ath12k: decrease MHI channel buffer length to 8KB
692921ead832 wifi: ath12k: flush all packets before suspend
b1c9992c675b wifi: ath12k: no need to handle pktlog during suspend/resume
2652f6b472ff wifi: ath12k: avoid stopping mac80211 queues in ath12k_core_restart()
8d5f4da8d70b wifi: ath12k: support suspend/resume
2b0028458996 wifi: ath12k: change supports_suspend to true for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240412060620.27519-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


