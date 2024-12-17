Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FD2E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JI4UlbteFsXy8JPp5VUeNr1H1kqwCurUyfrFfpvDp+Q=; b=fZM0jxXtOUeqT9Qo5viMM+wIHN
	QVZ+OfAps/lxdkwoEJby3ikfpUoGEnb3vq2EQVYDz7pfvfRfYJspV/z6ZIvIrpaRtVzSVcX9QoK4X
	8XIe8sb/4w8R7oV4trL6yYyibiP3C0pCv1S2NOVU9hJDnduPVamwod0espLIL6a74MmFGdPk7Urcq
	tYuU+TbdpKm0BaT1ieSgjYI7RzuDYGJ2kx+sY1M2///WdS6sto/szXcCjKp4zn4evMWw1itnaUqu9
	+6jZB86eAk2KcOdP1y2QWDe+KAIdTW41eAV0cEzaPA7JCn4lTsDxqj21ApsBFQ/HqS4OVDtjui6pn
	4HZO9UDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdbw-0000000Egcn-2jpS
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:52:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdbt-0000000EgcD-16OG
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0D33A41F7A;
	Tue, 17 Dec 2024 19:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283FEC4CED3;
	Tue, 17 Dec 2024 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734465120;
	bh=PFdVW3M2zsV6E+4/fr78kUGR4v72BEibCHPd8gxtqss=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=l/S3T4Dc1n2R1QznnwpPCRpSVMIoqc3hCN3lhSNWGtg7QY7LWjdtFe043yQmpsD0Y
	 bw5Hk2wmeAqMeK10gkV7H3hMWVx5AYA9CfFzYcfmeDAk0JbZV5CwhimQi72NdcsU6/
	 u819DufXKfXvnTtedWotXxial7NYU7rHZu89yBWS+jshyZzuH4tvYiKm1XAP4ZB7pe
	 wOnVdiAHzpYH55pOufZulxBbzTkjO+nqHtbzQXl2GKsZ5JphNuzt8foJBR+fjQo4Bt
	 n6tdGafY2KYBl710bWWyeG8P5H9DMHnV+fKt9Tbl55AqlOAq7Pp4ZdeDzYKdNfPoVr
	 QXAW5AlZIVLXw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 4/8] wifi: ath12k: Fix the misspelled of hal TLV tag
 HAL_PHYRX_GENERICHT_SIG
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-5-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:51:57 +0200
In-Reply-To: <20241217084511.2981515-5-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:07 +0530")
Message-ID: <87v7vijdeq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_115201_444023_E41450E2 
X-CRM114-Status: UNSURE (   5.66  )
X-CRM114-Notice: Please train this message.
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> There is "HAL_PHYRX_GENERICHT_SIG" misspelled as
> "HAL_PHYRX_GENERIC_EHT_SIG" in the comments. Fix the spelling.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

That's just a german variation ;)

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

