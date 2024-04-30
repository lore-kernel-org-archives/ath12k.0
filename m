Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F11FC10F16
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JNa7sh2DzJRmBGvzfmVAzlW2PwZ2X/2DhlO7kkeyXE=; b=arSvshXkt8nfOKz8l3QS+13ViT
	3jrXoQqdJTLi+gAEdeDggtYkOUkC+X1UnvXYF4RG7j5j6IEzgInFw4sa93gfIK3HH1a6ubqJPcRan
	U9yeIJC8oQk4KdClGQZY9MB0n95z/Qk3NVsjxnnzgMomfBLwqECNZKIezV2ZhKDH3pd3QizcuAzja
	gqziBM0TBJECevOBGLAsFb3gxI6MTKn1Gn3mUUYszAt0kTK0g5IrV8Ssd5kceiu5Pz5p6b33oZY6d
	Rl3w/cIPDa4DE93ZngFPNFwpUQMt+tFnl4wj1KlYV/QVxPVNt9CTt7/8KTq5Z3MEAGml/UlqWWbpU
	Rf3tYmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ncm-00000006YdT-4C4D
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 13:34:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ncj-00000006Yc1-1w30
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 13:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 066E9615D4;
	Tue, 30 Apr 2024 13:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF01C2BBFC;
	Tue, 30 Apr 2024 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484053;
	bh=wzkgOC/aglpW7s76rCyOHqSnMmdZuP+WCPsYrPnKeCI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OAqdjBUkiwsyC1dBNip2NOKXIgcstY8Ih155Gn0+4H5UJa/jTkD+/b2g6q5NJk7kO
	 mK/1s4bZV1gdIe0bHLhRl3sR13y8Gmrol5uAiLWfcMIfIXftAW/QoVR2CZ3J56QaXR
	 mSlbksess+JMZvgJnGBgAaYFtAcWbk8WfjxJT5d/hY5anqkIDNBvzIqYJ5QcgUldho
	 DKYwvDbi4xEM5iWcH7+fyoBeq5o7YMA9zp9HUg3X334KqV4Sr2NcjnuQhGAHbJgIuJ
	 LiQjhd2AeteON3Sk5rLKJmx5WpFU6p8d7S2TTYChCGOGrkLTwB/j63crv7uIj7hHb7
	 3/Fm4fLRrD/jw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: check M3 buffer size as well whey trying to
 reuse it
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240425021740.29221-1-quic_bqiang@quicinc.com>
References: <20240425021740.29221-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171448405111.313333.6267220944906708635.kvalo@kernel.org>
Date: Tue, 30 Apr 2024 13:34:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_063421_642853_19B2C5EA 
X-CRM114-Status: UNSURE (   9.67  )
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

> Currently in recovery/resume cases, we do not free M3 buffer but
> instead will reuse it. This is done by checking m3_mem->vaddr: if it
> is not NULL we believe M3 buffer is ready and go ahead to reuse it.
> 
> Note that m3_mem->size is not checked. This is safe for now because
> currently M3 reuse logic only gets executed in recovery/resume cases
> and the size keeps unchanged in either of them.
> 
> However ideally the size should be checked as well, to make the code
> safer. So add the check there. Now if that check fails, free old M3
> buffer and reallocate a new one.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: 303c017821d8 ("wifi: ath12k: fix kernel crash during resume")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

05090ae82f44 wifi: ath12k: check M3 buffer size as well whey trying to reuse it

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240425021740.29221-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


