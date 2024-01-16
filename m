Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDA2C4706C
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUF5MbMyE0Dr0MHZ0h16LctGyxWz967Rgr8zVHte0rs=; b=nMXkmDt1A758EzpoGoADywlKQa
	Ps1XFHtbfTBTuTNP1nfpGVU8cwr+mSCoxV5lved8zKvniCIto/6XvJ4sdsnQ2hQY0ETmMOb2RbFJD
	NKUqYBriJWXGD7l3unfmvoE8jRUqFbwiU0wjeZ05zsJd+X2Mx/NAJpyvi18Ka1L81ezxwZUXDvCkL
	Lyqd+pgXggUSybq9dxL4zuhXlaNku5u6lUN0iXtHBzi2ER2imIbsVbroh1ham0YxId8hCJWfSPM9l
	PTGuLuru5QXV+vE2D4mJ+Csc3BcpCzyhoDZLh3myBjQgyEu9Z0m1ZN4Xc2vJxxMrC61TlCcQ1mupx
	TXGzjNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiQK-00C3gy-2Y
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 12:20:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiQH-00C3gT-2u
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 12:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4ACA3B80D4A;
	Tue, 16 Jan 2024 12:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52A4C433C7;
	Tue, 16 Jan 2024 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705407603;
	bh=0CmDpSQc0Up0qnAibGSGxlDMH4yJggWHuZlFHOc0WmE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fZ9RZsgR5qpQOMImVAiv0M4+gLu8eXZDGqlKQpU56XO6/E7oB0aMWCog2Qdd9h6GV
	 QF2DP5BIXDkrAmctozG85PoZyQE2hldjJ8K5ybnxQ+H2aRFbEp9tVURM6A2hE4/xAp
	 5gQs6zCuNWuybXI9HIm+8fohhelPSJpTBXVpH/mdXPI3Q97PyKHYrhgDU3GxZDvSCR
	 932v/bHRaF8iulZm3YNV3YMLh2m1QoFlJLW+TG7nZk3IQRxtiH7dTOy9eB/Eb7bPjr
	 KineJVsj1DlCD4bGFlcUGT/bk1P0Jwdhm2fdVqNkRm/nWpU8lBXCSjXIiuweNPrGn3
	 Ie3A2e1grTGig==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] wifi: ath12k: Refactor the DP pdev pre alloc call
 sequence
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231206034920.1037449-2-quic_periyasa@quicinc.com>
References: <20231206034920.1037449-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170540760056.1846129.3705979634876364963.kvalo@kernel.org>
Date: Tue, 16 Jan 2024 12:20:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_042006_097963_388DC8D2 
X-CRM114-Status: UNSURE (   8.07  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently, the data path pdev pre alloc and mac allocate are called
> separately from the core start procedure. The data path pdev pre alloc
> can be called from the mac allocate procedure itself since initialization
> related to pdev happens in the mac allocate procedure. So move the caller
> of DP pdev pre alloc from the core start procedure to the mac allocate
> procedure. This change helps in the future to easily decouple the mac
> allocate procedure from core start handling in order to support MLO in
> multi chip.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

eaf9f17b861b wifi: ath12k: relocate ath12k_dp_pdev_pre_alloc() call
8a742a79f90e wifi: ath12k: refactor ath12k_mac_allocate() and ath12k_mac_destroy()
d2b7a6e5fa1c wifi: ath12k: refactor ath12k_mac_setup_channels_rates()
d786c9f5fe34 wifi: ath12k: refactor ath12k_mac_register() and ath12k_mac_unregister()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231206034920.1037449-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


