Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8779AC47422
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwB2bT2zIvdNAmM8p2/5zf8whbiBdqOrgRJRJ0hbo10=; b=m7flBB+szXI7R4ncKxO16TaxRL
	sbxilLV6hUaaqq464CQMqJ6nNLg5TtK33GM396F4E4tc3sMG/NLVEHnrBewpa6CQFYSk+lEiCWtcs
	8iUioZoidv2uzJowe115bQj6oIgvKPoUZp+kM2URKNcba4tfEfowCawSkss8GdMxSjbZDGGv9TwGL
	BQufX0GBnovTwkM9laI+8C5QHcsmaBCVUhzNa5+N8Y2S0Mx3axIMpdhM/b/xHTNLWqMtImRxVIymb
	0d802lYnd7VJjL5jdpA1TE36Adyql8VtSnYLVhMuAnoMexyPLbRlquW9Py0+ORR7PxK0lzqmSSFhl
	aDZ1Xttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTV-009Xyp-0N
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 16:06:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTP-009XxS-0o
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 16:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0CDCECE17A2;
	Mon, 15 Jan 2024 16:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A8EC433F1;
	Mon, 15 Jan 2024 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705334756;
	bh=Cr2vcSI2SOfdEjNv+aRzgSma/lm3Z+oZzZokPDQfWSc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W1ROy/tSwtnAS7w42HTToTcmqU3CNtY4c3G+NqU60SoEN9BxlD7gahVqMvYn8/hRR
	 rZTs5EgulY5YuDjT7kQ0pLcS9znYsOY882BQT+51ox9uj7fEjKa2VHC5MMZ7Y4mBg8
	 sOBkGyNL4fYn1oSFm9d6mVqkOypnX8CowrwKYjbnD9ey7wYd5+KIXXroPgH3Bfyh53
	 5yvbDlKhc9ufDnuYMp25UqJnwtvxS/UnQLDmzSZ2NJVsm3pElKM1Yk56lG05YDcFv0
	 osgLlM64pkCbpvJSH8gNCWHjFsmyc/VEckuNAOl9jsvvFU0KZGTEGGz5QEvkKPmu3r
	 nxgkmX+CziX2g==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath12k: Introduce the container for mac80211 hw
References: <20240109051252.3325106-1-quic_periyasa@quicinc.com>
	<20240109051252.3325106-3-quic_periyasa@quicinc.com>
	<87mst67ge4.fsf@kernel.org>
Date: Mon, 15 Jan 2024 18:05:53 +0200
In-Reply-To: <87mst67ge4.fsf@kernel.org> (Kalle Valo's message of "Mon, 15 Jan
	2024 17:41:55 +0200")
Message-ID: <87il3u7fa6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_080603_639977_A504A5E0 
X-CRM114-Status: GOOD (  13.32  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>
>> To support multi link operation, we need to combine all the link/pdev
>> under a single wiphy. This avoids the overhead of synchronization
>> across multiple hardware instances in both the cfg80211 and mac80211
>> layers. Currently, each link/pdev is registered as separate wiphy,
>> tightly coupled with link/pdev/radio (ar) structure. To enable single
>> wiphy registration within the chip, we decouple the wiphy data entity from
>> the link/pdev/radio (ar) structure and move it under the chip (ab)
>> structure with a new data container (ath12k_hw) structure. This approach
>> improves scalability for future multi link operation support.
>>
>> 		mac80211 hw private data structure diagram
>> 		------------------------------------------
>>
>> 	Now						After
>>
>>  +---------------------+                          +---------------------+
>>  |mac80211 hw priv data|                          |mac80211 hw priv data|
>>  |                     |                          |                     |
>>  |                     |                          |                     |
>>  |                     |                          |                     |
>>  |                     |                          |   ath12k_hw (ah)    |
>>  |                     |                          |                     |
>>  |                     |  +------------------->   |                     |
>>  |    ath12k (ar)      |                          |   +-------------+   |
>>  |                     |                          |   |             |   |
>>  |                     |                          |   | ath12k (ar) |   |
>>  |                     |                          |   |             |   |
>>  |                     |                          |   |             |   |
>>  |                     |                          |   +-------------+   |
>>  |                     |                          |                     |
>>  |                     |                          |                     |
>>  +---------------------+                          +---------------------+
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>
> [...]
>
>> @@ -3790,6 +3831,10 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>>  	     new_state == IEEE80211_STA_NOTEXIST))
>>  		cancel_work_sync(&arsta->update_wk);
>>  
>> +	mutex_lock(&ah->conf_mutex);
>> +
>> +	ar = ath12k_ah_to_ar(ah);
>> +
>>  	mutex_lock(&ar->conf_mutex);
>
> Do we really need two mutexes? I don't see any analysis about that. And
> even if we do, I feel that it should be added in a separate patch.

Sorry, wrong version. I'll comment on v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

