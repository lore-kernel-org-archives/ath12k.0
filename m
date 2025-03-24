Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C51C36008
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 07:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuI9ML+drYWwKtWX+uR4jnIZEbeFi3HT4tjIHOve/jw=; b=n2A1h3jzC2POWt1j9IGHGN9VXW
	ZBsL6jdttorKnu44//4wtd7UC7JsWlT8oAQ9nxv46Oi4o1gW9SlYq42aCcduVeRl07WWzUxNVNHrf
	7WHAgI1fAxBb3ZYrOvLtr7zjM8P95MdFd3SseJIIH2NUKdz5ECOkK36155ZvC3TcZto6XfsRj6qQd
	UGUA7YLaQgaloblMkkunVEyNq4hpDz5L1+bMd3JovU3CR+eqMyzOV1pUrEfLF6yaBkhCkp48YUIPn
	f7UGiIS+9V70RmUVqNLwIpvhEaoDt25fQ21rT/95DJFOZsjfIEKhfFGY6qX9+FleRd1Jt+lpSjqRi
	K/BhtBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcUN-00000002UAr-2faS
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 07:44:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcQU-00000002TYj-225e
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 07:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C1BF4354A;
	Mon, 24 Mar 2025 07:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C36C4CEDD;
	Mon, 24 Mar 2025 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742802049;
	bh=KUqixwmO+35gYsBPPYWU1oROSkdcA9VLRLAUEx3ST9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fToEkBOA6B+/Ut29QBr4OITyRoQ3XHfxV++qrtVoVMFtdaqZ15dwRmw5fcCAFjfAi
	 oUOZuQ/zSf/SNMewkiKwTqONwP+eQoOUlUU4hz5eenvSHoMfOMSfh1nEabMcclU9vB
	 xQbuwqFmevBqyfawnHg1sg8A7kt+Maq+Kd0hUsbp4t/vFsUvnMfY3OkLd4wtKAQxxp
	 BBjB2NKykr/obBR4x5MyuYvt8Bu/kwMNzykK9PyIlOm2K9tbphHGrUqIdJhVs9zSdx
	 Q0Jph1LQ+QWRnm0lti3uSBPNnxDoUd1pGfglDzgeDr7xpIuWSpzReJTAmDfqatLmr5
	 QlFC/ZVpZ421A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twcQS-000000001Jn-02fA;
	Mon, 24 Mar 2025 08:40:48 +0100
Date: Mon, 24 Mar 2025 08:40:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Message-ID: <Z-EMgPg5Gp-JtTZp@hovoldconsulting.com>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <bc3601ae-5639-4ee4-bbcb-4e39b542bfbe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3601ae-5639-4ee4-bbcb-4e39b542bfbe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_004050_542971_9F957D2E 
X-CRM114-Status: GOOD (  20.61  )
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

On Mon, Mar 24, 2025 at 11:06:16AM +0800, Baochen Qiang wrote:
> On 3/22/2025 12:23 AM, Johan Hovold wrote:
> > Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> > without an iommu (under OS control) similar to what was done for ath11k
> > in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> > DMA").
> > 
> > This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> > Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> 
> why bounce buffer is used at EL1? is it because IOMMU is not working at EL1?
> or even because IOMMU is not present on Elite machines?

As I mentioned above, the IOMMU is not under OS control. The boot
firmware / hypervisor has configured the IOMMU in by-pass mode and it's
effectively missing from the OS POV.

Note that this is also the case on Qualcomm platforms like sc8280xp
(e.g. the Lenovo ThinkPad X13s which already benefits from the extended
DMA mask for ath11k).

> > Note that the mask could possibly be extended further but unresolved DMA
> > issues with 64 GiB X Elite machines currently prevents that from being
> > tested.
> 
> could you help elaborate how it could be extended?

The mask should reflect the capability of the device. That may be
64 (or 40) bits, but I've only been able to test using 36 bits.

> > Also note that the driver is limited to 32 bits for coherent
> > allocations and that there is no need to check for errors when setting
> > masks larger than 32 bits.
> 
> why is it not necessary to check error?

The DMA-API documentation was recently updated to clarify that there is
no need to check for errors when settings DMA mask with 32 bits or more
as the call will never fail in that case. See commit

	f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")

Johan

