Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50502E6F063
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yN/bAvonI4UGR6Y1mMvjtbVkIgWb4UMqOkyySYKL3Q=; b=rYnJjexX/nNFSE99rgb2H1z1gf
	VVpLo/DhEkosZtrhB0iF/kp6YGfdpQdr6Y9LmrYvo1sCiA7GNABcqvh5H+riig6I6iIUHlfgkDJ9C
	HaaF8Onslb24UH6WA7AoZfi+pmMAUr5+WtfIuxF5V8MkjEmDz3Fgl6MCtSqNMiN8yjZkpWpiElQMO
	mW2nXXe+AJOs0Lk5+4B0d57XU3ghvh7SJKU97dEBx+UNllwEupIDTcZE6jZIolx+9TIwZMTWCYShC
	GM2L3D6tPwYDXDyYHLcgoStIHMQGu+qEE5FbMo79B/9qdQIISly0qZ0kxeKbQLa+Flq6yxH8XQzLd
	vGCCNPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szK-00000007Oq2-059B
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 14:50:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sij-00000007MCy-1J6M
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 14:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A88FA5C0695;
	Fri,  1 Nov 2024 14:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC1BC4CECD;
	Fri,  1 Nov 2024 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471628;
	bh=JCP681ULLq4G4635kQjFN2HzHMMxeCdi1hW8lQkAaL0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=alNmWNl1Xtvzqsh3LTD1G8DpMAYZRLTLcPkI1NRYiFmu1mYgLGn+FzqzNAgHtaV6A
	 XU1AlmhfCx21kk+rxIa4N/xi/iPkf/BvABk1db5mQCfUjqpmolKL5ZGw0/yV3wC6/C
	 ZBEyO3CRG/m9eatf9yhjLHG8X1DpzRiP3n73EXTUHBXquBd1OqtgrekYWnzaN3Q+fy
	 aw9HvSwyL+BndDS5iBxeXlCDNofxApcAvGYmmg+EokByXYXtKsVbxpuQF8LzYGTAGh
	 vHHvC7hhtDnci42c0YCUZ5qimeCIx+wBaVOcG/W2VW8TgEjqYsM68e9VPyeWSTcYsI
	 WyyAIYdoPDMjA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 7/8] wifi: ath12k: add helper to find multi-link station
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-8-kvalo@kernel.org>
	<05f2ef12-5176-4742-adb7-04da614995fc@quicinc.com>
Date: Fri, 01 Nov 2024 16:33:45 +0200
In-Reply-To: <05f2ef12-5176-4742-adb7-04da614995fc@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 09:01:01 -0700")
Message-ID: <877c9n6n1y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073349_449689_545D45E3 
X-CRM114-Status: GOOD (  10.58  )
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

>> --- a/drivers/net/wireless/ath/ath12k/peer.c
>> +++ b/drivers/net/wireless/ath/ath12k/peer.c
>> @@ -80,6 +80,20 @@ struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
>>  	return NULL;
>>  }
>>  
>> +static struct ath12k_peer *ath12k_peer_find_by_ml_id(struct ath12k_base *ab,
>> +						     int ml_peer_id)
>> +{
>> +	struct ath12k_peer *peer;
>> +
>> +	lockdep_assert_held(&ab->base_lock);
>> +
>> +	list_for_each_entry(peer, &ab->peers, list)
>> +		if (ml_peer_id == peer->ml_peer_id)
>> +			return peer;
>> +
>> +	return NULL;
>> +}
>> +
>>  struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
>>  					   int peer_id)
>>  {
>> @@ -87,6 +101,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
>>  
>>  	lockdep_assert_held(&ab->base_lock);
>>  
>> +	if (peer_id & ATH12K_ML_PEER_ID_VALID)

[...]

> does other code elsewhere need to mask this bit off to have the "true" peer_id?

Based on my investigation the peer id is stored with
ATH12K_ML_PEER_ID_VALID so it should not be masked (unless I'm missing
something). This is not pretty but I guess keeps the code simpler.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

