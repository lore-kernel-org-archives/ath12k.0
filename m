Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FEACCFA1A
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iG2rvE1g+NYs2CxBJhHs6bFt7UY8gSqFMf0HWZcXFtQ=; b=z4rTYWG8V14miUeuJq1fZ7rnpA
	XN8ACtP8ZnzC0EhTMNs/meORKS5P5av+jhI1FanXf+X4HDFoEUDE9aAYfYUXTTa+/SXy1FOBOvBs0
	UWs1Mo7yB3RKUsBPjb0lhAMFbwC1HNtt2MCQKAFJ80D+f/BlGHUd40g4Bczu7oDdqdCtHY/8NDCAl
	okSBVfeJp59zAc1FeGw31g8Zt4btcjfrb24UQApSNbbxSoJa2ZbeS2J3pURkfQ26vgTEe5nKmdCcI
	szgiJTxATRaAU6ybbRqN0VAeWcgO5FJ8F/GC91kj9XeqSM4ptXhw/gs0g0IOidQ11PxTbqR0Q8TRj
	zobOQbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzqM-00000007yLq-2qQE;
	Wed, 12 Nov 2025 01:40:18 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzqK-00000007yLC-2Jn3
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 01:40:17 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id CCF8D98007F;
	Wed, 12 Nov 2025 01:40:12 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.43.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 3C6B513C2B0;
	Tue, 11 Nov 2025 17:40:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 3C6B513C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1762911609;
	bh=c0PS8sTjwrs3oZHbyIDiEzxD9ynyCzLdJX6sAqu/x7E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Rvu6/zmD+yczeT0ETcyzjH5cveN0Mz+uIEb+w4kHSHLBpbeB0SCUVprMwjHwKCZu1
	 0igyEk3kQz1pBE4xAdf3rDgZW08ayLi7YXm1+S38QjF96e+XLcZv2t/0LiWhniq+lg
	 3LZxPlIr/18SpnczUuMHt3U2soB17uGrrFNTT9LE=
Message-ID: <75947d00-4b0c-44af-b887-7874077fe64b@candelatech.com>
Date: Tue, 11 Nov 2025 17:40:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k pcie radios with MLO support?
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
 <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1762911613-1ohbroP6R6K8
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1762911613;1ohbroP6R6K8;<greearb@candelatech.com>;d05f6545c9435a94c4c6cca901df59e6
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_174016_654370_F6586D55 
X-CRM114-Status: GOOD (  15.83  )
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

On 11/11/25 17:29, Jeff Johnson wrote:
> On 11/11/2025 7:27 AM, Ben Greear wrote:
>> Hello,
>>
>> Are there any current radios + software available where one can put
>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>> chassis and provide tri-band MLO?
>>
>> Last I looked, Compex had some dual-band radios and maybe single-band
>> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?
> 
> Most of the Compex modules use the AP-centric QCN chipsets.
> For your use case look for something using the WCN chipset.
> 
> Something like:
> https://www.sparklan.com/product/wnfq-291bei/
> 
> (I haven't tried it and don't endorse it, just giving as an example)

Hello Jeff,

Thanks for the link.  That too is dual band though.  I'm interested in
using ath12k radios for wifi testing purposes, so I'd really like tri-band
MLO to have some feature parity with the MTK 7996 radio board.

Is ath12k able to combine discrete wifi NICs into tri-band MLO stations?

Or is ath12k entirely DBDC at this point with no tri-band MLO capability?

In addition, back in ath10k days, I was able to get the radio to do up to
64 STA vdevs once I put the firmware on a diet.  From a quick look at the ath12k
driver, it seems the limit for STA vdevs is exactly 1.  Is there any somewhat-documented
way to get ath12k to support more STA vdevs?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


