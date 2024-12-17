Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE14E77188
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGLP1pvp+ztHYJ9bsqrmKcLHSXDDD/oh4Cdrh0kGIGQ=; b=fxZUZbBxGev7ZuZVoFlfZziFr+
	RskMZphnBfC/Lmpo3yQpDAAEh+Qd6rZSBxjgJc133fYR+TK/T5DYX7htfdCy8mMtDej/ywttVZ7wz
	rObbmgjlbApDF/etELHK8waX5tqtrYPrUqY65awMiC2KAz+sF02wf0XWJdi0l+lqtksV5F/Ph61Q8
	K1YslskQHh8So2qE7rfh6/Up16h9Egs6ZvOFDeX9dglWTFZ/L2TcIYLfG8kRZS+/0F7bh/RYEQVt8
	khovxAEw1I9gPc16sCni/U+9ceuZTRl4jrqp8eJHM1cifixpb6J5Wa9OS+wKbYpge0awaau960+zU
	aliJmQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdYB-0000000Efrz-1vkC
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:48:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdWZ-0000000Efa3-1cZr
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9241A41F68;
	Tue, 17 Dec 2024 19:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393BDC4CED3;
	Tue, 17 Dec 2024 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464790;
	bh=5sVAcDPFSVsRqsIR9lmQUKYZwWMmNvGk01uv0xvSKB0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=L6twfzm1ksjxZEWdIAyMGA6F18H18jc8BokuQlJm/B6eJGhxDHP0h2iWYJAfz/mUU
	 ZsA+nmDhM0PSch/jj0rTM0CIywWUjq1+JNgsn7zOM5AlIgLLWGEecQOkLt7jFrFAiT
	 Q7W7Lxyd0MEj26sl0ZgD8+rPLftdFKXSLVj8SOZXOcmRlfq0GKvG9S3S8xHOa2smcW
	 seKIwWPlS4RdWH6fUNeo1hxA/XyunTJao++bKlAzLabCt9P2GvzSaMBTb6CoWPf+++
	 yRV9Hch0m9gx9CNg2D9f6IIvi2b/as4+mNa3kEUT3vTIlWQK3epCEP4q3oaDDcqiXg
	 Db/1UdcI8HLpQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 1/8] wifi: ath12k: Add documentation
 HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-2-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:46:27 +0200
In-Reply-To: <20241217084511.2981515-2-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:04 +0530")
Message-ID: <87cyhqks8c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114631_491214_DFCA72DF 
X-CRM114-Status: UNSURE (   4.95  )
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

> Add missing field documentation for HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
> command with indentation alignment.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

