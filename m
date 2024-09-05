Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E95CD6E56
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPd4qwGCvARzA3GK46p7l/oeEAz8WRcetFn1v4iPxNo=; b=f8qOFVIGZcVGkecqq0dvZlEmxQ
	pWEsRclKdlHUWzOmUpWFwqT0ERJG6Ie/wtl8Vhgwa6blxfkrek/cshUp6L2NgPdJNrClZj/2tbTxZ
	jjoyRa95zASWHHv6JUjnCPjHTwshNyjf+LZ/Q+T4Hoi8VxqvCvmC0LiFbYyCnDNLqMEmfjHmVZ2yO
	sqfBUASd4PRllZbQPsitc+rOFTBGrCes3R8h1NLnQLeqjp0xI3dqcnnHy9wXtuRsnNFi8zrScKvGr
	vULePiC52U5BTCFq5Pvc1wPVNRJAaG9Mc4YyNLOQZ1DqB4oQTAmpUlAHUpao/q7YvPipnB5h0ayK0
	FfRcDeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFja-00000009CHZ-05Ya
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 16:53:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFif-00000009C7r-3gvb
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 16:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF32DA44E16;
	Thu,  5 Sep 2024 16:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C811C4CEC3;
	Thu,  5 Sep 2024 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725555149;
	bh=f5RnDW+SslH2BteySC4zr7oSDiqA/6lUXefA0ljak7U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Q4EqXz8JYwhmWW3wGAXf0yqaruDlzladCVzw3VNU4NoyQFqATZhd49P7Ajh6wKS7U
	 WiAUQAyj13vxMpBZtiWEiHgrAery6+2hwBJs4LoaPtkAVDFXmFvR9rV0qukd3VUL3x
	 1VhG2EhohM47nrxJVwwiRB5hYLRqqgN5XHUmzhk6CQGt7Eh6081zCB3lGr6QuHVcFr
	 TvMZr3gxlvxNMO5has9KG4jBk+zoNeMK8RbK8sqlMKE6ZyNtElNtOgeBLI5FMpolM4
	 9Rf9tsdanGGtz1j96dd2nK5rr27rkpyDnXtTKY5beUmIiETzelLXMuZYHK75rPCPsA
	 vetfFbnqaMRsQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC 1/4] wifi: ath12k: switch to using wiphy_lock() and
 remove ar->conf_mutex
References: <20240821153728.2121600-1-kvalo@kernel.org>
	<20240821153728.2121600-2-kvalo@kernel.org>
	<a1a4202f-5c10-401a-9b02-47dacb9be048@quicinc.com>
Date: Thu, 05 Sep 2024 19:52:26 +0300
In-Reply-To: <a1a4202f-5c10-401a-9b02-47dacb9be048@quicinc.com> (Baochen
	Qiang's message of "Thu, 22 Aug 2024 13:46:37 +0800")
Message-ID: <87le06hwl1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_095230_005592_19D36B4D 
X-CRM114-Status: UNSURE (   8.83  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 8/21/2024 11:37 PM, Kalle Valo wrote:
>> @@ -845,7 +845,9 @@ int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
>>  	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
>>  	int ret;
>>  
>> -	mutex_lock(&ar->conf_mutex);
>> +	lockdep_assert_wiphy(hw->wiphy);
>> +
>> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
>
> we don't need this lock because it is already held by mac80211.
>
>>  	ret =  ath12k_wow_cleanup(ar);
>>  	if (ret) {
>> @@ -913,7 +915,7 @@ int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
>>  	ath12k_wow_cleanup(ar);
>>  
>>  exit:
>> -	mutex_unlock(&ar->conf_mutex);
>> +	wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
>
> same here.

Ouch, that's bad. Will fix in v2, thanks!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

