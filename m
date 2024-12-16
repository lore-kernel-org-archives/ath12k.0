Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D00E7717F
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtNCEoNOdYL9TxqRFTgofJeb1Jw1qiA4dr/cMEKkzhs=; b=BtXdIRXhZVR2EHqP1lI7xpMRY4
	58xO35jev7JHpKhMWz7ZNYtBzcWSOjgRnP0bbnx262YkSmdL9MJbUQJ14g2bkj1ABsTL0NKXv0jwD
	c3bCoLM43uLm/DOU8BiQmIIS+xLzYGVvMc1PBYRnUqDNVKoAmfPl74IfcpPNGTZqfKaCj+A/ulXiq
	dRidpZJhjx/pWlKvrFqq8L75OjlAGVvQ3uUpalmPAA9QA0fRhcJ1ejCCGmb+aVrLg8ijjNRK2gcee
	ZGHjptMZ2RTW7I9pmcDBhb3zF6Ajyq5N7Cr1l7gIqEh8e0h1OGCCiINc1CVDyoabF6fZTYHMpTbCe
	Lb6UxDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDke-0000000AXaO-2FmD
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 16:15:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDkc-0000000AXZo-08vw
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 16:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2A06A4186D;
	Mon, 16 Dec 2024 16:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD12C4CED0;
	Mon, 16 Dec 2024 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734365716;
	bh=kQc4WqYLikLO8KzFWTQDDqCMkg1YfUkr5b9oT4SpHK0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iYLJLmCgvTP4poWfJGSsryZPzGVH2CFGrw7dhL16sSbZmY8Ek1nIoI+7C+n1mItpn
	 CK8XFNuV7fXSjzo7UZJ1obzjV2fi18EVeqoLHU7IhWbs1dHcIXthysSYMchaovWrjw
	 dQk8Ldm2SRmI4An4vkZ7bv8IlcNHDzoAnPOjX78scqDo1AjZR2FCUGUbV8JhpEshDT
	 U/8t4JTBVbQ1a9FkWNStQUacUVqHsvZ4SGk54AWRzbx/9ADYn4urq6MkBiXhHoooAj
	 J7GNhJWo4O3a9nNCRKARrsdvrMpQr5nH9tgzXM6azLtDc0f3egLGd98qQiW97Q0DX1
	 s5gqDu+SGstow==
From: Kalle Valo <kvalo@kernel.org>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
References: <20241204071238.948885-1-quic_ppranees@quicinc.com>
Date: Mon, 16 Dec 2024 18:15:13 +0200
In-Reply-To: <20241204071238.948885-1-quic_ppranees@quicinc.com> (P.
	Praneesh's message of "Wed, 4 Dec 2024 12:42:38 +0530")
Message-ID: <87o71bmwoe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_081518_136146_F41F3342 
X-CRM114-Status: UNSURE (   9.84  )
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

P Praneesh <quic_ppranees@quicinc.com> writes:

> There is mismatch between the format of monitor destination TLVs received
> and the expected format by the current implementation. The received TLVs
> are in 64-bit format, while the implementation is designed to handle
> 32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
> for parsing 64-bit TLVs.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

What about WCN7850? The commit message mentions nothing about it so I
can only assume that this breaks WCN7850.

Please remember that ath12k is not only a QCN9274 project. If I got 0.01
EUR every time I say that...

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

