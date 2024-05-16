Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B20C25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJr+RIgU40Rt1Ch+gpfo8tt8TXKDxuWeyN6UbgcFFP0=; b=WktbrnqWyuOX+zYeyBTe2OG4Lt
	Tvf1PfWVaEg4YjMz216Y+NFREM1+1DyWSm86zeLcakKhr4DOKCQImZd01ifermgwNkGwzRRp0QyFX
	XvjTf9LqfFTJAptBDG/mceDJos96g3+6mvwXVmL+WiRbUrWdsHeyfGx7awOUASQYKvf44AHTluckI
	kzXJHc8vPEkrlGGRdv06x8PI7aqscW7/Rnr7q+0WJhzds28Ao+9c5HPmcBy3WaUTCY+s6V3Tx+4of
	Oqmi30D3yuvhTS99RFY/Tf8t+2j9gB5WIciteJ+9vl322HJAaPSipXaGDrFjT2OqyRGdE5/v0tQUb
	NGv0xV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WLF-0000000480T-48kQ
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 08:19:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WLD-000000047zy-1L0E
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 08:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 686CA615F4;
	Thu, 16 May 2024 08:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5A7C113CC;
	Thu, 16 May 2024 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715847594;
	bh=uKJ0ei/23sbNLAzUj5EOdb5bqG72jG0ee62qjGHzJig=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HdTN5r8jkkIbGg9Dmx7hVJTK19QMOPN8j3PAUeqTyoMta/VUDoIuwVrumsXhUclNX
	 Bj24PQ8/pEFo8QD1EJ94QEC1X0iFk1KkyD4fHsmn/hI1gg3uGsJK1V9OLzK8C1b37d
	 Uevr9ol7rR2g0Sp3lfDUmIy94Y2Y15urZ3YcU/5yrgJC7+bEodoiKmHd9ozJzXbpp9
	 3WpmBOWPa5Cnz2JXrJsNyKGX4NY60hfK9Tw4139sk9CBK0IyoRBzpINUW6zpYryEv1
	 J8ZcTNJRFJu4iB+xk2f+IQYPQcub7XmVNaTDtVVQdgCZDEf1Sehia6xUM6kJ/r0FWT
	 GgfkAqgYgyUBQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup
 Failure
References: <20240510070427.206152-1-quic_nithp@quicinc.com>
	<13d762da-ad16-43b4-b0ca-15e5e17af5cb@quicinc.com>
Date: Thu, 16 May 2024 11:19:50 +0300
In-Reply-To: <13d762da-ad16-43b4-b0ca-15e5e17af5cb@quicinc.com> (Jeff
	Johnson's message of "Fri, 10 May 2024 10:01:09 -0700")
Message-ID: <87zfsqgod5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_011955_606748_07F466B0 
X-CRM114-Status: GOOD (  12.62  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/10/2024 12:04 AM, Nithyanantham Paramasivam wrote:
>
>> We observe intermittent ping failures from the access point (AP) to
>> station (STA) in any mode(AP-STA or Mesh) configured. Specifically,
>> the transmission completion status is not received at Tx completion
>> ring id-4(WBM2SW ring4) for the packets transmitted via TCL DATA
>> ring id-3. This prevents freeing up Tx descriptors and leads
>> to buffer exhaustion.
>> 
>> Currently, during initialization of the WBM2SW ring, we are directly
>> mapping the ring number to the ring mask to obtain the ring mask
>> group index. This approach is causing setup failures for WBM2SW
>> ring-4. Similarly, during runtime, when receiving incoming
>> transmission completion status, the validation of the ring number by
>> mapping the interrupted ring mask. This is resulting in
>> validation failure. Thereby preventing entry into the completion
>> handler(ath12k_dp_tx_completion_handler()).
>> 
>> The existing design assumed that the ring numbers would always be
>> sequential and could be directly mapped with the ring mask. However,
>> this assumption does not hold true for WBM2SW ring-4. Therefore,
>> modify the design such that, instead of mapping the ring number,
>> the ring ID is mapped with the ring mask.
>> 
>> According to this design:
>> 1. During initialization of the WBM2SW ring, mapping the ring ID
>> to the ring mask will ensure obtaining the correct ring mask group
>> ID.
>> 2. During runtime, validating the interrupted ring mask group ID
>> within the transmission completion group is sufficient. This
>> approach allows the ring ID to be derived from the interrupted ring
>> mask and enables entry into the completion handler.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> should be
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Kalle can fix this in 'pending'

Fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

