Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71921C4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVQfVHyDO0dzFdl1I9bqWNOwdoSwDSZ7la0x0fmSyYI=; b=Klbh5c/Qm1LoCU4n33HS22FAJ0
	1q3RqQePlWo+QkdB/7R7GQP9Sse+XJIZLORwTbECBONIy3i2pGohcNExN5C8m1Ikgi2jWL0SGdCdy
	jTjosyIx10nveuoTbvyhLvlmfDR61GseBhmSKQEHSW8UPPQ6eI0R3xcVQBHGEjTe/hnTfCojtDVyG
	aEkwulIu4mtN3+fjpTaXywMMaVbR9XKXyNNHu+doGkoz5MBv1QnzDxdYWR98UVYIeIYzCLtEENShN
	P/IJ3I407AoZLskTjTIGcLWy/kuh8YIolqg2K9iodsfLidBuabjOtnVltGvo3OiG162hOoLKVqN3m
	l4r6ltag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCT7-0000000GfeU-2gjF
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 09:29:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCT4-0000000Gfdc-32JV
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 09:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 203BF61009;
	Tue, 23 Apr 2024 09:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAA7C116B1;
	Tue, 23 Apr 2024 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713864577;
	bh=va33LSpfG9xoKbsr+h4NzsKwBQyFiCv1ilCjjh0xDvM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HMHDQt3StuOWCB6OYEn7ISsjOx4CLQbmx2JP3s5jFBhAg27tG3Qdj1t7OTLjzus2z
	 PNBgfU7tWA5cCXHFeyOCxOZ2+z7k5GuloHEymsFzhHwyZhRYayHr7lrSrliLkK0OHV
	 9ceNF8KBmzQqc3Qyo4Jv6sNzdCpMOU0FDk1K5Ydbw3yxn+NN9spDqtdROmfFmQU7o4
	 f/DRJRum2jEshbN65KGSS3gVaTuGfCrrdO5zbZyQf7eKS9VRRNBqDm/tTS4i9jLCdO
	 6hyWjpt0FTUPZFptOEO/tB2u0+kM3zzieq9lTFHJwzpwwyGY/bTvYuhkBiEFccZHkQ
	 uotCVsBaKT82g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 1/4] wifi: ath12k: ACPI TAS support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240422033054.979-2-quic_lingbok@quicinc.com>
References: <20240422033054.979-2-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171386457473.1790113.408813248801980156.kvalo@kernel.org>
Date: Tue, 23 Apr 2024 09:29:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_022938_856602_FC6B0F8F 
X-CRM114-Status: UNSURE (   8.49  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, ath12k does not support Time-Average-SAR (TAS). In order to enable
> TAS read the tables from ACPI and send them to the firmware using
> WMI_PDEV_SET_BIOS_INTERFACE_CMDID command. Besides, ath12k registers an ACPI
> event callback so that ACPI can notify ath12k to get the updated SAR power
> table and sends it to the firmware when the device state is changed.
> 
> ACPI is only enabled for WCN7850 using struct ath12k_hw_params::acpi_guid
> field. Most likely QCN9274 will never support ACPI as the chip is not used in
> laptops.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

576771c9fa21 wifi: ath12k: ACPI TAS support
764883be7ed0 wifi: ath12k: ACPI SAR support
12bccacbcd9e wifi: ath12k: ACPI CCA threshold support
7b5f3cbfb468 wifi: ath12k: ACPI band edge channel power support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240422033054.979-2-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


