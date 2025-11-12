Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B275CCFA1A
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZFOzLPtvRF8PK8NbbtIvHtDt3UpMd2wyQJfW4KmjgU=; b=1ATdpPgfc+zZ26tetRoWmXE6G1
	2ruzsBt2VNYpm3p+aPrhQ76FymYK/73HByTLnMN7BgOKzFBV9L1m/8ZX8Cvo28nSbu82lqXtLogmX
	vw46GURfmilvgvWGadZ8sAO/um+1WASXHHxy4mPe1IlqCjyA0fO5LY5Tly7gRVh0isMLH02PnP6Ch
	sE5aSEbuq8qU17Md+hBAF5gtA5d0ngF7UJwPEZb64KPa12WS4LbyrYaxEhlX9IW/Z52fHtAP4OvOg
	SJEAybXf1A1Mp+AfcbkR65z6yDrr0GY9dCgDxbqKZJ3gPGFNUTGUWhkDznHx75r6RSLoQpSe+0lY3
	XobosGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCta-000000094f9-0Sl2;
	Wed, 12 Nov 2025 15:36:30 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCtX-000000094e0-2OtH
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 15:36:28 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id C0076800075;
	Wed, 12 Nov 2025 15:36:23 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.43.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 5D44613C2B0;
	Wed, 12 Nov 2025 07:36:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 5D44613C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1762961781;
	bh=SqK0ZpKqaZSwL8unHiKCo+8oP7+Pzio85/6I/EiNXe4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gjGxBteAitKiLbvq5bokZHsgYeOHoRpvA0ndU5v7RD2cIfurvL0kzwUqr1++52L1U
	 9fa9iIjopUpBntk9qv80aedAZ2tbHgcrlUdML4BMX28WkFTTMkT14V+ofTMqlwBfns
	 NUo4j+w9z8hpxKKX5YnS6B7TZeF+g1svaeoDmHwI=
Message-ID: <3f43654b-3fca-4020-8393-d028991edba1@candelatech.com>
Date: Wed, 12 Nov 2025 07:36:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k pcie radios with MLO support?
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
 <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
 <75947d00-4b0c-44af-b887-7874077fe64b@candelatech.com>
 <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1762961784-6AGTg0MS0SMr
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1762961784;6AGTg0MS0SMr;<greearb@candelatech.com>;47d173bcd71c2b66982759b803ed8e96
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_073627_691166_41D3FB7A 
X-CRM114-Status: GOOD (  20.33  )
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

On 11/11/25 21:15, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 11/12/2025 7:10 AM, Ben Greear wrote:
>> On 11/11/25 17:29, Jeff Johnson wrote:
>>> On 11/11/2025 7:27 AM, Ben Greear wrote:
>>>> Hello,
>>>>
>>>> Are there any current radios + software available where one can put
>>>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>>>> chassis and provide tri-band MLO?
>>>>
>>>> Last I looked, Compex had some dual-band radios and maybe single-band
>>>> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?
>>>
>>> Most of the Compex modules use the AP-centric QCN chipsets.
>>> For your use case look for something using the WCN chipset.
>>>
>>> Something like:
>>> https://www.sparklan.com/product/wnfq-291bei/
>>>
>>> (I haven't tried it and don't endorse it, just giving as an example)
>>
>> Hello Jeff,
>>
>> Thanks for the link.  That too is dual band though.  I'm interested in
>> using ath12k radios for wifi testing purposes, so I'd really like tri-band
>> MLO to have some feature parity with the MTK 7996 radio board.
>>
>> Is ath12k able to combine discrete wifi NICs into tri-band MLO stations?
> 
> Yes, ath12k supports tri-band MLO STA. This has been validated for QCN chipsets.
> Not sure if this has been tested for WCN chipsets.

Can this work with some combination of Compex radios in an x86 chassis,
or does it require some integrated AP style platform?  If x86 is supported,
please suggest some radio model(s) you think will work.

>> Or is ath12k entirely DBDC at this point with no tri-band MLO capability?
>>
>> In addition, back in ath10k days, I was able to get the radio to do up to
>> 64 STA vdevs once I put the firmware on a diet.  From a quick look at the ath12k
>> driver, it seems the limit for STA vdevs is exactly 1.  Is there any somewhat-documented
>> way to get ath12k to support more STA vdevs?
> 
> Supporting more number of STA vdevs instead of the current 1 STA will require
> firmware changes (and of course more validations).

Any idea if QCA is offering ath12k FW source under NDA and/or for some price?

We could likely make the changes and validate, but we need the FW source and
a toolchain to compile it.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


