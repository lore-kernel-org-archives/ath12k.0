Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD511C3DA7F
	for <ath12k@archiver.kernel.org>; Wed,  7 Aug 2024 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Uw1davilh8AQOD9rFxYqd1LTtcZnl1l6TT//OYdeSo=; b=En/ahm7l45hIPyiB7EjJJ+1gm6
	1oCMfUHUkkplRgmsrrXprmQbuhPbLNXuDwrCJxvY5WvFJGQzNVHgVzdU1805k53zuH/PgAqEHpXIa
	y2aLacImz4vrfBjjQvtvxGBfOeEl2vDStN4itzymHc9RDX3m5ELJ9pOk6QV0tvzF+vADjgzR7Rumu
	nmlvWzFTRNNUqoZ47UtZY7XTA5t95B4bLgdiH3fmp3eMnFPOyxA+J3hevJy26Nt4iJe5uKOYjGUCK
	l074fLNtYZVd0+dW28lClgKAXw5ZYb2CY9HhSaG+Hy2CLbIkxjug3cLdhNJPsnW8I68nYLxHCvMyB
	5Gq4pCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbk4-00000004JXm-1PhU
	for ath12k@archiver.kernel.org;
	Wed, 07 Aug 2024 08:09:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbk1-00000004JXO-2ay8
	for ath12k@lists.infradead.org;
	Wed, 07 Aug 2024 08:09:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26D87CE0FEE;
	Wed,  7 Aug 2024 08:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA98C32782;
	Wed,  7 Aug 2024 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723018190;
	bh=udMylYuK8HYXdKoGhrjwWETQV3x2IYojbCwCuoIuW8E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VX1CswZC+CBZs/Im/HFRDf85cQOPfdL9DycPI0/mWqS46tsdam6eeXDEgRV3v63d0
	 HFVQvYXTW9AMsJQTdyPj93j3Kz+jJ7yGNJu3IJA8B4Xv1IJXZNCcXcB8qzx08PYixn
	 9r6Zs941ZdBlUE+pu/esW1kgxQ0sAcgH3SIOTcpAkHnMatSVJMG1Z9JScUc3p8WzrQ
	 mx2lBSt6yYLBnYxaznoX3OhHBJsDcpgqhyCUIRIHkTciK1uM2lm9j+N+gYszcjWfW2
	 OxvEpkxfFePyxzXhC60rND9hQG0nvf49bUuZRo4R2sviUjT9mPH77joOkNwuoQSsvc
	 3w4Toe2JbR7lg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: restore ASPM for supported hardwares only
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240709055817.3371406-1-quic_adisi@quicinc.com>
References: <20240709055817.3371406-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh
	<quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172301818779.3837211.5023880648651887884.kvalo@kernel.org>
Date: Wed,  7 Aug 2024 08:09:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_010954_093130_CE750A63 
X-CRM114-Status: UNSURE (   6.23  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> During PCI based hardware device start up, ASPM is disabled for all. And
> once firmware is ready, it is restored back. However, not all hardwares
> (for example QCN9274) supports ASPM. Hence there is a need to conditionally
> restore ASPM back. Or else, for such hardwares, issue can be seen during
> sending and receiving packets.
> 
> Introduce a new hardware param supports_aspm which identifies whether a
> given hardware supports ASPM or not and then accordingly restore it.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8be12629b428 wifi: ath12k: restore ASPM for supported hardwares only

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240709055817.3371406-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


