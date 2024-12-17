Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3380CE7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGhL8Fh83AITKMRhICTYeddzawJpL5/I6SogGzX+/ms=; b=AvvBhWRWfECaJ5KS39psCp62kH
	Sy9t3eyY0O8HRpEkf1hDSg5qwjUQWYa2GIcnP4Xe4VfqUoLMztq0r5TsogxQZTzxTvqdfltZ93c7l
	BRrA90sE1ZD+5VWsn/7BcA8WY9TwJ9iGovwAvOsbUFzghassnc76mhHo6sAyUVKQHonzi68PfdN0y
	nAISaRTOwzZVsIavl75AOP09tbrt+c5zo65aBqL/DLDMm1vN8kjjiXb2Mtf0pnO8RKnBewguo1lVN
	5iq4tgnPRZVEkyjyBUENdc7RLeYWKniacWuMG77dJZr6NTepuABvO1k4efbQOuvGY4P0lflNc4VFm
	4VCrmvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdMr-0000000Edrz-43Xq
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:36:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdLr-0000000Edir-2i8M
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AABB7A41F55;
	Tue, 17 Dec 2024 19:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781A2C4CEDD;
	Tue, 17 Dec 2024 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464125;
	bh=ycbw9ZuXw274TIKiy7rOq7Ni2L30dyQsud/JiF7653U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZFAOu9QAo6V10O8NfAEPgEho5N79QyIhmYY+9gIYLI+1ybCodqXG3CLkXjsK/2fLA
	 8i2J+88zYalGaaIIoz75hIrZS0o5KL/4aS9rbl9lqbm1Uo66QF9s3Ys3ZlMeBuoi5M
	 6Dp1AF0+ZHUMN10KwPN7nKcq9Ufqj282ARDPcCvHGNlekYLwpAdKGflXJafZokEOWD
	 QZri4OjB6iiydBFdKsWLiUqjLFZV3O7UIYiSJ+dccnRE6AY2AZOy171ZKCTDHvqUpx
	 /pJiHyW8kEaw8i4VMocO4NZZBF+jz1eA4bKRqVjwVhulbPc4DKrA0VgsVEFfK6vkFr
	 q6W2YJ4Iaqe9g==
From: Kalle Valo <kvalo@kernel.org>
To: Praneesh P <quic_ppranees@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
References: <20241204071238.948885-1-quic_ppranees@quicinc.com>
	<87o71bmwoe.fsf@kernel.org>
	<fda72aba-f878-426f-b410-a4cecf77d1c3@quicinc.com>
Date: Tue, 17 Dec 2024 21:35:22 +0200
In-Reply-To: <fda72aba-f878-426f-b410-a4cecf77d1c3@quicinc.com> (Praneesh P.'s
	message of "Tue, 17 Dec 2024 15:00:48 +0530")
Message-ID: <87ldweksqt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_113527_755488_80B6852F 
X-CRM114-Status: GOOD (  11.28  )
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

Praneesh P <quic_ppranees@quicinc.com> writes:

> On 12/16/2024 9:45 PM, Kalle Valo wrote:
>> P Praneesh <quic_ppranees@quicinc.com> writes:
>> 
>>> There is mismatch between the format of monitor destination TLVs received
>>> and the expected format by the current implementation. The received TLVs
>>> are in 64-bit format, while the implementation is designed to handle
>>> 32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
>>> for parsing 64-bit TLVs.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> What about WCN7850? The commit message mentions nothing about it so
>> I
>> can only assume that this breaks WCN7850.
>> Please remember that ath12k is not only a QCN9274 project. If I got
>> 0.01
>> EUR every time I say that...
>> 
> This change is common for WCN7850 and QCN9274. Sure, I will add
> WCN7850 tested on tag in v2.

I am not exactly looking for a Tested-on tag. What I'm asking is that
people take into account WCN7850 when designing and writing patches
ath12k. For example, is the firmware interface same and similar
functional differences between supported hardware families.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

