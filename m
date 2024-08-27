Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A3C5320E
	for <ath12k@archiver.kernel.org>; Tue, 27 Aug 2024 07:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5vvbYmxp5hwEF1nbOL23vruQUfxpseVZhywwx1V2Bw=; b=zcDGNkXnE3IVF/ShdBnCATad3I
	KUlU+E70/apggMt5yf8uZDJlnMTsfnkQikw3TcTJLee+eYyqqOLTwD8iAHYueN+oiYio/pjdaB0WW
	mT8/h+g/49rdOpiuq8RPArcoqdAKdpav96ydK74dxFYqFrDyWp6tfyhODVc83V5gUTA5u2PYtfD1I
	8ThOv1xj2kMIMxA3DX/EHqGW64YPgmiqqJ5OYcsmkXFLqCJ6Vo2AqwfK3GBSWjRzMB+9OyxEEi77S
	yXxqeyYeHJE8Yvj45tusKY3Y42wcq8ESRFNCclhQADT1q9lR+CLj3k4mHVJtkb6KbzT6c6ANFOMg/
	29ilmbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqaW-0000000ACfb-3Qp5
	for ath12k@archiver.kernel.org;
	Tue, 27 Aug 2024 07:26:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqaT-0000000ACeb-364y
	for ath12k@lists.infradead.org;
	Tue, 27 Aug 2024 07:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D416A41618;
	Tue, 27 Aug 2024 07:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B09C8B7A0;
	Tue, 27 Aug 2024 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724743556;
	bh=UxIqPjbE7yc2BSiMKNN58LGK55SZ+G7dzpy1yF5nK6Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pp29kis8SwjoE4Rz3yn4HB7huYcr9vqqp9T+mr/VobH5QLCCgLZ3+OiZm7KWO7q1Z
	 lxsKOOzQKMEng9/GVjHj0C5+J1MRLhL9jsRi+7cdGnR7sIAeqyz67Dj8bEKWOdnc9k
	 saXRXR9ygB+ULqVKF8P3+xbb3BiguJWFJWAyTYSDCi9YMg+zgYdqwbqavc+ODNSk7t
	 v8tdKoGydOeLNHGL+7e/3E0kR2eFZN4cqby7Z50NY006hscbjfO986CarBGqmLCTYo
	 TU+0dgsU5Pistq/lxmPi4Fm/M+991yG6zCTPrYtUvTeVdSGAPZKz/hrIphvtz8nKDl
	 fsAtpyhh8Ss0A==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] wifi: ath12k: Introduce iface combination cleanup
 helper
References: <20240814103423.3980958-2-quic_periyasa@quicinc.com>
	<172434561175.2469785.10367608474646125650.kvalo@kernel.org>
	<68bf6f43-d851-f2a5-54db-61538cfb46ce@quicinc.com>
Date: Tue, 27 Aug 2024 10:25:53 +0300
In-Reply-To: <68bf6f43-d851-f2a5-54db-61538cfb46ce@quicinc.com> (Karthikeyan
	Periyasamy's message of "Mon, 26 Aug 2024 11:34:16 +0530")
Message-ID: <87frqqv33y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_002557_858876_53BADE9A 
X-CRM114-Status: UNSURE (   8.60  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> On 8/22/2024 10:23 PM, Kalle Valo wrote:
>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:
>> 
>>> Introduce a cleanup helper function to avoid redundant code for iface
>>> combination cleanup. Remove the cleanup code from
>>> ath12k_mac_hw_unregister() and ath12k_mac_hw_register() and replace it
>>> with new cleanup helper function.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>>
>>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> I'll drop this patchset because of MLO cleanup.
>
> This change not related to MLO dependency. Its a basic to group
> multiple radio under a wiphy.

Ok, but it's still good to look at this together with rest of the MLO patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html

