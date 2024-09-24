Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ABECF9C6B
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx5Y7JgKOK1uRExEWKlQz1jiXuygi1eUAT04rWF+9Kg=; b=X/IE2OpDUBmoFhW7TIoAN1+7mz
	QMGovtPSCNzjYsowmhGJCqsFXWUEgb1+cU/B5TRiCurTqPOOXHAuUjuUX7sYXIbR2/wErTlLxbeGd
	/DQE57KgSp+PwlrKrZz7+iXEmG0dlnB0t042cAY2NZG1yEk189YSPiQmBE7lyjDpdE5V1dtK0NCbO
	vkLraf6J7pbXJOMqbWTz1qRq7UoDkFY0sNAUWgZ3G7bXzB7uKo8xNOH1VWTYijBUner/ZfS/CD8JX
	7dDnYpwYrO1fTT+nILBL0guRgSEnYuFTAXpSJrZjB4azqDEbG1B9ek6tZ7/ac5bdvet9CplL4UtTW
	DpE2LLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2Tb-00000001wu0-0vTs
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 10:08:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st2OX-00000001vMl-1bKc
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 10:03:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D44D75C0C37;
	Tue, 24 Sep 2024 10:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC614C4CEC4;
	Tue, 24 Sep 2024 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727172224;
	bh=ShGbu8Qt1hiH26jaSyQZaGCXLqy48t6HW8OjvCJTT7o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KMzyiYxPKj5nflUq3KlEl9JUV3HUAL+zMLNWfxuqLyqWzZyVT4beqrvWeApy80on+
	 9af49WN2urTaa/JluZj9gdWm7Ny/6xiCFzbZSHuAjoAOysWD7y3sRImjW1vn+U+E/p
	 iVmTuuxkWhuJwv5vJPOFuYhEsMqcsXJKXGeiQ0kf+eZd3d4Zp7+vx1ya3JTty+0zUv
	 biEJDKRj2wHpkXFRHFiLTm87ScomcByNAhGGtAy5SqKSZE16/z6mF61Au14djm6jla
	 7jA1njC9Fr5n8sncBNL/6jACqyAcqSd8j3DTcCpGo9oHIZUhRiafFZZ2u/F0bsKxnc
	 CVhUon4dNZ6yQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC v2 1/4] wifi: ath12k: switch to using wiphy_lock()
 and remove ar->conf_mutex
References: <20240918181042.91891-1-kvalo@kernel.org>
	<20240918181042.91891-2-kvalo@kernel.org>
	<33963bc8-7cc9-434a-8910-cbcfc6fa965e@quicinc.com>
	<87setpa0pm.fsf@kernel.org>
Date: Tue, 24 Sep 2024 13:03:41 +0300
In-Reply-To: <87setpa0pm.fsf@kernel.org> (Kalle Valo's message of "Tue, 24 Sep
	2024 11:57:09 +0300")
Message-ID: <87frpp9xmq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_030345_482977_A33499C6 
X-CRM114-Status: GOOD (  12.92  )
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

> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> On 9/19/2024 2:10 AM, Kalle Valo wrote:
>>> @@ -4310,7 +4301,7 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>>>  
>>>  	spin_unlock_bh(&ar->data_lock);
>>>  
>>> -	mutex_lock(&ar->conf_mutex);
>>> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
>>
>> note in patch 4/4 ath12k_sta::update_wk is converted to use
>> wiphy_work. While a wiphy work item is running wiphy lock is held
>> already. So here try to acquire wiphy lock once again will lead to a
>> deadlock.
>
> Ouch again, thanks for catching this! This time I actually tested
> changing bitrates and it shouldn't deadlock in v3. But I did notice
> sleeping while atomic warnings (even without this patchset) and decided
> to fix those in the same patchset as well.
>
> Oh, and WCN6855 firmware was also crashing whenever I tried to change
> the bitrates. But let's handle that separately.

Bah, I of course mean WCN7850. Too many chipsets...

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

