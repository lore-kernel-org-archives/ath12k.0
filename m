Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67786C52D71
	for <ath12k@archiver.kernel.org>; Thu,  8 Aug 2024 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDo5gBp2OM2wut1WFpGc43My8WLbK2Rhc4WyqdOu0uI=; b=Geh2nM9MQLeb/7ijjxOQNRSpY9
	1FnhzvsM7MscTh3j3f6Ac2DHEYVPVJwQl3HQCpgNk3ZdqI0UzMg6SGUrvscxIJukUwLJBVM7qmt6r
	1wVM7/LzbbztuolMq/QZd6GAVn7MzYAOKkLTI+QN34338g5BWVdMQbjkYB5xo+HybtuesPMXuhmt6
	lzRVbEgmTdMXyBeg5XWKRRbY1x8pUcimlJ7aqjjzt8v0LRPZHHeTNXoRhoMK23RFHgd0pLE1jhgV7
	FYipEFT5doVD+w3P10ftp7fABM7qrN+suZtXToXCqNqrb6jSkqLF9yloS9C7BJ0eEu91nAanm6Qa5
	QNdGKkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0qM-00000007zIF-0Wxx
	for ath12k@archiver.kernel.org;
	Thu, 08 Aug 2024 10:58:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0qJ-00000007zHa-2W9O
	for ath12k@lists.infradead.org;
	Thu, 08 Aug 2024 10:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D74186152C;
	Thu,  8 Aug 2024 10:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B135BC4AF0D;
	Thu,  8 Aug 2024 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723114682;
	bh=fLkrAQXFudXsq+HdbktGHKS6ZexNfbPFMzzphgVco+g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ur1mPurbXbpt/nIzHqsBAmxXV/uI6QiU5V2KKlnyK3pKou/c/atj4Aak664jkbR0i
	 SGx9lXVRCMOczlDaSCJ4iSzthOY7MjyYwBhvfUtFvAzChpWgefWjG7+wmwPZeOMPFv
	 Km4+CM3Qb5PrR2QLf3mZw51WgykoBAs+dNqlJDuOAmAcHcfa9Bs0L7noCPKv+EVnHJ
	 K7ounT8pT+Gi98PQGRakk2toAIlI+hQtb/y0BPXME9Lk+70ZXvwR2koZEEo26pLj83
	 T08cOfYyY3KyLW0fhUzguPDdEIRFcpw8mjE6ccLOz5TsuLPVkCBW5W4zqR2iCy3mmE
	 1L6vIGnqN2oKw==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v6 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
References: <20240711165511.3100433-1-quic_ramess@quicinc.com>
	<20240711165511.3100433-2-quic_ramess@quicinc.com>
	<87frrj70nz.fsf@kernel.org>
Date: Thu, 08 Aug 2024 13:57:59 +0300
In-Reply-To: <87frrj70nz.fsf@kernel.org> (Kalle Valo's message of "Mon, 05 Aug
	2024 12:56:48 +0300")
Message-ID: <87sevf2seg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_035803_712410_7D54C9D0 
X-CRM114-Status: GOOD (  17.40  )
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

> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
>
>> Locking:
>>  Currently modifications to members of arvif and arsta are protected by ar->conf_mutex
>>  and it stays as such.
>>  Now with these hw level structure (ahvif) being introduced, any modifications
>>  to its members and link objects (i.e., arvifs[] which are dynamically allocated)
>>  needs to be protected for writing and ah->conf_mutex is used for the same.
>>  Also, atomic contexts(say WMI events and certain mac_ops) that we currently have in driver
>>  will not(shouldn't be allowed) do any modifications but can read them and
>>  rcu_read_lock() is used for the same.
>
> Please elaborate more about your locking design. Because of past bad
> contributions from Qualcomm the bar is really high for adding any new
> locks. I'm doing the locking analysis right now but it would help a lot
> if you could provide your own analysis.
>
> My first impressions:
>
> It's really confusing to have two locks with the same name (conf_mutex
> in struct ath12k_hw and struct ath12k).
>
> struct ath12k_hw already has hw_mutex so I'm even more suspicious about
> this locking design. That's not explained at all in commit messages.

I didn't get any replies, and my own analysis is still ongoing, but the
more I look at this, the more I feel using two overlapping mutexes is
overkill. I'm starting to wonder if we would convert to using
wiphy_lock()? That might simplify things significantly. I should have an
old patchset doing that stored somewhere.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

