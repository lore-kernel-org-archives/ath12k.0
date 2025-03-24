Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FA8C36002
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PvDcdCbkdA1snRxUOF/VjTLlaTTZe/pCAm4cnRw7Io=; b=sluOAWt3DzRlYB3fEfZxHLb9Pq
	tbAAXfnQrQYn6ivUADbgcyC/6gzSCpT9duEOP15KvZZIAo9kV1bixVraa/EGi0v0RAfxiFd+k92D1
	ob7qXS/0cE+2E3bS1xP/Pi/GCbYbZqHs3cJqxOVCoh4fdM+IpeAJ1ln9lMQvi84hOV7mTArlXWJbN
	CZuleBY8dr6AdmPlKgGouQ2R398i8V34bT19Tl2DqQ7ENPUD/d4qdpZnn/Z3Xw3Xk4zW0L8FZiFtl
	8KxNNJgCdBkXS3IDZlydq8SJI76W/O3wqxwYerhJDnkZ4J+9n2gpxvcBBBkT/yNLLtC0vSpHe0Cei
	aOBQ4cQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twd39-00000002Z9X-1cuJ
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 08:20:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twd36-00000002Z8P-2mi2
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 08:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C80D437F8;
	Mon, 24 Mar 2025 08:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E15C4CEDD;
	Mon, 24 Mar 2025 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742804444;
	bh=pm3PhOm0TA6k02DhynwGtFtiCtph6tpxrXu52vqfi+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtkgwTkKTiHLTh6W7fKEvie4BMwHRQXCkZE3PdAAoF8K+ndo7kZIa2P/H5Oj4PU0p
	 I2l8EH+wGqKtMjyxfWHlkmX/GLAjqcaUphpl2qnfSCBKbtR5QAcXDXS0/16cl4X3ny
	 o22H7PXPfkDyXMgV/QDLqoXZLy6ckqmEMZcbZ3DtirAwyC4mNDZlTeaI3EMpXOsBOX
	 0ogQorMDKq3Eu9o+3nh0vohZm7d1qOj/x4Ndg6hcmcTlhsD5aPG0SZFdgJtDpCBUOd
	 D17mDo/elBEMRVVAsR03/EqaPjXfibe9w9wwTbHjwHIv62lZ8d4LTdr9l4oeNAznBg
	 2IavUGQQ/zySg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twd35-000000004Mc-2Evl;
	Mon, 24 Mar 2025 09:20:43 +0100
Date: Mon, 24 Mar 2025 09:20:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Message-ID: <Z-EV21KDfMHds73Q@hovoldconsulting.com>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <bc3601ae-5639-4ee4-bbcb-4e39b542bfbe@quicinc.com>
 <Z-EMgPg5Gp-JtTZp@hovoldconsulting.com>
 <a1aa02e8-7f58-46ae-b3df-ae43288cf683@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1aa02e8-7f58-46ae-b3df-ae43288cf683@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_012044_720628_626EF92E 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon, Mar 24, 2025 at 04:05:33PM +0800, Baochen Qiang wrote:
> On 3/24/2025 3:40 PM, Johan Hovold wrote:
> > On Mon, Mar 24, 2025 at 11:06:16AM +0800, Baochen Qiang wrote:
> >> On 3/22/2025 12:23 AM, Johan Hovold wrote:
> >>> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> >>> without an iommu (under OS control) similar to what was done for ath11k
> >>> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> >>> DMA").
> >>>
> >>> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> >>> Elite machines like the Lenovo ThinkPad T14s when running at EL1.

> >>> Note that the mask could possibly be extended further but unresolved DMA
> >>> issues with 64 GiB X Elite machines currently prevents that from being
> >>> tested.
> >>
> >> could you help elaborate how it could be extended?
> > 
> > The mask should reflect the capability of the device. That may be
> > 64 (or 40) bits, but I've only been able to test using 36 bits.
> 
> are you talking about QCN9274? As far as I know, WCN7850 does not support 40 bits or more.

Or really all devices handled by ath12k since they at least currently
use a common mask.

The T14s has a:

	0004:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)

	ath12k_pci 0004:01:00.0: Hardware name: wcn7850 hw2.0
	ath12k_pci 0004:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200

Sounds like 36 bits is the correct choice for now then.

Johan

