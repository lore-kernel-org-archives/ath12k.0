Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835D3E6FE2F
	for <ath12k@archiver.kernel.org>; Fri,  6 Sep 2024 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baw+SVvOAk5efVAO4tua1i5gHWYTfxpU8bwwqfxNki4=; b=1baeJ1V/Tbfd4zSHci1iZoCx77
	RJIpP4UBf4wDHh0MrXePtt/Yl4SeV2SUt509pyQRBnIPnejIVjmgA9YPLSyXHLA04+psluz20Wq6o
	mimiok9Whh+iXCGzTMnHVFACh34t7M4vDN+g3wuVVQoTc9ReqH8u/s+1pafr6L0k7Reeyrzb7x1Qy
	N3rZ2PPEcz07Av1nijirKZa96cfnwOPu0SwltAMz4oWGyO0OJFJ1FEqUHywCPWBpDA1DAvgEvtunE
	bRQe4sEfeTZFfunQw1V9CfExUGsddfnPihtKkTkCS91pxYDF+Cb56f338fzppnpjsjZ2G1LBZUhjI
	PM6SzpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbfa-0000000CwLf-18AH
	for ath12k@archiver.kernel.org;
	Fri, 06 Sep 2024 16:18:46 +0000
Received: from e3i110.smtp2go.com ([158.120.84.110])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbVY-0000000CtTY-1IZO
	for ath12k@lists.infradead.org;
	Fri, 06 Sep 2024 16:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1725638890; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=baw+SVvOAk5efVAO4tua1i5gHWYTfxpU8bwwqfxNki4=;
 b=JKZxz+ye4JTBw7k4txdct/O5TVi6dfUvlRrkPkSBYKe5KSg1yecf2OigzsajuXem8u2P4
 JJV/Da4WB1IinLVtPqagPRAnwVIDGAL+VqVGzRVw0r/SYXADTbru1X1nXfIuVTzfSd5fmsl
 EEbOufk+Ia/Y1L0JQmloxKh9TrfxHYp4NRTCeCVK2keAABe8N5AHNcy2H9HfAshLUKrHPTQ
 MvOfJ6OBwOMbPO2FPbETfNbRHra3xjjnhirBwST/VG5ASLusCdYVyIWfEcJvazEO6ULySXm
 jy6A180npeFvlQ0HtOcR/P6jMBh6MLLmyfQsNpI+yllDODQtvNJ64ZGfEWMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1725638890; h=from : subject
 : to : message-id : date;
 bh=baw+SVvOAk5efVAO4tua1i5gHWYTfxpU8bwwqfxNki4=;
 b=OyFLsGyWCgLsykNz1m3RDnvvOnQykn2IwzddFpFAbsI5VOLYwosTC9TmZtRR65umJjAP1
 jGmzAefpey2J+G9xeceAlFUKFK8v0lJVP2LZreWtP8K6iV5fGGXnN4ZgFALSLZqWyc0kwER
 EQrGusz7gaknvxf3InahUSu1k4vwX8jsBgZL+4YnBH69+tMnZHmEvdf/7tvkQzquZkzEVlC
 uHHaUg5u92wc2I66fYXRyDk0j+UnE4s/Q1+bdkryOktZ6agH6A2KmCzwViIulRTtfD9A4ge
 bpGV9q4Hp21vvqsjKcViPjnPHcpjY84beeknxMi4BZDcmOl7zwnifbB7TL9w==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1smbVH-4o5NDgrrXyh-niKz
	for ath12k@lists.infradead.org;
	Fri, 06 Sep 2024 16:08:07 +0000
Date: Fri, 6 Sep 2024 18:09:54 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: ath12k@lists.infradead.org
Subject: Re: Allocating more RX descriptors that can fit in their related
 rings
