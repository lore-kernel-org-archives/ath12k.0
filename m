Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9ACC71136
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHZp/4aLY90zc7AhrbSLcpaTp9NOdaKV46cl25CmtWo=; b=KQtZZBy1XkUYbnG6ModLPYhTs1
	w/sFVbXAXjhKjfEIf4NDxbGgDmIFK6yFcPffrNtccgp7JRs2YdT5FzVc+Sf9amYsZs2wcb3o5EMa9
	uytbpKbRQChloDBk4n2H9FFe2Lu5K5jaiXduNuqz1yxmEnXlDBiY/FzoqfFcXlcHARs/JRTETvtvO
	xGz0bNT6MxqsMpFRRxDGptwWNoggZqhc45rJ9pSLhoATn1lnG+xEtOh/uBdoXSljzdkzqmvmLS4Yi
	NpoqZDalSKfCh7YTepiD6ogE5hwGaQ3w4m1AFsv0sbiHULywchTcap+X6wntTL8DeXlX+BSZ3GcJ0
	BxMe612A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzu-00000006e9v-3nMH;
	Tue, 17 Jun 2025 08:48:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRxw-00000006dte-1Zwq
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 08:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7926A4056D;
	Tue, 17 Jun 2025 08:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CBBC4CEE3;
	Tue, 17 Jun 2025 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750150007;
	bh=UOC+kxOE3OLiMAYZQ8H+yk57DcCQ6dMktSpb1jyC+6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXmPsthdJOuimlL4S/oQli4WOuXI41v/dyqIfStlaJikD3cjHFQNJ9QJpwfoD76gl
	 TItbD3NTfoq4+GgKg1wTFekzpYALQb+GNBiXwThN32ghyR3zGQBwPDD4YePHNNpOqL
	 fdi+tx0QysjjARUkFKCoD2amPfQ7ldaGbHJJM3tOeZjvwKs06QrpPtqWV/RAPZyYgr
	 wtseBup9QqemwmilqI9W63RIEk5GpxWAr9lcWv8uteeT/Y4kv+4tJsvHTOFmHsxVaC
	 g8M7YKSPof+JYC2CgL7kAdOyGdS5aRzZivIn9HZ2IgbjKE0dRGE8aWXFKNSfIEX8hA
	 gm8qc8Kn1FwBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRRxt-000000003p7-16ok;
	Tue, 17 Jun 2025 10:46:45 +0200
Date: Tue, 17 Jun 2025 10:46:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Praneesh P <praneesh.p@oss.qualcomm.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] wifi: ath12k: fix dest ring-buffer corruption
Message-ID: <aFErdeZlT-Hm63pu@hovoldconsulting.com>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <20250604144509.28374-2-johan+linaro@kernel.org>
 <6f3eb9fa-617e-4434-8fc4-33dd92c4bdd2@quicinc.com>
 <aEFqsghEuJc3xxlU@hovoldconsulting.com>
 <ed06d62a-4b98-443a-a2ed-c92058bb521a@quicinc.com>
 <63c2c889-0a09-4b25-a1d2-2aaa92d75d9f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63c2c889-0a09-4b25-a1d2-2aaa92d75d9f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_014648_482383_D0B9B80B 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Jun 16, 2025 at 02:59:24PM +0530, Praneesh P wrote:
> On 6/5/2025 4:19 PM, Baochen Qiang wrote:
> > On 6/5/2025 6:00 PM, Johan Hovold wrote:
> >> On Thu, Jun 05, 2025 at 04:41:32PM +0800, Baochen Qiang wrote:
> >>> On 6/4/2025 10:45 PM, Johan Hovold wrote:

> >>>> Add the missing memory barrier to make sure that destination ring
> >>>> descriptors are read after the head pointers to avoid using stale data
> >>>> on weakly ordered architectures like aarch64.
> >>>>
> >>>> The barrier is added to the ath12k_hal_srng_access_begin() helper for
> >>>> symmetry with follow-on fixes for source ring buffer corruption which
> >>>> will add barriers to ath12k_hal_srng_access_end().
> >>>>
> >>>> Note that this may fix the empty descriptor issue recently worked around
> >>>> by commit 51ad34a47e9f ("wifi: ath12k: Add drop descriptor handling for
> >>>> monitor ring").

> >>> why? I would expect drunk cookies are valid in case of HAL_MON_DEST_INFO0_EMPTY_DESC,
> >>> rather than anything caused by reordering.

> >> Based on a quick look it seemed like this could possibly fall in the
> >> same category as some of the other workarounds I've spotted while
> >> looking into these ordering issues (e.g. f9fff67d2d7c ("wifi: ath11k:
> >> Fix SKB corruption in REO destination ring")).
> >>
> >> If you say this one is clearly unrelated, I'll drop the comment.

> > Praneesh, could you comment here since you made that change?

> Empty/Drop descriptor is intentionally issued by the hardware during 
> backpressure scenario
> and is unrelated to the issue discussed in this patch series.

Thanks for confirming. I've dropped this comment in v3:

	https://lore.kernel.org/lkml/20250617084402.14475-1-johan+linaro@kernel.org/

Johan

