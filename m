Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD63C25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05psnFQx3KL2aE6vbt53pQ4a6FM66CuEMz505I8Pupw=; b=QflwRN4CjCt4utjgB6Umg+pRlg
	juCIvqeYGd2rSdWt2hGBUWzFqSuHnWWoesgK+Mnej3j8d65jxek1ePacpDwfUUVpSNEplHVnXjgW5
	9wcXAcCqrbL5UtN/YEYOcXwSh2G+h1D0eCtgZI7Y81FsOUcOZv/sZ3KiaBQ+JCl/PCGtxdxCsarG8
	A2iuUrqZIIoIBhCabGzNmg2yOdJEYidFcq/RQnn6U+CehBO4BwFAmln9J2nXkDivpAmtLJM1aiATb
	C0+Q3K52UQ1uFzlnI8X6L9H3utGyke804aBkokVqae9aoHlV4OQv/BXdHKAUdMRhidKOFEkzIXIzj
	CoeLL0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WTI-000000049JC-0ja4
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 08:28:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WTE-000000049Hq-1pUV
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 08:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEC7661680;
	Thu, 16 May 2024 08:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884E4C32781;
	Thu, 16 May 2024 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715848091;
	bh=ggjW04lfdhLtlVTx4tcwW8wmdPIkydrWTgyuQzrr6f4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NPxbWDQRpA/EYE4skb6yU0DIkgpvA47+8KFq+2qFumiWAcYliyWqhk0w8xThL9uSp
	 VC6duIor6PlB9gsTW0DSuOyYO6ngtkt6UMzYjaIB+hLLL4uhtrvs6YB5Zx5tjgNtqL
	 d0xEae30sOc/1iJGF0AYipGkcRSMXCf1qy2A+3Nwlwhzss0u6DXnbU+Xlb6qzIz23B
	 Qphp2EQMBbXjdEvDfsYBLn0YRzo4PTS/QpteUz6hzrMIS873zTcQ/uJsO2doL1Nsxm
	 2DbnuEZlntPtn3XtP/LPYZ3THD1b2qsPfe57eaK810iGt40PM+G4A6gBK/RaF24bYj
	 pqravyAw6KxRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: remove redundant peer delete for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240510111238.1113-1-quic_kangyang@quicinc.com>
References: <20240510111238.1113-1-quic_kangyang@quicinc.com>
To: kangyang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171584808882.2786544.12095654919526676063.kvalo@kernel.org>
Date: Thu, 16 May 2024 08:28:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_012812_551934_51F8A87F 
X-CRM114-Status: UNSURE (   7.47  )
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

kangyang <quic_kangyang@quicinc.com> wrote:

> ath12k_mac_op_unassign_vif_chanctx() will do peer delete for WCN7850's monitor
> interface. But for host no need to do peer create/delete for monitor interface
> because firmware doesn't require it, QCN9274 is the same. Also, the first
> judgement is true only for WCN7850, so this logic won't affect QCN9274 at any
> time.
> 
> So remove this peer delete.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3a29442a1741 wifi: ath12k: remove redundant peer delete for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240510111238.1113-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


