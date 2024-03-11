Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B0DC5475B
	for <ath12k@archiver.kernel.org>; Mon, 11 Mar 2024 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+Xt8O4vmePKh/fBWlGJeijvIz2vZKeNzUkEHvxDdVQ=; b=0n1Q+aVL4E42qdACOQXiSbd/Q0
	PUYn9jPXgKvaMIBvEBt1XHY8jW5DGjmOUUJfspA666T95QKadoTaJ0OH/TNNKFLNW0/YPLNvbp3lx
	9X4ZlEVAuh8y2iPkw0S32t8lX5NzCGQZGuyLevts/gh4XoBCfBUgV9+tv7Z9r1sDtISBV4QGalOuc
	d/oe6boNCoTPP8YvVW3lNJOSUduzFe8M+GAYYkUpUlOe4P7o5HKGIvQ4+EC8S6dxh4Vi7KI+i4UpQ
	LcjKOqJ0lpSUd5j2KvqoyK9yPvPtksn3tHV+nc/lMK9jhUGCWMITSeGVZaRpRLTcu8wecJ6xIepka
	bFKI4RaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfLq-00000001Y1w-27lK
	for ath12k@archiver.kernel.org;
	Mon, 11 Mar 2024 13:05:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfLn-00000001Y1Q-27Jn
	for ath12k@lists.infradead.org;
	Mon, 11 Mar 2024 13:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF2C360DFB;
	Mon, 11 Mar 2024 13:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD78C433F1;
	Mon, 11 Mar 2024 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710162354;
	bh=sY2aZjoVcuD10saQ+X4Mufz+T7UFLiCtz8ISoPvBb6o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jXRZwXFNS3Ur55NfAET7PVqXesG1NUU3SDI/9RZAltqgpakO/kbF2ajVfls1mAAhI
	 S8poL8faVGFYlh8IlBXPBjC6g/zORsaWzhx8evzeMOuR5vy6bX1jxkuDyqygQSh/es
	 RAP6NcX717wu+kNSNzT6hKHHCzlo7uQhcC8/UzJGarCqrCTfcLDPdG1BxtcElEPyPU
	 7Juac/cLfso9pA0hQe56iHZH3jWKuOJxq3KZq3rhVuZUKM2iEZiSDqfcW6j4FxolyP
	 eGDpwjHyYSRarZxioLNWp9z1FCRp2xesDtrD5LrQ/wxEPEWa7x2/dEPz+F/NPp/Fw8
	 tQfkMkCpKyYMQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: Optimize the lock contention of used
 list in Rx data path
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
	<20240226162310.629162-3-quic_periyasa@quicinc.com>
Date: Mon, 11 Mar 2024 15:05:51 +0200
In-Reply-To: <20240226162310.629162-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Mon, 26 Feb 2024 21:53:09 +0530")
Message-ID: <87msr4gbps.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_060555_664705_BA064799 
X-CRM114-Status: GOOD (  13.20  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> When a packet arrives in Rx rings, the RX descriptor moves from the used
> list to the free list. Then, the rxdma ring gets replenished, where the Rx
> descriptor again moves from the free list to the used list. At the end, the
> descriptor came to the used list with unnecessary list movement. The
> descriptor used list is maintained in the Rxdma ring structure, which
> creates lock contention for the list operations (add, delete) in the Rx
> data path. Optimize the Rx data path by removing the used list from the
> common Rxdma ring and maintain as a local variable in the Rx ring handler
> itself, which avoid lock contention. Now, to find the used list descriptor
> during descriptor cleanup, we need to check the in_use flag for each Rx
> descriptor.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Before looking at this in detail: When optimising something it would be
good to have before and after numbers showing the improvement. Otherwise
it's just wishful thinking.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

