Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9093CCD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 21:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izTgOEo84ImOdLY25iFdSLDyXw/6jOD0YwnJBuuly6g=; b=2jczbeoEv0wyTDU1nz3Wx1e6Lu
	a2vB1h/KViu6QUrF9c6K4VNLIZ0JazHZ8UsEiFbYQcuo5BGMaQWgBZs7JcVZbJpv0PhnrtT9u7q1e
	IqiLW3Yge5S015VZkqeprCJfV/fgw9oh3RVXrTSWPeimK6NzrMLacoUYx5UpyfXyq8sk/qfJXyvX0
	s9ICkOhklYsMSzsPOjL4Zen7NWeQtEKB658klrmaTi7dE+IUm3334fKTDxa7aR4q0QnDa7Rdn6WX7
	AgQyj8SLvkhGcx6UbhbBUwfwr2Ql7aSncT4bYFK3D6x7xlHJaKlOqNAm6+rFZHZZ4aiuWIN7XQwoJ
	c2KaeyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruf6h-00000008whw-0xry
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 21:03:47 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruf6d-00000008wgB-2pUw
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 21:03:45 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id D0E7C100073;
	Wed, 10 Apr 2024 21:03:40 +0000 (UTC)
Received: from [192.168.1.148] (unknown [136.42.28.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 1540013C2B0;
	Wed, 10 Apr 2024 14:03:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 1540013C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1712783020;
	bh=qeon5nMw9hqtoeOdYCIVQbMLKMGgy2yvGMQDmRWCUHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oDq5+6x5DT3Hso4hgUSMB2AbNbo5LpS7AGpau6Pfmk/ymlq5x03+AE9dFb9wxA1Lx
	 ws6vMNSdzt7YqcG8Nfh0GvzNqY79fFjuBrAJVj9rDLUa2N+6YpP4RtGMff+sT4y1Uw
	 fxC8VBspFi1F8/nGS40dKi057Bwk3NMrZmkAKSNE=
Message-ID: <72f491f8-dd3a-0c9e-7490-4d51c86f2102@candelatech.com>
Date: Wed, 10 Apr 2024 14:03:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
Content-Language: en-MW
To: Johannes Berg <johannes@sipsolutions.net>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
 <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1712783022-zT9Y6Rwlr8VG
X-MDID-O: us5;ut7;1712783022;zT9Y6Rwlr8VG;<greearb@candelatech.com>;e45dbe21c4fc86b950914d8831baea70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_140343_765862_7808A44F 
X-CRM114-Status: GOOD (  25.70  )
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

On 4/10/24 08:42, Johannes Berg wrote:
> On Wed, 2024-04-10 at 07:37 -0700, Ben Greear wrote:
>> On 4/10/24 00:56, Johannes Berg wrote:
>>> On Fri, 2024-03-29 at 07:47 -0700, Ben Greear wrote:
>>>> On 3/29/24 07:30, Johannes Berg wrote:
>>>>> On Fri, 2024-03-29 at 19:41 +0530, Vasanthakumar Thiagarajan wrote:
>>>>>>>
>>>>>>>> + * @hw_chans: list of the channels supported by every constituent underlying
>>>>>>>> + *	hardware. Drivers abstracting multiple discrete hardware (radio) under
>>>>>>>> + *	one wiphy can advertise the list of channels supported by each physical
>>>>>>>> + *	hardware in this list. Underlying hardware specific channel list can be
>>>>>>>> + *	used while describing interface combination for each of them.
>>>>>>>
>>>>>>> I'd expect there to be a limit on channels being within a single band on
>>>>>>> a single "hardware"?
>>>>>>>
>>>>>>
>>>>>> There are ath12k hardware supporting multiple band which need to be
>>>>>> registered under one mac80211_hw/wiphy. This design is to support such
>>>>>> hardware.
>>>>>
>>>>> Oh OK, that was something that I didn't have in mind any more, or never
>>>>> knew or paid attention to.
>>>>
>>>> Would it work to leave the phy reporting pretty much as it is now, but add
>>>> a 'associated_peer_radios' list section, so that each phy could report the phys
>>>> associated with it?  Then user-space, driver, mac80211 etc could look up the
>>>> other phys as needed to get a full picture?
>>>>
>>>
>>> There's not really a good way to _do_ that short of creating multiple
>>> wiphys, but that causes _massive_ complexity in the stack (both cfg80211
>>> and mac80211) so we rejected it years ago.
>>
>> I thought the problem ath12k is trying to fix is that there are currently multiple phys (radios) that needed to be made to
>> look like a single phy?
> 
> Correct.
> 
>> For dual and tri-concurrent radios, I think we will need them to look like 3 individual radios for non-MLO use
>> cases
> 
> No, I don't see why, and if you want that we wouldn't support it anyway,
> you'd have to have a module option or something to decide which way to
> go.
> 
> But it really ought to not be needed - the point of these patches is to
> give userspace enough information to know how to (and where) to create
> separate BSSes, with or without MLO between them.
> 
>> For instance, mt7996 currently reports 3 single-band wiphys, and each can be used independently.
>> But assuming it starts supporting MLO, then those 3 single band wiphys will need to start acting
>> at least somewhat like a single entity
> 
> Yes.
> 
>> (while also concurrently being able to act as individual
>> wiphys so that one can do a mix of MLO and non MLO sta/AP.)
> 
> No.

Hello Johannes,

Is there any design document for the combined phy approach somewhere publicly available?

It is hard to understand the over all goals by just reading patches as they show up on
the public mailing lists...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

