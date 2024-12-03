Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD8CE69EA2
	for <ath12k@archiver.kernel.org>; Tue,  3 Dec 2024 00:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3oZEMTew4cjjOcydTLo3TaKg3aZAl6qwnnp28D4azM=; b=lHlZO1THlFSInncTSefw9nQhF4
	ty6H2aXJT0CgDNY9UPM+aKSUc5WSF2ca2SsS860KX3RBXnhYum7kdCk/37QdxboJ6L7diCMYRUkpU
	GXRjEuwF9a495Dx8bbuVbFyhwQqWN2cl6f2j7S1F5sAHBh1Ar1vYdV7TAuuKWHYnyInG4vE64dQll
	wy6fIZi24sTylaU8icsXGkBmOL2nRtdcY00rm+Vj44RovPW0Eh1qH2dw56XYnWjIMfs2Hns38QAhe
	r7LXhcCx4QUgAqga8x7XgfeBGkvyGIwISywgFlGn/7NGBgs/AyRUm26noDPSuoThLEUvRx464zuFf
	AC5cXpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGP6-00000007lgC-1dSo
	for ath12k@archiver.kernel.org;
	Tue, 03 Dec 2024 00:04:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGP3-00000007lfd-3MZ7
	for ath12k@lists.infradead.org;
	Tue, 03 Dec 2024 00:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E58CB5C4D76;
	Tue,  3 Dec 2024 00:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE70C4CED2;
	Tue,  3 Dec 2024 00:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733184272;
	bh=hw6FnVa5vFrqLftPuCTEe23nXWJG217ueihs4BGmRv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MRgH8+goTM3SRnmzY0aYWZ1iI2+RpvEzFrvnJHwmPzaBrbnHRN2RSJCttObH5KUtt
	 2pIL0kyCBzrZ/etSdQS1dKd/NCKFLMMeb9ntB73EbnfXBVROQQ7vjcLZKcinC6BYsH
	 ZAn8l/Vm48zv0YzeSAOxbvOng9Gp8JOsmpNVi0GH5GMdMZrOJ2qTRopuq8FYOiQkPN
	 qlTNOIeohlw8gpgjfVU0dzzSwXMPOmPTC7XTpBCabNu2CyfYcwOf2/0ePdn61O5eZa
	 5TGijgfH0oEqGSsvXJLWWG8dAw+oXju78rA9eTAcwhntQZ340qbXXSsaY/XcNHs5q9
	 N+yPUdSh9HVnA==
Message-ID: <c3641fa9-b016-465c-ad16-bd7d952b090e@kernel.org>
Date: Mon, 2 Dec 2024 16:04:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Support Transmit Rate Buffer Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
 <20241128110949.3672364-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20241128110949.3672364-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_160433_895324_5A462B6C 
X-CRM114-Status: UNSURE (   5.45  )
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

On 11/28/2024 3:09 AM, Roopni Devanathan wrote:
> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> 
> Add support to request transmit rate buffer stats from firmware through
> HTT stats type 31. These stats give information such as MCS, NSS and
> bandwidth of transmit and input buffer.
> 
> Sample output:
> -------------
> echo 31 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_STATS_PDEV_TX_RATE_TXBF_STATS:
> Legacy OFDM Rates: 6 Mbps: 0, 9 Mbps: 0, 12 Mbps: 0, 18 Mbps: 0
> 24 Mbps: 0, 36 Mbps: 0, 48 Mbps: 0, 54 Mbps: 0
> tx_ol_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_ibf_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_txbf_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_ol_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> tx_ibf_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> tx_txbf_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> tx_ol_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> half_tx_ol_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> quarter_tx_ol_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> tx_ibf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> half_tx_ibf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> quarter_tx_ibf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> tx_txbf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> half_tx_txbf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> quarter_tx_txbf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> 
> HTT_STATS_PDEV_TXBF_FLAG_RETURN_STATS:
> TXBF_reason_code_stats: 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org>

