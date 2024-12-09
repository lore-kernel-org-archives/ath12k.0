Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80FAE77180
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GhiCTEzyVxeYb/cgZLce6Gt3m3SagALwAY4SQcF+2Q=; b=tepkam8uSkH3011H/NHSWe74AB
	p22b329NtvwBqfl1uCOV1ZtHV51E3NV3XjdO50OjZugxj3AB4QzEyJ4AV7EcEHqr4450/q8rOr9T5
	7hXZj2svmJQiqRy+X1qxbekZJVl0nFjOQAcYIgaZ0PlJqdPHRBoFWNlpsqs//QjVh4SPDhI4NSdTQ
	cEVhvn6I9uiTjFOYyk6EuhO4oWpZFcJjHt1420PRw/5B99QMTytcXqDI+h3cpWCBePMPeI5NY/lrC
	+wrL9C49I6f7Da3t2ttbf9OMAHQDzcwb0ZosD6w5LxET5nlQuj2NYPfZCTHHBn96AINmb5HBHRc1S
	Ig8xSk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKlo3-00000009NQ2-2Q4F
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 22:00:43 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKlo1-00000009NPP-19Qv
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 22:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1733781639; bh=3/ZyhypqEqTmau5gEi/NQsgw/0/pQapsAW4IS8wMNnc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=hlvReRGPkOrrK+suZLy7d+4w8wu0vOU4JHVAwDH5sEnbTedBjYMxmU+m2HZdK+Swy
	 hAa66nSNTqG+Z7HYPwptWWRU4QU4HjlrvJu/doWHgewrpNiAqccqyaimLAZoPk2mNJ
	 Ik43DHThSSdITkC+0Lx+KY1NfalxGN6VyIdEXrPA=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 734C914873B2;
	Mon, 09 Dec 2024 23:00:39 +0100 (CET)
Message-ID: <71b9b05a-55b0-4727-a1a1-eb57afe55637@ionic.de>
Date: Mon, 9 Dec 2024 23:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH] wifi: ath12k: wait for chan update in reg_notifier
From: Ionic <ionic@ionic.de>
To: ath12k@lists.infradead.org, Kang Yang <quic_kangyang@quicinc.com>
References: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
 <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
 <8b2a2c54f34c60f2170bd0cfc01c602dbb8e5d96.1733780780.git.ionic@ionic.de>
Content-Language: en-US
Organization: Root24
In-Reply-To: <8b2a2c54f34c60f2170bd0cfc01c602dbb8e5d96.1733780780.git.ionic@ionic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_140041_477517_794B61D1 
X-CRM114-Status: GOOD (  12.69  )
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

* On 12/9/24 22:47, Mihai Moldovan wrote:
> Currently, setting a new regdomain is asynchronous in ath12k, in the
> [...]

Making the reg_notifier synchronous with the actual reg update fixes the issue.

In short, when setting a new reg domain, the reg notifier is called as the last 
step by cfg80211 before sending a regdom change event over netlink, but since 
the reg_notifier is not waiting for the hardware to apply the new country code 
to the firmware and update things like the channel list, things can fail in user 
space.


I implemented a regd_update completion in ah and added a wait call in 
reg_notifier, as well as completing it in regd_update, with (re-)initializers in 
mac_hw_register and mac_hw_unregister.

I'm not quite sure if ah is the correct place for that, but it felt like the 
most appropriate. ar is too low-level (since multiple ar can share an ah IIRC) 
and it should generally not be possible to set per-ar regdomains, although 
per-phy regdomains are possible, but every phy should have an ah (I guess?). Not 
sure how vdevs play into this.


Can you please test and review this? If it's already good, feel free to include 
it in your series.


ath11k is suffering from the same issue - I just haven't noticed it before 
because the default regdomain of the ath11k-based card I use is set to US, which 
allows operations on channel 96 to 144. If I set CN first, I can easily 
reproduce the same issue with ath11k, so I'll have to backport a good patch to 
ath11k as well.



Mihai

