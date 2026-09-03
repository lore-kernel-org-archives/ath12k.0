Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0821BC61DD3
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J5YWfIaliRnkRMI/8B08F7xEXXPvDk24J81082ruWw=; b=Grgwz+0PjzI9Oa3HI69yQKZKCw
	3vACJJ2FPX9i4GeaCaCmZqQ6cUHUI4KeGIXdQ3xgiYAF8foHvTWvKkBRLyax0J4kUUNcQ0p6GUIqo
	zuqTCHTtc3HiAspOK3YDLOhOBZX58tWOXjn+4K1OdvuNAnqZgzyT8ww2ty6YviuJB5Ygobara03We
	18F9t3Icwebkmhqe0B7jfuGU4WI6yK+g/Fnh/ulzrPlFwjJA5vq08fg3VK8zgCL8O3rwQEgjb0Dva
	OLxhbrXE28V6VkXVLZXqgLJ1zkhI3s4niKydTbiJmYPT0ekPf+BYK5o6OAbdekGxb2eEPIRgf9kFM
	+i9Gh9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x293M-0000000HZp0-1Okx;
	Thu, 03 Sep 2026 15:08:36 +0000
Received: from mail01.salmtek.com ([65.108.149.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x293J-0000000HZoN-2iqm
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 15:08:34 +0000
Received: from mail01.salmtek.com (localhost.localdomain [127.0.0.1])
	by mail01.salmtek.com (Proxmox) with ESMTP id D6AE440925;
	Thu, 03 Sep 2026 12:00:25 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salmtek.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=selector01; bh=1J5YWfIaliRnkR
	MI/8B08F7xEXXPvDk24J81082ruWw=; b=dfD8eQ8R+x6IFOQsNEcMAqLNcfmXOi
	R3ytSap652IMxEmJeV1bWZP4vJl1t56v4qomSiW6l/+t2+S8R76McKYmUVn++4yR
	iz8GRMGmxjDF/J3ambzLBMf10OtBVaAR174wt/M17OZG3Dbpn/StvFHjk/a2K0uR
	1FnrKg9Tb/bnaezI+YhljPphQHRPBMk8mWLw998HDKz4xXI411n1AKcO8ZJu3Cv5
	Pdo0shEpU4HPOcRd+5OlAOFIwwBKFCOzfbL0pISjZT0nw8wsq+QYDJa+EoCnBhlx
	uMgnbj5EjGUUO1d+itkpVVfx+zVMGIKb7ywUTfxBSpEbjcA0pd/EHr/A==
Message-ID: <376dbf6f-ecda-49ca-a7c0-af2a4077e945@salmtek.com>
Date: Thu, 3 Sep 2026 12:00:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: flush REO queue extension descriptors
 before freeing the qdesc
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831151011.2336305-1-sebastian.salmhofer@salmtek.com>
 <265ee3ce-b953-4cef-a34e-c2f51a86ec26@oss.qualcomm.com>
Content-Language: en-US
From: Sebastian Salmhofer <sebastian.salmhofer@salmtek.com>
Organization: SalmTek LLC
In-Reply-To: <265ee3ce-b953-4cef-a34e-c2f51a86ec26@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_080833_883140_FAA094EB 
X-CRM114-Status: GOOD (  20.71  )
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

On 9/3/2026 5:07 AM, Baochen Qiang wrote:
 >> The faulting addresses always fall at offsets 0x100..0x580 of a
 >> retired qdesc and never at 0x000 or 0x080, i.e. exactly the ten
 >> extension descriptors and never the queue descriptor or the 1K bitmap
 >
 > the queue desc offset should be 0x000, and the offset of the first 
extension descriptor
 > should at 0x080. However the IOMMU warning starts at 0x100, which 
does not make sense ...

You are right that under the driver's struct layout ext_desc[0] sits at
0x080, so that sentence of the commit message was an interpretation on
my part, not an observed fact. The observed facts, across about ten
days of logs and more than a dozen retired qdescs, are:

- every fault falls at an offset in 0x100..0x580 of a retired
   1536-byte qdesc (bases are 2KB-aligned from kmalloc-2k, so the
   offsets are unambiguous),
- no fault was ever seen at 0x000 or 0x080,
- within one qdesc the faulting lines are 0x80-strided runs, sometimes
   the full 0x100..0x580 sweep, sometimes a subset, and lines of one
   qdesc can be written back in separate bursts minutes apart.

Two explanations would fit that pattern: either the hardware expects
the 1K bitmap descriptor directly after the base queue structure (so
extension descriptors effectively start at 0x100 from the hardware's
point of view), or FLUSH_QUEUE_1K_DESC covers the first 256 bytes of
the queue as one object. I don't have documentation for the REO cache
controller, so I can only report that on QCN9274 hw2.0 with
WLAN.WBE.1.6-01243 the single 1K flush demonstrably leaves everything
from 0x100 upward dirty. Could you check internally what the 1K flush
actually covers on this target, and where the hardware expects the 1K
bitmap? I will reword the commit message to stay purely with the
observed offsets in v2.

 >> The writes are triggered by later REO activity, typically
 >> a new station association, so they can occur minutes or hours after the
 >> memory was freed, and the blocked transactions stall the data path for
 >> several seconds.
 >
 > then what happens? the new sta association succeeds?

Yes, the association succeeds. The IOMMU blocks the writes, so nothing
is corrupted; the user-visible symptom is that the data path stalls
for several seconds around each fault burst, for all connected
stations, which is how this was noticed (periodic freezes of
latency-sensitive traffic). With the fix applied the stalls are gone
along with the faults. Without an IOMMU the same writes would land in
freed memory. I will make that explicit in v2.

 >> +    while (off > HAL_LINK_DESC_ALIGN) {
 >> +        off -= HAL_LINK_DESC_ALIGN;
 >> +        memset(&cmd, 0, sizeof(cmd));
 >
 > unnecessary cleanup since all required fields are refilled in each 
iteration.

Right, and the same for the one before the base flush - cmd is
zero-initialized and both sites set every field the flush-cache
command reads. Will drop both in v2.

 >> +    if (rx_tid->tid != HAL_DESC_REO_NON_QOS_TID)
 >> +        cmd.flag |= HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC;
 >
 > HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC is used to flush all in a single 
cmd. since we switch
 > back to the per segment flush, do we still need it?

I kept it deliberately. The per-segment loop covers every 128-byte
line from 0x080 upward, and the flag makes the final base flush cover
whatever the "1K descriptor" object is, so the sequence is correct
under either interpretation above, at no extra cost. Dropping the flag
would restore the exact pre-b706fb4e580b sequence; that may well be
sufficient, but if the 1K-window queue is cached as an object larger
than 128 bytes on this target, a plain flush of the base address might
not cover its tail, and I cannot rule that out from here. If you can
confirm that plain 128-byte flushes fully cover a 1K-window queue
descriptor, I am happy to drop the flag in v2.

I will send v2 with the memsets removed and the commit message
clarified once the 1K flush semantics are settled.

Thanks for the review,
Sebastian


