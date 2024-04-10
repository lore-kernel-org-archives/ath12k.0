Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97CBCD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm5COFcCFeKNFB3svmeUSKz4uHDQO+Lpkr8+Yk4JhaQ=; b=YKk4YvgAZysuGw/qBxC/iYGB5J
	O+b7B2adedFKpHMjvtgCuSuDGczE6uOUuURfL1ose9/Z4PzLUiqYMH5JftJEvu5ifcyyMPewOF3/c
	DvR7+N/ad5b0T4/lP6/wNqcMx5Hz3LOS/vp9e9dbUq5w2x46jIOBFMrZDaVWMstag12hjdVYCYpAF
	g+03kwi3KxsCTV0VPitYG21WNzuQj4mn+kGqjAA7Ey98nt8Pzj02l48uABKj3mGpjk9PJQyArukWV
	xJ7a00w4+7ibyDliYnSiCx2nXI5NdqJ/d8VumfsAmq9ZNLJn/rZYkvFV8j4KzsNz7eAECThSgbYyC
	wEL4TPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaje-00000008057-0Xk2
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 16:23:42 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruajb-0000000804d-2aKK
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 16:23:41 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 90B2E8009C;
	Wed, 10 Apr 2024 16:23:36 +0000 (UTC)
Received: from [IPV6:2a00:79e1:abc:12b:612f:d396:1826:730f] (unknown [104.133.8.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id E7AC113C2B0;
	Wed, 10 Apr 2024 09:23:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com E7AC113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1712766215;
	bh=FksxrBE85wsNCkcWJSuKiJY1x/2Or6Zy6+YkRSQef3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRy+DwW2WWLEQ/Dy8GaWJMu+X7JlpcyItUER8s9DQ1UnRs7Lf1J4EeQ6zpXSJ2IUC
	 uk3Vi81U31/OtJgPU/eSednFuqIWHhlvTndH0SHfZxMXEIjVOsxX67x7Fp/sBe2olu
	 I9REMA1P1DSno9+WN9vOPhbLVbcMhjR+qT0YnEB4=
Message-ID: <aa9e1d54-bb5f-37cc-335f-c9970ab13789@candelatech.com>
Date: Wed, 10 Apr 2024 09:23:34 -0700
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
X-MDID: 1712766217-ecBzFAlbZ_xB
X-MDID-O: us5;at1;1712766217;ecBzFAlbZ_xB;<greearb@candelatech.com>;e45dbe21c4fc86b950914d8831baea70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_092339_756079_E37BA44B 
X-CRM114-Status: GOOD (  29.22  )
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

If phy0 told user-space that phy1 and phy2 were 'mlo peers', and phy1 and phy2
gave similar mapping, couldn't user-space just notice the peer group and then
have all the info it needed without the bulk of the patch set in question?

So then if hostapd wants to have 3 radios in an mlo grouping, it can do so.

And if instead it wants three old-style wifi-6 AP interfaces, it could do that
as well.  I don't see why it would need any module option, and I also do not
see why it could not do both behaviours concurrently (one BSSID being MLO, second one
being non MLO, for instance).

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

How will you allow all three bands/phys to host bssids that can talk to
wifi-6 and earlier stations if there is only a single phy seen by hostapd?

I definitely want to put STA vdevs on the three individual 7996 phys and have them
be able to talk to non MLO APs. This currently works.

I suspect other use cases, such as meshing with non MLO APs may also want
this sort of ability.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

