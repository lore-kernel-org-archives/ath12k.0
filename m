Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFD5E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjU/cc0oaK2MlJpjFmrm1AvCpvqSP0dx5+w8ExGblQ8=; b=PTHbxmTm/t8XROQHMpTLZI6k34
	QUGogOhr++8uBk29V6YuAGjzzCpDF0lTAZcQm87bHLpySmp1JYK+bnHC376t30hMDnyd0BnRuF5Ju
	b91xmrogN+V87NP6CUCAmBFQd41OMugoGXFqb2nIaLYqghHglTC5U79RQQuUBmTXYX9A/xgZWIx7e
	s8Fucyy70b5oGbb6pucb44B7DSzyljPIY+OR/WUdS2M68hQxYEkkKS+/2Iiwh61TQrt6htky/MmC4
	MnxANAqQMFGK0vJx56hqvUHQbxmb+/WpIrKkHCtxFGz99cUqab937JC2pE74I9sfQXOzSPmG1JZOB
	hPqKUxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZ55-0000000Ds4o-0L9l
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 15:01:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZ4P-0000000DryR-12p8
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 15:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB83BA419C8;
	Tue, 17 Dec 2024 14:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75263C4CED3;
	Tue, 17 Dec 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447668;
	bh=695XyT9HylzgQMl6LI188n8hrO1dbwChaw9J5Kqj0O0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Vo+BQ0X0J7VQWJA07OemM6PYOC1TZBr3PjDHYZVRW4xAeVyo8RmR8hc/aiASE0Y/N
	 FXZJQUOFMG01byk2MnFpx3cFXhkDivwLqwHmo+sNPjsRHfnpLM7poTjHJxkNMYjzQT
	 QxOvznGMetaEmelUxC0JDmKVpqYxDRulhgmlZg6Ba6c6xXEYxam4hJQfHa4X4dH5is
	 NBmICk9ECXCLdcZsTiSACL6IvB6mKNZeKg6nIb1LowpD0+XLcJ8r1IS0f6hXBihZUf
	 FavK0FG6vNPt6pl0S6MFLoKV2dKTyRTWODM97fNjc3tFBKOGlfxFBtkb6E+xZcz7N/
	 PgoMKQ9sB7O+A==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Support AST Entry Stats
References: <20241217055408.1293764-1-quic_rdevanat@quicinc.com>
	<20241217055408.1293764-2-quic_rdevanat@quicinc.com>
Date: Tue, 17 Dec 2024 17:01:05 +0200
In-Reply-To: <20241217055408.1293764-2-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 11:24:07 +0530")
Message-ID: <8734immk0e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_070109_348662_97B8104B 
X-CRM114-Status: UNSURE (   6.34  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> Add support to request Address Search Table(AST) entries stats
> from firmware through HTT stats type 41. These stats give AST entries
> related information such as software peer id, MAC address, pdev id,
> vdev, id, next hop, etc.
>
> Sample output:
> -------------
> echo 41 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_AST_ENTRY_TLV:
> ast_index = 10
> mac_addr = 00:00:00:01:00:00
> sw_peer_id = 0
> pdev_id = 3
> vdev_id = 255
> next_hop = 0
> mcast = 0
> monitor_direct = 0
> mesh_sta = 0
> mec = 0
> intra_bss = 0
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

