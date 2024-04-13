Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E43C4345F
	for <ath12k@archiver.kernel.org>; Sat, 13 Apr 2024 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=um2vHr3Lvf+1bdxDZ88K/VGXVeS0Us5inIIYN1qRKzg=; b=OWXYDBY03DMMXknQjYTh18d3bY
	jqyQBkKbofdgSCRMra9Cfi0i/4ccvE24C/X0ICzo0J2SvZIUOt075H6vl+iXjioeYjg3qvTHMgixz
	FeHIUgSwBcjU0caC0NGk74xbkwuMtbGpQuFlhLqc2KJsCLIPOkrPv5pBQ1owIKPHv0IhTxWzqxsF7
	3MWnIeJP4r/CDBsWUuQgJB6MMiJLMXfECHpe2HvjFJu+LuvTOFoxmJqH2FVRJUs69hVjNeA6n6/UU
	PedOsw9df2WxOxxsn1mH8LLuWuypyEWCKRLjElPhwCKmM8sR1L1ARfF5egKdkiKInE5Upqktzw1V6
	jNpYq0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvfUQ-00000003TSG-356I
	for ath12k@archiver.kernel.org;
	Sat, 13 Apr 2024 15:40:26 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvfUM-00000003TR6-3zp4
	for ath12k@lists.infradead.org;
	Sat, 13 Apr 2024 15:40:24 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 131F0B80066;
	Sat, 13 Apr 2024 15:40:17 +0000 (UTC)
Received: from [172.20.4.169] (unknown [69.170.33.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 06CE713C2B0;
	Sat, 13 Apr 2024 08:40:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 06CE713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1713022815;
	bh=tYqviZf2a7FFRaa4eiO0+lXf17YkmOVHaJ8Je8Idh6o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=c3rLPoQpX923yCQxuSPiFN0/AIkhAcO6sgEuqJ5xBT8I+ev0JpF2KhX5+QdXBe0+b
	 t55ykmD+xo4CKWan5eiOY0xE/DSXBqTPGHsTzQEod+2LHjOLhidbhvcy9NKjB62hfi
	 DwvSKmv/Gua8IrC5DCyFpTbLZ4sC067IOU9p0qug=
Message-ID: <54807acb-b7dc-851e-27ce-49e09df5e1e4@candelatech.com>
Date: Sat, 13 Apr 2024 08:40:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
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
 <72f491f8-dd3a-0c9e-7490-4d51c86f2102@candelatech.com>
 <cb991a00-fce2-5a3d-c03f-579b44f922f5@quicinc.com>
 <87de72e9-1d3b-b401-a712-9fe8734515b6@candelatech.com>
 <31aa6b18-8ca4-e4ce-f693-e818fc7e6932@quicinc.com>
 <dbd51b99-8472-2641-7493-6b91e384b4b6@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <dbd51b99-8472-2641-7493-6b91e384b4b6@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1713022818-Y4DMTIL-019U
X-MDID-O: us5;ut7;1713022818;Y4DMTIL-019U;<greearb@candelatech.com>;e45dbe21c4fc86b950914d8831baea70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_084023_051886_ED479D52 
X-CRM114-Status: GOOD (  23.44  )
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

On 4/12/24 08:58, Ben Greear wrote:
> On 4/12/24 07:31, Vasanthakumar Thiagarajan wrote:

>> As said, please feel free to propose an alternate solution to address the issue.
> 
> I do not know the particulars of your driver or driver's needs, but at high level:
> 
> *  Leave existing wiphy mapping as is.
> *  Allow adding new combined wiphy(s) on top of groups of underlying physical wiphys.  Sort of
>     like bridges on top of Eth ports.
> *  The combined wiphy would report underlying wiphy's capabilities (for instance, a combined wiphy on top of
>     3 single band phys would report itself as tri-band).
> *  The combined wiphy would add new netlink field listing of its underlying wiphys.  User-space wanting to control the combined
>     wiphy would generally configure the underlying phys (to set 2.4g channel to 6, you'd set the underlying 2.4g
>     wiphy to channel 6)
> *  This should require very minimal changes to user space, except of course for new code to actually utilize
>     the new combined wiphy.
> *  MLO links and any other logic that needs the combined view would live on the combined wiphy (I understand
>     from Johannes' comments this is a needed feature.)
> *  Or user can ignore that combined wiphy entirely and directly use underlying wiphys like we use them currently
>     for sniffers, stations, aps, combinations thereof.
> *  Advanced use case could allow combined wiphy to use subset of underlying radios (add combined wiphy on 2.4 and 5g, use 6g for
>     dedicated mesh backhaul/whatever).
> *  Interesting logic would be needed to deal with constraints to properly share the underlying resources (you could not
>     add 16 ap bssid to 2.4 wiphy and also add 16 other ones to the combined wiphy that also uses 2.4 radio most likely,
>     for instance).  But I think that logic has to be written
>     either way and is not overly worse with this approach.

I had some further thoughts on this approach:

*  If someone has 2 QCA radio cards, and each radio card has 3 phys, would it be possible to have a 6-link MLO
    setup?

*  Could two be200 be combined into a multi-channel concurrent MLO setup with this approach?


*  For multi-phy arrangements like QCA ath12k and MTK7996, I think the default configuration when the driver
    loads should just be the physical phys by themselves (as mt7996, at least, does it now).  This would be fully backwards compatible with
    current user-space and operation.  But the phys would have netlink attributes that lets user-space
    know combined phys (cphys?) can be created on top of them.  User-space that knows about MLO can then
    create the cphy(s) as wanted and build sta/vap/whatever on top of the cphys.

*  For radios like be200 that are already designed to show a single phy to userspace, they would not
    need any significant change.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

