Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB695C47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b6BMc7fZmJ4185Kw0xL6C2oGPav/1Fiwy/4RjwKke4=; b=GM4vbK/OW2gxHhtIwTESpp8ZvT
	585+3quZvHx2+cPrkbgWVuq68mINTv3osmNLON197ZRaR/YAK2TplTbj1F7e+gIU4KPr5j9Yz1gsO
	j2VDNwsjGGFLU5b/qUfH0YHIfni3OP16wG9AxLEatJq5MXgPXZNylkOZsqM85BHtyvFUDzr9Haf5J
	FakygWU/gb7eQPLVbV+DvZcX6SzrwFbDYNxFbl7zAHdUJYY4jt1qALgceyMMFK3P/JHfCpJcnQk9p
	D+Q9pVLzCXTvbODWbXuYMaGM3qMjldbEYCbIYL1MfegjsfJW3I9FwLSNWn4dxSLEsL5kbSFlTQm3S
	/YUqWF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPii2-00C5ln-19
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 12:38:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPihz-00C5kv-2L
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 12:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07C1361220;
	Tue, 16 Jan 2024 12:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E566DC433F1;
	Tue, 16 Jan 2024 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705408702;
	bh=S6/7lJVC6JILhB6Z5JfqKG7z1YHe5+sb8EPCR03iwBs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aE/VGly+K3q+TUPcQbNjHu8JrOeStWaF4fmKAnKbgeqDpTmd423cR7Vrjp/awL9cn
	 opI8mPB7NZ792DQSu1vdkx9lobIhLLDQKP3HEYnj76kO4zTbMmv0KfKJGCh/JocS4E
	 mO/cm7SFhLDAv+r94GfMyOXY/lsJ0TJ7o3Qu8qyPl+hxipzAON2xr9S8GdxoWsGqUL
	 qVHRfE2pJyETPDAro5zInLDfOyhJ8n2Qek//HsOZyhiqetgBZI55gh395snFept1bc
	 vTETg3R+K9lFv7teut9KiFUrk6fN+RupQm+spZ1Yw3Gu+trd7T8bUK5GMWPhkc4m7f
	 Xdl7xNFt3eZxw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Introduce the container for
 mac80211 hw
References: <20240112024214.3481840-1-quic_periyasa@quicinc.com>
	<20240112024214.3481840-3-quic_periyasa@quicinc.com>
	<87bk9m7f5g.fsf@kernel.org>
	<839b56fa-9ce8-47f3-768d-b4f32a2041f1@quicinc.com>
Date: Tue, 16 Jan 2024 14:38:20 +0200
In-Reply-To: <839b56fa-9ce8-47f3-768d-b4f32a2041f1@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 16 Jan 2024 10:44:46 +0530")
Message-ID: <8734ux78sj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_043823_803919_9C918347 
X-CRM114-Status: GOOD (  11.90  )
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

>>>   static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>>>   					 struct ieee80211_vif *vif)
>>>   {
>>> -	struct ath12k *ar = hw->priv;
>>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>>> +	struct ath12k *ar;
>>> +
>>> +	mutex_lock(&ah->conf_mutex);
>>> +
>>> +	ar = ath12k_ah_to_ar(ah);
>>>     	mutex_lock(&ar->conf_mutex);
>>>   	ath12k_scan_abort(ar);
>>>   	mutex_unlock(&ar->conf_mutex);
>>>   +	mutex_unlock(&ah->conf_mutex);
>>> +
>>>   	cancel_delayed_work_sync(&ar->scan.timeout);
>>>   }
>>
>> Do we really need two mutexes? I don't see any analysis about that. And
>> even if we do, I feel that it should be added in a separate patch.
>
> Yes, ah->conf_mutex protect the concurrent mac80211 operation. But
> there is other places like radio/link specific synchronous operation
> (ie MGMT tx wait for the vdev deletion) is needed. To fulfill this
> need, we also need radio/link specific (ar) mutex instead of all link
> (ah) mutex for efficient lock/unlock.

Are there any numbers to show the inefficiency? Anyway, I consider
adding new mutexes as an optimisation which could be done in a separate
patch with proper analysis.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

