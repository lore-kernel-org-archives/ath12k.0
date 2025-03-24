Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D119C36002
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDZGSOKZip7s5RVIyLc8oUsdboRHIVfmt4b6RXHTuRk=; b=2g7Zt0PhgeK3kwkUmizcvrG0Y1
	/LE6WPcqw5n1JmJZln4B65qtlkIHNA7sl1pu8p6+876lNAbOqAXGqrtKv1oTErOu1jv5xwFOjJv1W
	MyVI0rTXT+4BHCjsZPEXycFR7g5cLToMfxiDtdRG72sHIvjWJzvvZiQkJufgUpjyU+fI6JFsy28xq
	/YUkY616vZobX4iB6LYWD7yARW4S8h9uksdJ+MTPSR9FKB/DMAadjX3p79Xxq/JuKBW9ItVXeo3ul
	+Tz3+6Kjr9WuWIqvoPqmvqKBaDHjG0KUvhd2U9YO6jnW8qsiHE+OI/WHWMmAGdBVqDMTaFKVgh0N5
	eRTJZ23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdx7-00000002hHd-3540
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 09:18:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdx5-00000002hHG-1aqm
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 09:18:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2FF65C4A43;
	Mon, 24 Mar 2025 09:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D79C4CEDD;
	Mon, 24 Mar 2025 09:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742807914;
	bh=L++YczgvJnIwhkE7OlWisH5OcBd8uFp6Wr4i0+0+raI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdnUlAlrR3eS1Dz0Nc8pSivrXWeW2H1OpCX+t4gyFN3FG4BnHfSYx1rPi3OSGK9co
	 QP1XYxd8lTW79KkUspl8cGigYYt1Fhv5Tms2O8vvjf03pPBsHQkRKl019XS5uxnCVu
	 G4jVDsregR24BPsFOrBfWTEo1GjgAdgq0byWYf9jRAPvo38qJ/nztIvxxzrmo+cwfg
	 opeO06ApxyWKwpJrvPgMW2iz7MmoOeNXpCVu1HVK/I+odexBXvm1d1BkFBt9yooFUw
	 7aJoa+sAMTUlPoraJxRxk/sbPxJmQQrpWttITh6/CSLZ4JGuGKJDeOfq/sqh4OhmV0
	 NVSMJ5+bZlP1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twdx3-000000005UG-06ly;
	Mon, 24 Mar 2025 10:18:33 +0100
Date: Mon, 24 Mar 2025 10:18:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Message-ID: <Z-EjaQ70mtQwQsgs@hovoldconsulting.com>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <0e2060ec-f0ed-41dc-8325-0ec839a59dd5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e2060ec-f0ed-41dc-8325-0ec839a59dd5@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_021835_471646_732BC3C3 
X-CRM114-Status: GOOD (  14.16  )
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

On Mon, Mar 24, 2025 at 04:33:13PM +0800, Baochen Qiang wrote:
> On 3/22/2025 12:23 AM, Johan Hovold wrote:
> > Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> > without an iommu (under OS control) similar to what was done for ath11k
> > in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> > DMA").
> > 
> > This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> > Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> > 
> > Note that the mask could possibly be extended further but unresolved DMA
> > issues with 64 GiB X Elite machines currently prevents that from being
> > tested.
> > 
> > Also note that the driver is limited to 32 bits for coherent
> > allocations and that there is no need to check for errors when setting
> > masks larger than 32 bits.
> > 
> > Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> With WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 this is working, so:
> 
> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>

Thanks for reviewing and testing.

Johan

