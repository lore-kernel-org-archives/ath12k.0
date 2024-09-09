Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F05ECE579
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8XujAoZu0Ug6FtVY5CTudey2C8BQXbywdIx9v/f/Nc=; b=sVdxrNjhi/5GELP8IWttDNV049
	o2HwUGXhKuXiTB9ji4yXqihcNQWsPJvlddXZsCMsIa/PRsaKHSkkA45cLF21v6hDKVxhoxFRkdN1d
	bAIXPrhh14t2/ONLW5SL+XfE3fo7nplgD1D/4q/RP5ohkfSiLIFH0T3QkSz9BQSSDeqpJ30yFQdIF
	Z1lWukj7w6SUDE2nC83jG3fkG/9K+5F9NqKV+or1ArChVnaURAP/cAEWx/dIvQXJhmGu7ZwKO+cv7
	IZ2ujHo11o/+QB4aiZncqFlgGOzq5Kn30IlLQfo7xkYKnXjm1ljeLJI4vs5sZcZQatRT+I+8y60+x
	DhcSbNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneBW-000000020mV-45dw
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 13:12:02 +0000
Received: from e3i110.smtp2go.com ([158.120.84.110])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneBT-000000020bD-3DLB
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 13:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1725887460; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=p8XujAoZu0Ug6FtVY5CTudey2C8BQXbywdIx9v/f/Nc=;
 b=tsZbWgQ+3OULzu7yNDxn1QorDZor3jh1B3f5Eoywgkd0sfP4xZbbr5MNY+zxnuJuZSDnA
 BZxRYAgjB63JAIccNu6p+l3dsH+eUGifW56k0QWyz2mKpPHqDvo/GquKoY8tJ4FggJNaYj/
 NAH+4JRePLk/ozn3yzi+4aynM1Ep62iegMu2DKuwQwmiD4Inn1PdTyOwM47xQq2fPCM0Efk
 55zgNxYwizOLEi3XRUaOMUNGF/cS7XQxO2Rnfpzza7nDP4V2dE+d09gVaC3bFeA2yktjEPM
 KM2eHdHsliesY+uZnk/rCvPReca91za/lzYWxMjxZz2lsZPrwwjD/ldMvT8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1725887460; h=from : subject
 : to : message-id : date;
 bh=p8XujAoZu0Ug6FtVY5CTudey2C8BQXbywdIx9v/f/Nc=;
 b=JShYsIFbE9huN8M30CkTPlGqS1XpJrvaOJG/0z7CR/zpTyFRpOlEZeVROphShzNlLasrK
 8ujyXXrAtjQ7NMTaQhqD3dlYL2O1fvSMC974ILTfTh381SPQZvzUllcJ+Csc/QM9VhtPBfI
 2yqwoVVew0zrtwC9s5hZZXlHbmfuOYxgiZ2cKHg/YgAzqmNkklsT399FULm94R4vikEInV0
 66bsfs2+VZNug0WrCoiI0qf+32/3442NXuP/K2MLfx82QHN5R7U5OJATrAiGs8ppvXBwhwW
 02D/ig9986a7GAG8pJ0TnvY9iPx+speXdT6M4g4yW/LJysoGFQLLDDy0cqBQ==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1sneAU-FnQW0hPnAAO-oEom
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 13:10:59 +0000
Date: Mon, 9 Sep 2024 15:12:39 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: ath12k@lists.infradead.org
Subject: Re: Allocating more RX descriptors that can fit in their related
 rings
Message-ID: <Zt70R7tEfl6gxCOn@pilgrim>
References: <ZtigjqSbAWZYU_KQ@pilgrim>
 <daa579b2-c98a-5c7d-1bee-68c305e058b6@quicinc.com>
 <8c83ec2e-6461-394c-2bc1-f4d2db37cc71@quicinc.com>
 <ZtspUm079-A1WTHw@pilgrim>
 <9d6b7eb0-89c3-006b-cd05-15c072f45b33@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d6b7eb0-89c3-006b-cd05-15c072f45b33@quicinc.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616s-35jRxIPg
X-smtpcorp-track: WgwfBDMSPihu.Gj3bu8_tf4Tj.yOo-2wuVAqj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_061200_246330_AF372482 
X-CRM114-Status: GOOD (  39.71  )
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

