Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE04C4345F
	for <ath12k@archiver.kernel.org>; Tue, 16 Apr 2024 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRfrA708Zy4CvzuZdYohVS5SqLaeU95YZe4JQHqEkQs=; b=r24zXkHkx785QZ9ZLwt7XVE+Op
	jK24B29WpsYO3UUnnckpCfzYF3g7XVY999J2cTak3BmsBYNzLk68vE/jaLWItvhE4w2RHddsAm8tF
	8Oej1WyERLV/V+RGZiCmP2/XIIoB4yKaiqhg/Cy429LB23D+lFSBcJbSq2W8iPrao3FOrFkHk9Me7
	aTJkKzqC1MQ4yjW13u5Gaff5L7GXeG3T6O9aGqBBbYMoBvl/Ivi+CMMIPrfroiB2YaTPVU/++l5k0
	NXF8aF1CEB4y+mPpxp5MwIm3Rq0rQxQi9DKgBexANi9nSSDM4RSyrBHzoyHI/WWSE7p+ARuK8asOR
	VBNE7J7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweBZ-0000000BSHn-32wb
	for ath12k@archiver.kernel.org;
	Tue, 16 Apr 2024 08:29:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweBX-0000000BSH5-1mvo
	for ath12k@lists.infradead.org;
	Tue, 16 Apr 2024 08:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0ACDCE0F31;
	Tue, 16 Apr 2024 08:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0FDC113CE;
	Tue, 16 Apr 2024 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713256137;
	bh=2ERkywRAqUnwLvSCSO91utOXtH6ChiSIXYc6NfsfdMs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GSohxlRY1LRMjSKxery5JDfnxebEY2FDZROtnDYFPNWpYuiGt2NbnK1Qwgs4h2Wld
	 +0SPNoIXzTziT1ntFgJoLdd03Uz10j+7EEXB0iiKTSF1W7+UZf8J4tj4yJiq/KUcR1
	 81t1MgzMr+c6cUxi/6N6SyrZiqsKKt7UsvTWROMDSe5tt1CpsyGvfYiUUanYGwJJtQ
	 INYrl+dpAaJKnEeVZ3Xpb81VASTyufWFgeM7ieDVQYoBBaZXGaPnFHw/IbFWTIq9B9
	 ul+KYrYE0+DHZ/YLc5ZSIjq1ZklGas1GWR06GIvBSBmocpmBLRt0LM1bGo698HLcG7
	 K4Izc4eWwI9Pg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 00/10] wifi: ath12k: support suspend/resume
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
	<aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com>
	<76ef11b2-c477-ff11-df72-e8d934c00831@quicinc.com>
Date: Tue, 16 Apr 2024 11:28:54 +0300
In-Reply-To: <76ef11b2-c477-ff11-df72-e8d934c00831@quicinc.com> (Baochen
	Qiang's message of "Mon, 15 Apr 2024 13:51:25 +0800")
Message-ID: <874jc1yam1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_012859_686330_5BEFB74A 
X-CRM114-Status: UNSURE (   9.81  )
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

>> patch 6 of this series conflicts with:
>> wifi: ath12k: add support to handle beacon miss for WCN7850
>>
>> So I was not able to take this series into my local verification tree
>>
>> patch 7 of this series conflicts with:
>> wifi: ath12k: fix mac id extraction when MSDU spillover in rx error path
>>
>> So this conflicts with a patch already in the pending branch
>>
>> So FYI at some point you'll need to rebase.
>
> So I should rebase after these two patches got merged in master branch?

No need to rebase at this time. In the pending branch I was able to fix
the conflict in patch 7. Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=b92086862c7be6e6810eca204052cada50fc0f5f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