Message-ID: <ZtspUm079-A1WTHw@pilgrim>
References: <ZtigjqSbAWZYU_KQ@pilgrim>
 <daa579b2-c98a-5c7d-1bee-68c305e058b6@quicinc.com>
 <8c83ec2e-6461-394c-2bc1-f4d2db37cc71@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c83ec2e-6461-394c-2bc1-f4d2db37cc71@quicinc.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616s-35jRxIPg
X-smtpcorp-track: dBrPrcxGr-We.EKQHQH53l_tn.72MtqQb8QDs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_090824_707941_A2175D41 
X-CRM114-Status: GOOD (  29.35  )
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

On Fri, Sep 06, 2024 at 09:30:33AM +0530, Karthikeyan Periyasamy wrote:
> On 9/6/2024 9:27 AM, Karthikeyan Periyasamy wrote:
> > 
> > 
> > On 9/4/2024 11:31 PM, Remi Pommarel wrote:
> > > Hello,
> > > 
> > > As far as I understand a bunch (ATH12K_RX_DESC_COUNT) of rx descriptors
> > > gets allocated, then CMEM is configured for those descriptors cookie
> > > conversion and is kept available in dp->rx_desc_free_list pool.
> > > 
> > > Those descriptors seem to be used to fed two different rings, the
> > > rx_refill_buf_ring ring via ath12k_dp_rx_bufs_replenish() and the
> > > reo_reinject_ring one with ath12k_dp_rx_h_defrag_reo_reinject(). While
> > > the former is kept fully used if possible the latter is only used on
> > > demand (i.e. reinjection of defragmented MPDU).
> > > 
> > > It seems that the number of RX descriptors ATH12K_RX_DESC_COUNT (12288)
> > > is higher than what those two rings can fit (DP_REO_REINJECT_RING_SIZE +
> > > DP_RXDMA_BUF_RING_SIZE = 4096 + 32 = 4128).
> > > 
> > > My question is why are we allocating that much (12288) buffer if only a
> > > small part (4128) can be used in worst case ?
> > > > Wouldn't it be ok to only allocate just enough RX descriptors to fill
> > > both ring (with proper 512 alignment to ease CMEM configuration) as
> > > below ?
> > > 
> > >   #define ATH12K_RX_DESC_COUNT   ALIGN(DP_REO_REINJECT_RING_SIZE + \
> > >                                        DP_RXDMA_BUF_RING_SIZE, \
> > >                                        ATH12K_MAX_SPT_ENTRIES)
> > > 
> > > Or am I missing something and this is going to impact performances ?
> > > 

...

> 
> Yes, it will impact performance.
> 
> Host replenish RxDMA buffers to the HW and after processing it given
> back to Rx path (REO, WBM Error, Rx Error). So it cannot be relate to
> one-to-one direct mapping. HW consume in-progress Rx buffer depend on
> Data rate mode. If RxDMA buffers not available then it impact
> performance due to Out-of-order Rx error due to RxDMA buffer unavailable.

Thanks for the clarification.

I think I do see your point, I though the only way to fill descriptors
to HW was in ath12k_dp_rx_process() by giving back the rx desc after it
has been used. In that case having extra buffer wouldn't be needed as it
wouldn't be possible to refill faster that processing those descriptors.

But it seems that there is a disctinct irq group (i.e. pci*_wlan_dp_3)
that is used to process RE0, WBM Error, Rx error but also to replenish
buffers if the refill ring is 3/4 empty (called host2rxdma).

So hypothetically here, if you isolate this irq to a specific CPU (e.g.
having more that 4 CPU one for each RX data rings and an extra one for
error and host2rxdma refill) you could have scenarios where the data
ring processing ath12k_dp_rx_process() could lag enough to be needed
this extra buffer refilling, is that correct ?

If this is right then that would explain why I didn't see any
performance difference as with only 4 CPUs (one RX ring processing per
CPU) the extra buffer refilling couldn't be faster than just giving the
used descriptor back.

Thanks

-- 
Remi