On Sat, Sep 07, 2024 at 08:09:15AM +0530, Karthikeyan Periyasamy wrote:
> 
> 
> On 9/6/2024 9:39 PM, Remi Pommarel wrote:
> > On Fri, Sep 06, 2024 at 09:30:33AM +0530, Karthikeyan Periyasamy wrote:
> > > On 9/6/2024 9:27 AM, Karthikeyan Periyasamy wrote:
> > > > 
> > > > 
> > > > On 9/4/2024 11:31 PM, Remi Pommarel wrote:
> > > > > Hello,
> > > > > 
> > > > > As far as I understand a bunch (ATH12K_RX_DESC_COUNT) of rx descriptors
> > > > > gets allocated, then CMEM is configured for those descriptors cookie
> > > > > conversion and is kept available in dp->rx_desc_free_list pool.
> > > > > 
> > > > > Those descriptors seem to be used to fed two different rings, the
> > > > > rx_refill_buf_ring ring via ath12k_dp_rx_bufs_replenish() and the
> > > > > reo_reinject_ring one with ath12k_dp_rx_h_defrag_reo_reinject(). While
> > > > > the former is kept fully used if possible the latter is only used on
> > > > > demand (i.e. reinjection of defragmented MPDU).
> > > > > 
> > > > > It seems that the number of RX descriptors ATH12K_RX_DESC_COUNT (12288)
> > > > > is higher than what those two rings can fit (DP_REO_REINJECT_RING_SIZE +
> > > > > DP_RXDMA_BUF_RING_SIZE = 4096 + 32 = 4128).
> > > > > 
> > > > > My question is why are we allocating that much (12288) buffer if only a
> > > > > small part (4128) can be used in worst case ?
> > > > > > Wouldn't it be ok to only allocate just enough RX descriptors to fill
> > > > > both ring (with proper 512 alignment to ease CMEM configuration) as
> > > > > below ?
> > > > > 
> > > > >    #define ATH12K_RX_DESC_COUNT   ALIGN(DP_REO_REINJECT_RING_SIZE + \
> > > > >                                         DP_RXDMA_BUF_RING_SIZE, \
> > > > >                                         ATH12K_MAX_SPT_ENTRIES)
> > > > > 
> > > > > Or am I missing something and this is going to impact performances ?
> > > > > 
> > 
> > ...
> > 
> > > 
> > > Yes, it will impact performance.
> > > 
> > > Host replenish RxDMA buffers to the HW and after processing it given
> > > back to Rx path (REO, WBM Error, Rx Error). So it cannot be relate to
> > > one-to-one direct mapping. HW consume in-progress Rx buffer depend on
> > > Data rate mode. If RxDMA buffers not available then it impact
> > > performance due to Out-of-order Rx error due to RxDMA buffer unavailable.
> > 
> > Thanks for the clarification.
> > 
> > I think I do see your point, I though the only way to fill descriptors
> > to HW was in ath12k_dp_rx_process() by giving back the rx desc after it
> > has been used. In that case having extra buffer wouldn't be needed as it
> > wouldn't be possible to refill faster that processing those descriptors.
> > 
> 
> Explicit hw irq request is there to refill the Rx buffer, processed by
> host2rxdma[grp_id] under ath12k_dp_service_srng().
> 
> Whenever HW need refill it raise explicit hw irq.
> 
> > But it seems that there is a disctinct irq group (i.e. pci*_wlan_dp_3)
> > that is used to process RE0, WBM Error, Rx error but also to replenish
> > buffers if the refill ring is 3/4 empty (called host2rxdma).
> 
> above one

I do think it is when refill ring is 3/4 empty if I understand the
following excerpt from ath12k_dp_rx_bufs_replenish() correctly:

	if (!req_entries && (num_free > (rx_ring->bufs_max * 3) / 4))
		req_entries = num_free;

> 
> > 
> > So hypothetically here, if you isolate this irq to a specific CPU (e.g.
> > having more that 4 CPU one for each RX data rings and an extra one for
> > error and host2rxdma refill) you could have scenarios where the data
> > ring processing ath12k_dp_rx_process() could lag enough to be needed
> > this extra buffer refilling, is that correct ?
> 
> Depends on the data rate traffic you pump.
> 
> But you can experiment the reduced count Rx buffer and see the behavior and
> conclude the performance impact. Also consider the small size frame traffic
> with highest data rate, here more Rx descriptors used for the traffic.

You right small packet traffic could increase the rx descriptors ring
pressure and there rx buffer starvation could possibly happen in one to
one mapping.

Thanks for your clarifications.

This question came from the fact that we are using a Qualcomm internal
patch (not apply to mainline yet) that introduces a 512MB memory profile
config for which the opposite situation happen (less RX descriptor than
room in the DP_RXDMA_BUF_RING_SIZE) causing fragmented packet to be drop
(all rx descriptors being used for rxdma buf reception and none left for
ath12k_dp_rx_h_defrag_reo_reinject()).

So as long as ATH12K_RX_DESC_COUNT is higher than the sum of
rx_refill_buf_ring and reo_reinject_ring size that is fine with me.

Maybe that is worth to be asserted at build time ?

-- 
Remi

