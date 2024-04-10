Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF20CD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d61WTasbadnpiTRxuxe3NkGo4TVtszV61FiraFVpv4=; b=NYYSpYG/T8Eqpw7mJxUCVen7wY
	pR5ahpiNDjCCzYWz/IcDSGRy2Fdz+fSEw+TfMtPC0kpprbFG1Es1laSTO6FKmpDYza85zsE1CKrmk
	8PyWOj229qD403ZSYNHEBNEUxZ01ICo4pSF/S3KzkB1LqL5mysJ+oG7VodtHfyVmMTZCAlpNH7/Vc
	txJHNfws4rYTw3RoIVjN1uMsoSDKfkZr7ky3vRpIhRARQFricsBPg/chjMzt8+lUejAWtc4AtKkzR
	dLWrg7vyEDJJAlRKhndhgFkYNoDQlwWL0gUSXdft2ibEFa6Nev1YttTqaZXtt0tMjiKyXQlmhRPXR
	6JiVEt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZ5A-00000007VIE-0372
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 14:37:48 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZ55-00000007VFK-3RoY
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 14:37:46 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 1139C3C0073;
	Wed, 10 Apr 2024 14:37:40 +0000 (UTC)
Received: from [172.20.4.169] (unknown [69.170.33.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 1CC6813C2B0;
	Wed, 10 Apr 2024 07:37:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 1CC6813C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1712759858;
	bh=HcjnHx29WXxDY+v7VWf1kZtucG8fOj8atDSMokCNb1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JJnZGYANtK1l7D1hbkjx3zOUOTm4r/XaVktUQXEOwOPtuTgUPiEQGYFzHnqEsaWON
	 YCL8/vfKdylC+xn87PdCc7oGskBwhNmdf3VlAgZw1dshlr8vigM42NX9YfxwjDM0aG
	 +7pC7ylDnjbMzwnqcEvsEXQcJjH1S5hN9wR85EMM=
Message-ID: <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
Date: Wed, 10 Apr 2024 07:37:37 -0700
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
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1712759861-AjslrQx6Mflk
X-MDID-O: us5;at1;1712759861;AjslrQx6Mflk;<greearb@candelatech.com>;e45dbe21c4fc86b950914d8831baea70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_073744_270710_25ABE124 
X-CRM114-Status: GOOD (  19.59  )
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

On 4/10/24 00:56, Johannes Berg wrote:
> On Fri, 2024-03-29 at 07:47 -0700, Ben Greear wrote:
>> On 3/29/24 07:30, Johannes Berg wrote:
>>> On Fri, 2024-03-29 at 19:41 +0530, Vasanthakumar Thiagarajan wrote:
>>>>>
>>>>>> + * @hw_chans: list of the channels supported by every constituent underlying
>>>>>> + *	hardware. Drivers abstracting multiple discrete hardware (radio) under
>>>>>> + *	one wiphy can advertise the list of channels supported by each physical
>>>>>> + *	hardware in this list. Underlying hardware specific channel list can be
>>>>>> + *	used while describing interface combination for each of them.
>>>>>
>>>>> I'd expect there to be a limit on channels being within a single band on
>>>>> a single "hardware"?
>>>>>
>>>>
>>>> There are ath12k hardware supporting multiple band which need to be
>>>> registered under one mac80211_hw/wiphy. This design is to support such
>>>> hardware.
>>>
>>> Oh OK, that was something that I didn't have in mind any more, or never
>>> knew or paid attention to.
>>
>> Would it work to leave the phy reporting pretty much as it is now, but add
>> a 'associated_peer_radios' list section, so that each phy could report the phys
>> associated with it?  Then user-space, driver, mac80211 etc could look up the
>> other phys as needed to get a full picture?
>>
> 
> There's not really a good way to _do_ that short of creating multiple
> wiphys, but that causes _massive_ complexity in the stack (both cfg80211
> and mac80211) so we rejected it years ago.

I thought the problem ath12k is trying to fix is that there are currently multiple phys (radios) that needed to be made to
look like a single phy?

For dual and tri-concurrent radios, I think we will need them to look like 3 individual radios for non-MLO use
cases, but I guess there will be also some way to treat them as a single entity when using MLO.

For instance, mt7996 currently reports 3 single-band wiphys, and each can be used independently.
But assuming it starts supporting MLO, then those 3 single band wiphys will need to start acting
at least somewhat like a single entity (while also concurrently being able to act as individual
wiphys so that one can do a mix of MLO and non MLO sta/AP.)

Maybe I'm missing the entire point of the ath12k patches though...

Thanks,
Ben

> 
> johannes
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

