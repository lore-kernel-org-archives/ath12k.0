Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F6CF9C6B
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/Uv8N1uKRD51dBLh7kLQ6Ifk33lfW96c8sfUtT0I1I=; b=DA8zB2iLwmCN8p8OH+ti3aLWIa
	pDIDN5DB3Qh7AEK0Yw5ZkKux9ZrYKLMcwDfCEBo9J7/K9MjjMgCvBoZaPKawJHu7Va+cyMWj1a9Hr
	3Q3Pq3x0lJSHSkN0r7ptUB+dXWwv3fLDQ5nY3bBSMjXEGcuZ6yLNYrdjqhDPbNqROdzgIe+aOhvJ7
	aTdE0j+aAFDbtuUmAJzD0D9ueLZH387aBGWG5U6ZN1COwBd1iGS8t6STxOADXmRX2edbKLG8zQYuK
	Bf73BhPgdD1xTQjCE5264h28rMN5dsu4nPYYVPaLYiEWJQwbrTmCXqYBro196mJO1rxuiAKymG1go
	2RKYcCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2LN-00000001ufL-3fJI
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 10:00:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1MA-00000001gsY-0GNE
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 08:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4019A40601;
	Tue, 24 Sep 2024 08:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2FDC4CEC4;
	Tue, 24 Sep 2024 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727168232;
	bh=p85naDZaBA/vtn1u3T0+3QYlfIyugrxWm9rBRDCctRg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VhNqczD+3jXflp9zeens/XQOVn2HnvZso1NOy82kNoomERWLjdaQ+ndvyUIDdPtEb
	 rin7BVbRfiOz4tHpdRsbs0diO8duRqk0d4gGf4YC0r3LhnuzhcWVPPMJW4MpZEMja3
	 NrutGj38GxuuloccU0dqRNIJu9P8AbYBl4Lu7aIHm2GZacFwixfBifGR9IbaSYiYq9
	 j5CCBznG+c4SkVF+klBAz6SKc+3uSMR0BdHQCk1SrC/fn5V5S/Tj3tTD8ibk5wjq1i
	 9W7bDYCMiZR83nxs9/xk5saIy/rXVm5XSmiv1o1KTus6L1dss001IAlXdxbleilQZU
	 ddK9LsC/fywYg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC v2 1/4] wifi: ath12k: switch to using wiphy_lock()
 and remove ar->conf_mutex
References: <20240918181042.91891-1-kvalo@kernel.org>
	<20240918181042.91891-2-kvalo@kernel.org>
	<33963bc8-7cc9-434a-8910-cbcfc6fa965e@quicinc.com>
Date: Tue, 24 Sep 2024 11:57:09 +0300
In-Reply-To: <33963bc8-7cc9-434a-8910-cbcfc6fa965e@quicinc.com> (Baochen
	Qiang's message of "Thu, 19 Sep 2024 10:43:56 +0800")
Message-ID: <87setpa0pm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_015714_193375_A37D6015 
X-CRM114-Status: GOOD (  11.83  )
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

> On 9/19/2024 2:10 AM, Kalle Valo wrote:
>> @@ -4310,7 +4301,7 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>>  
>>  	spin_unlock_bh(&ar->data_lock);
>>  
>> -	mutex_lock(&ar->conf_mutex);
>> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
>
> note in patch 4/4 ath12k_sta::update_wk is converted to use
> wiphy_work. While a wiphy work item is running wiphy lock is held
> already. So here try to acquire wiphy lock once again will lead to a
> deadlock.

Ouch again, thanks for catching this! This time I actually tested
changing bitrates and it shouldn't deadlock in v3. But I did notice
sleeping while atomic warnings (even without this patchset) and decided
to fix those in the same patchset as well.

Oh, and WCN6855 firmware was also crashing whenever I tried to change
the bitrates. But let's handle that separately.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

