Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644C5E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Bv3vppWtGGtDEyiCJZCddTGIumYjytccQD/zB3dCLI=; b=TaLDlVudXH9vSYkZ/8TIDn6ssn
	wVuKIQok5uhvXUIif+1aDkrWiGQct5UegkDBDuBW4ML3tUK/3dAW7w387xTBicPaMg8cAAsYemfYe
	+vVLFkaxvHNsvcdAD5Wpl9A7Qzmu35p9UjMGxXlPkUs0YNJYWi5SqfxV2C7pNj/HnCaXGxUuB121T
	LjNH3uopZvc0DOAtRQizJRCmIQv0Gec5/RQwSvqCj/F4o65J0PuoEXpNlK8eFiWhlYqHivf9eC1Jn
	6IvEdnT+GZnQduxN7yhEsNRm3K7nJCiRc/SJahQ05RwfZvHSxd4eTSwXqGdePodKrCWQ3SLpLEHFR
	r/IUWi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEi7-00000001fPs-0fWx
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:28:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEhH-00000001fHj-1Pnd
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2CC7A420A9;
	Thu, 19 Dec 2024 11:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35461C4CECE;
	Thu, 19 Dec 2024 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734607681;
	bh=ampQwOjpQ3nLz2i3Ha1t4hsgPOsUWyGofe6L9xs8eqw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Oqy+PQNNWw5JBjFs0tMVaDrcsV+G5D5qSv1fAgL3GRXImE+yyyRopuuZz9ueh8M5K
	 NYafqEYoXVu0rNXg29x0qHvUCrnNyKn83UlXT7wSfcmORD4le12I6LAy4FI5zwL65v
	 7cNk+rMMYuSfoHm5dPlZ3P3uIV4jWLwgD9Wl10FKHZ5qe74K9NC0Goochbqwgzq53/
	 aaUU3n1r2+VnHw8NRQOvDWAlbQieF/62pzoPybyw/bHBiw+WMol3GltskypnPG3R5O
	 +/iUC1TMHZ6yqeakhbcdbudJA+AD6/aZTk0LVqxKVZ2B8/frtt9x+S8nOcizcWs3LB
	 HZYa5xE51ROFw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] wifi: ath12k: Refactor the monitor Rx parser
 handler argument
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
	<20241219001006.1036495-2-quic_periyasa@quicinc.com>
Date: Thu, 19 Dec 2024 13:27:59 +0200
In-Reply-To: <20241219001006.1036495-2-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 19 Dec 2024 05:40:04 +0530")
Message-ID: <871py3kj40.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_032803_432975_52913FA8 
X-CRM114-Status: UNSURE (   7.78  )
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

> Currently, the monitor Rx parser handlers
> ath12k_dp_mon_rx_parse_status_tlv() and ath12k_dp_mon_parse_rx_dest()
> take the device handle from the caller. However, these handlers
> functionality is technically pdev specific. Additionally, the device handle
> can be retrieved from the pdev handle. Therefore, for better code
> understanding, change the monitor Rx parser handlers argument from the
> device handle to the pdev handle.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

