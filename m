Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE894C83038
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5GUSBjQ00ea51QC8ELYn1wuPxHxD7qnyZDG6UybvdA=; b=4MgOt0HqdyZ2gTwQ1fQGgaIifm
	u2nFXnXYi+kUDLAuWu6YtB7shp0MsvLi//Njgw4PR+E8PbR0mHXpMZPrMsHJQnPiV9a6FxkAuQ6Gf
	iOyHBBWOBOyEUK2pWOSSyvUfjAFDkDPtdXklYtnY1rNc4OVNs8MMmHURDJGRfHoUgNMhNSl9X0GWa
	eT7WQImch3EjRKarm4KgF/wEqH4k8EZhfikXatywI/CZLHWhvhSd5l4TgolNnL4lkwSJw88RSfns5
	bY8SDZpzm4q5apwJo554r4vBw86Qk/zws963poZ8sxGWJL94eNg5qeTe9Ce05puQ+fMHVTDBwnYt/
	cO16YoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhWo-00000006ZLd-1xiP;
	Tue, 01 Jul 2025 20:24:30 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhQO-00000006YOm-1Gtx
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 20:17:53 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 3839D8000A5;
	Tue,  1 Jul 2025 20:17:50 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 0664D13C2B0;
	Tue,  1 Jul 2025 13:17:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 0664D13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1751401066;
	bh=XlitTrfvHOqrCzioarncmPUvFSxf/3wpOSSQGRNsKMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CBGlmTASTOuty4t+WUurGRVcJBMiOcvoyMnOKA9uHSeNB8/wqBR8qlzk26f3EhEr4
	 SMTnHL17kLA8wwr5I8cx3GrIpUcRDdQNfi2AIDi1YAeYwa6Jn1b5h1LKh74FPyNUqG
	 e7x0sxk+eoQ+D75S4eTiyC14iAnuH7YQK1LtWu4I=
Message-ID: <65a4f2fe-7336-0116-6f32-4fcd2a8c4c72@candelatech.com>
Date: Tue, 1 Jul 2025 13:17:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [DESIGN RFC] wifi: Robust AV streaming Design Proposal for AP
Content-Language: en-US
To: Ramanathan Choodamani <quic_rchoodam@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org, ath12k@lists.infradead.org
References: <20250624205716.1052329-1-quic_rchoodam@quicinc.com>
 <0bc6c957-a0c4-c0f7-ed37-c8b44852c26c@candelatech.com>
 <4d87c56e-f198-4abf-a414-4b226178d164@quicinc.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <4d87c56e-f198-4abf-a414-4b226178d164@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1751401071-p7muVIt97cYT
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1751401071;p7muVIt97cYT;<greearb@candelatech.com>;42e86d0922d5c97226149d09277a2a40
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_131752_420840_C5E41626 
X-CRM114-Status: GOOD (  23.83  )
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

On 7/1/25 12:38, Ramanathan Choodamani wrote:
> 
> 
> On 6/24/2025 3:31 PM, Ben Greear wrote:
>> On 6/24/25 13:57, Ramanathan Choodamani wrote:
>>> ===================================
>>> Robust AV streaming protocols - QoS
>>> ===================================
>>>
>>> The Robust AV stream protocols are mobile centric protocols - meaning they
>>> are initiated by a non-AP STA to the AP. These protocols are implemented
>>> at the Access Point (AP) to classify packets sent to the non-AP STA which requests
>>> classification using action frames. The non-AP STA initiates Robust AV streaming
>>> action frames requesting for specific classification for the IP packets
>>> destined to the non-AP STA from the AP. These parameters can be negotiated by both
>>> AP and non-AP STA.
>>>
>>> Upon successful handshake, The AP classifies incoming individually addressed MSDUs
>>> (Mac Service Data Unit) based upon parameters provided by the non-AP STA or
>>> notifies the non-AP STA to transmit MSDUs with preferred parameters based upon
>>> what was exchanged.
>>>
>>> Robust AV streaming improves AV (Audio and Video) streaming performance when
>>> using IEEE Std 802.11 for consumer and enterprise applications.
>>>
>>> Let's look at the Robust AV streaming protocols which are implemented as a
>>> part of this design.
>>
>> Thank you for posting this and for the beautiful ascii diagrams!
>>
>> Since this will be poking netfilter rules into the kernel,
>> is there a good way to clean up all rules created by a previous
>> hostapd process in case hostapd crashes or is killed hard and
>> cannot do its own cleanup?  Maybe the rules could have some
>> special marking that is configurable per hostapd (or per AP or BSS or something)
>> so that a (re)started hostapd could clean up any leftovers from a
>> previous instance?
>>
> hostapd does its own cleanup (cleanup of stations and interfaces)
> when it receives SIGTERM.

hostapd could crash without being able to clean up, though.
So I think you need a way to query the kernel's state and
clean it up in this case.

> An nft chain is created for each AP netdev/interface.
> 
> The nft rule handle (stored in internal hostapd data structure) and
> nft chain metadata can be used to cleanup/flush the nft rules as part of the
> interface cleanup.
> 
>> And, is there a mechanism to clean up flows that a buggy non-AP STA
>> has requested but then forgot to terminate (like phone starts a video call,
>> requests some QoS, then forgets to tell AP that it is done with the call
>> and packets no longer need to be classified?)
>>
>> Thanks,
>> Ben
>>
> The scs objects of the stations will be cleaned up during the station
> disconnect (by the AP which is maintaining them).
> As part of this deletion, the nft rules are also deleted, using the
> stored nft rule handle.

A station may be long lived, and it may be bad at cleaning up
its sessions, so the AP may end up with a large amount of classification rules
that are not actually needed, possibly slowing down performance
and/or limiting other stations from being able to add their own
flows.

Can you add time duration and/or detect idle flows and clean them
up automatically on the AP?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



