Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56996E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egR3BvJbv0lPGES/h09+lOJUtKYHO096HUAoWosb2/s=; b=FuF3WzblYqrE3BbHjTX48NgKEY
	XeLVjdxxhnMMYHeyvbjF3WPF5dtvpj+UFN8422lUNmq2todnTZ3T59hkOA7E3K13o+782HPPkdhCy
	fTnmCW/wHiNciPogFYLjdpuXJ2zOXpzQRh3/311xDz/CFXwVa2awJTSFdxQTJY4WUISeiL0PKdN+z
	P31fikJrdY0imHubnwnKLSv9nzlVyl+Yg0w+B4JvjVK/St1zq0piCSmzOF5wfrjTTVoPxspDR5qDn
	dEvdI6lqvQhBFjEqi5H9blB0Xsl+LpYnHZBs9YGUuEOBtm85u9pbUp/DXg6c5UJA7pgjHVjyV6Y3a
	q0KKJuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdfg-0000000EgzN-0WB4
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:55:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdfe-0000000Egz2-2d7w
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F1ABA41F49;
	Tue, 17 Dec 2024 19:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D68C4CED3;
	Tue, 17 Dec 2024 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734465353;
	bh=TYTlRh42Ds3nm+yPIRcHEzgRHFbUoen/POXu7Xcy0l8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZIoqh219qSIITtkhf/DRBQBhAk0StZzfL0Es8LEZkfdNO9bFXPRhBVErSNnVN9L7H
	 e58InBc38rMg21ljzOTglbuHnx5EoLuMfw3LfiYrpv9lLBchDmfqhq+z3bKH9pbLPs
	 2vsCLYhyKG/86CkUdQ5d+bnZc9W9Yu9PGz1cYpKw6mwetFOL/3VyATiZurAkrCfr+r
	 2Z60NVCHJOlCmpgbk4IYwHxH28+itUxyRBmf+BAP0vLPjYms/PynRQMIO/mD7Pao6T
	 Cb6O53yFZ+WJ6jVhHb0aocH/P3PQLmJeLncIkUPs1IGRRBE6nFcWqL4ImabNUsUZqn
	 WrlTynOy1Ijqg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 8/8] wifi: ath12k: Avoid explicit type cast in
 monitor status parse handler
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-9-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:55:51 +0200
In-Reply-To: <20241217084511.2981515-9-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:11 +0530")
Message-ID: <87ed26jd88.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_115554_735426_5CAC8FFA 
X-CRM114-Status: UNSURE (   6.91  )
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

> Currently, monitor status parse procedure handles all the supported TLV
> tags. Each TLV tag has its own data structure for parsing. Now, this
> handler is passed the tlv_data as a u8 pointer, so explicit type cast
> conversion happens for every TLV tag parsing. Therefore, avoid the
> explicit type conversion by changing the tlv_data type from a u8 pointer
> to a const void pointer.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Nice, less void pointers the better.

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

