Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94CDC77B7C
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 22:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8adcp5iS8RYGYhtzHl5QAOsJVdNu6kyoL5sIDAkIWvA=; b=e0V5VXXvdV/tnGvvyMvaKBh3OY
	ajj1wvD9+rv7UX+4WnBYoeBFfDK6aIgrZvlwLSQ2VSJfB5F8PrUmuHSrRAoHmzLYAhonBkOMZCcVr
	FHksmViW+KyPvk/2RpvUCkBo9ZFzX2HhI3wUwOgfRIWsz7o3A+yNV9G4OASZhmQhip+27u9DeaN4L
	eMaGKxG4AYboYLBs5hB1bEPrpqcowzDIpJjNgZ/BklM3aLKwTtD/FXlHtdsbwOtsC1pK7BZRwjozR
	1KqIcYJKJZHkGMCm53He4hrKlRJjwQQ/tgci8ZStdwOWdoWXW+lL0mJZa56fgofxwTY93qlBQCIDZ
	pw6U3AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCWC-0000000722T-25XZ;
	Tue, 24 Jun 2025 22:53:32 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCBJ-00000006zxw-1W2Z
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 22:31:58 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id E1C6D1800A0;
	Tue, 24 Jun 2025 22:31:54 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id BD22D13C2B1;
	Tue, 24 Jun 2025 15:31:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com BD22D13C2B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1750804286;
	bh=FXMPg63dVVmVrNKoRyj1dD2TlUtmMdIxd5+dbkGWnrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HK6HrE7B12KO2ZM8W73X7EyjXB73BpiuuneJO9iE5Qpu8Ws2Qf7dF3Nfq2XLgI7o4
	 sR0pdUdjSn1ZFWiqwc5kQXP6E+IqLJLvaYMbUhoLiLMCA98Gm7qIgLNckFRJTUuQMe
	 OxPVOfV8FNTGEX/Rsha/xcN7fZgIKZfML6WV9VkA=
Message-ID: <0bc6c957-a0c4-c0f7-ed37-c8b44852c26c@candelatech.com>
Date: Tue, 24 Jun 2025 15:31:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [DESIGN RFC] wifi: Robust AV streaming Design Proposal for AP
Content-Language: en-US
To: Ramanathan Choodamani <quic_rchoodam@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org, ath12k@lists.infradead.org
References: <20250624205716.1052329-1-quic_rchoodam@quicinc.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20250624205716.1052329-1-quic_rchoodam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1750804315-Wt0-nTYIyVjG
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1750804315;Wt0-nTYIyVjG;<greearb@candelatech.com>;42e86d0922d5c97226149d09277a2a40
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153157_485719_4FDF3F48 
X-CRM114-Status: GOOD (  17.42  )
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

On 6/24/25 13:57, Ramanathan Choodamani wrote:
> ===================================
> Robust AV streaming protocols - QoS
> ===================================
> 
> The Robust AV stream protocols are mobile centric protocols - meaning they
> are initiated by a non-AP STA to the AP. These protocols are implemented
> at the Access Point (AP) to classify packets sent to the non-AP STA which requests
> classification using action frames. The non-AP STA initiates Robust AV streaming
> action frames requesting for specific classification for the IP packets
> destined to the non-AP STA from the AP. These parameters can be negotiated by both
> AP and non-AP STA.
> 
> Upon successful handshake, The AP classifies incoming individually addressed MSDUs
> (Mac Service Data Unit) based upon parameters provided by the non-AP STA or
> notifies the non-AP STA to transmit MSDUs with preferred parameters based upon
> what was exchanged.
> 
> Robust AV streaming improves AV (Audio and Video) streaming performance when
> using IEEE Std 802.11 for consumer and enterprise applications.
> 
> Let's look at the Robust AV streaming protocols which are implemented as a
> part of this design.

Thank you for posting this and for the beautiful ascii diagrams!

Since this will be poking netfilter rules into the kernel,
is there a good way to clean up all rules created by a previous
hostapd process in case hostapd crashes or is killed hard and
cannot do its own cleanup?  Maybe the rules could have some
special marking that is configurable per hostapd (or per AP or BSS or something)
so that a (re)started hostapd could clean up any leftovers from a
previous instance?

And, is there a mechanism to clean up flows that a buggy non-AP STA
has requested but then forgot to terminate (like phone starts a video call,
requests some QoS, then forgets to tell AP that it is done with the call
and packets no longer need to be classified?)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



