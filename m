Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDC1C4345F
	for <ath12k@archiver.kernel.org>; Wed, 17 Apr 2024 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWRlsweoeTVXDpuOAqP45i83gOg2xfecmbpS+uia0qg=; b=PmZPi6zpn0j/kYNcbumrAohIsP
	is75gxYg/KIC2hj2EsCZGm8qtc36ag5t2OI+i4+AKR09Lk/0pKSrhpqqBxqKNiUJniTHx/cUhIqc8
	JRE9lNJBlFNUr3WrdM6JOMnbSb9KZMXQ17r2q6xBSR9/KwDQtmo1Ufze1Ey862RPpbo5dy8LG05wZ
	3fRvcJzHRIBSycoef+cqVWBDvQGmzByoUKKQMqdzeKug3i4GwEWBFOirjFLwRjtKE9f97Om7I3LUG
	1gjDk902FGyYcXgUfQC0B6HbW/wBU63gTcdu0wJC/o7yQlwRKSvUPl+pkT82YdkBQdg0chzPs77yD
	+YVQbiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6BX-0000000GKTh-1MjU
	for ath12k@archiver.kernel.org;
	Wed, 17 Apr 2024 14:22:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6BT-0000000GKTD-2kiU
	for ath12k@lists.infradead.org;
	Wed, 17 Apr 2024 14:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12DE46142D;
	Wed, 17 Apr 2024 14:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79C5C072AA;
	Wed, 17 Apr 2024 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713363766;
	bh=h1ZKhUHRAA/7rGO40L17WijIMpSW0//PNJPxU+MELtI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YBh2soYKFd6gFBPbsEczZTamnMWHUvjGMfxHklgeGzfOQJwVnjDy1SVnH0Yk/4T//
	 mx7JariBsi/IPzmNRGKiMDIWTLAt2Trw3RJIFK9vL44k7T9guFCXs1YONA+B+XDBc/
	 sfz9gfesFmjJPBxpToUwuuRFnIagmw3Cs3zy9mN0W0/0t/7ARddnjQsl5pIUlsU4KD
	 e+9e5WXhrbLPhSY3BfCjY+PMxaKxYEfIpPWZyinpIbBpDCWZcMNsC84qEmePtXcHRB
	 8s7k+J1yqRfAG+xW8SG85tGeMSkas/bP4TBBs6dI957sLjSOaTxY/dLyRZUelsJHCH
	 j7AFyJkeu6/gg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 00/10] wifi: ath12k: support suspend/resume
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
	<aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com>
Date: Wed, 17 Apr 2024 17:22:43 +0300
In-Reply-To: <aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com> (Jeff
	Johnson's message of "Fri, 12 Apr 2024 11:05:00 -0700")
Message-ID: <87r0f4vzkc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_072247_758605_A17A1DBE 
X-CRM114-Status: GOOD (  12.73  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/11/2024 11:06 PM, Baochen Qiang wrote:
>
>> Now that the MHI&QRTR patches [1] are merged, we can add
>> suspend/resume support for ath12k.
>> 
>> The whole design is quite similar to that in ath11k: firmware
>> is powered down when going to suspend and powered up when
>> resume, this makes hibernation work as well in addition to
>> suspend.
>> 
>> To summary, this series first does some preparations in the
>> first 8 patches. Then in patch [9/10] suspend/resume callbacks
>> are implemented. And at last in [10/10] we enable suspend/resume
>> functionality for WCN7850 because it's the only chip supporting
>> it for now.
>> 
>> [1] https://lore.kernel.org/linux-wireless/20240305021320.3367-1-quic_bqiang@quicinc.com/
>> 
>> Baochen Qiang (10):
>>   wifi: ath12k: rearrange IRQ enable/disable in reset path
>>   wifi: ath12k: remove MHI LOOPBACK channels
>>   wifi: ath12k: do not dump SRNG statistics during resume
>>   wifi: ath12k: fix warning on DMA ring capabilities event
>>   wifi: ath12k: decrease MHI channel buffer length to 8KB
>>   wifi: ath12k: flush all packets before suspend
>>   wifi: ath12k: no need to handle pktlog during suspend/resume
>>   wifi: ath12k: avoid stopping mac80211 queues in ath12k_core_restart()
>>   wifi: ath12k: support suspend/resume
>>   wifi: ath12k: change supports_suspend to true for WCN7850
>> 
>>  drivers/net/wireless/ath/ath12k/core.c  | 108 ++++++++++++++----------
>>  drivers/net/wireless/ath/ath12k/core.h  |   4 +
>>  drivers/net/wireless/ath/ath12k/dp_rx.c |  48 -----------
>>  drivers/net/wireless/ath/ath12k/dp_rx.h |   2 -
>
> My Qualcomm Innovation Center copyright checker reports:
> drivers/net/wireless/ath/ath12k/dp_rx.h copyright missing 2024

I fixed this in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6b928df55a671d2c9a15edc746f6b42ef544928e

Jeff, what do you think of the patchset? Is it ready to take?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

