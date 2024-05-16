Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8484C25B79
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17zVZWG/OQQGqSTTS/cBVbr4woQcbeu07ug5HCjCSGk=; b=Bc/fUCIYkAcsz9/w9LW3DpBovZ
	hQQb5OA66YqWWDrk39cNRxUNoOBHzcQRDVF1BflR2ukwoSHpFDJtjrysvzSth84aW2nKY8kTtrMTc
	9kTseElR76z9rkSyPybCXDNqQA5pl3KBztWRfEnHMbfQM3xfFwAUEotgZtYz85POSbooRJ0WPD99w
	U2pcvKQ5b9XZMs1YSwDSe7nxe4WiEkrlAJPaBJfyEwN70hHr/Msqdi4kZ3ibB6KIaU25XPQnlynYV
	5Cca4Omybck6PraULxsW4QpJ4/lahKP0HMXd0DtjFNfgksImJuBbPQS4X89hVdqa3DZfj2EU+i/+w
	uHeHD8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WGF-000000047DA-2FrX
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 08:14:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WGC-000000047Bj-0FFX
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 08:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F13360B1B;
	Thu, 16 May 2024 08:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F85DC113CC;
	Thu, 16 May 2024 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715847283;
	bh=wn/F+J5SVSvsBC//lVjkwnoyTcauUvEZVGt08Eaw8DA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Y3H4vIfggMyvT27b0YA78hVdWIo4JmQDP3RUwMPCxq7/lMsgZe7f1GAjXbR542dna
	 ZVyD9SqZYy0LOVOWsH/MAqfwvZZpd+96bRb5gjFcpNgMO12KQsUOssnsg57czh5Xdd
	 E6F1vJgcFZxY3MFz7BB3GspH4TBcEJwT+J+oLAUHRK7rqe4FMBqSQEzoZnZhBH9PPn
	 CG/JW2wpWnPxkSYdWxale4g6Xxc0Yl82O5sF+4WK+iIUd+7m6xY14JJJIKAqI19Qax
	 3e+yq4VkkC0wtleG/S3HmALW85iti+RzL1AlOPyMscAWx1GtzAefUdlqUWa7RzTG15
	 qBTO6GvAjTGQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH V5 1/6] wifi: ath12k: add channel 2 into 6 GHz channel
 list
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240508173655.22191-2-quic_pradeepc@quicinc.com>
References: <20240508173655.22191-2-quic_pradeepc@quicinc.com>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171584728006.2755978.5369432703895117154.kvalo@kernel.org>
Date: Thu, 16 May 2024 08:14:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_011444_179389_8BEEE4E4 
X-CRM114-Status: UNSURE (   4.68  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> wrote:

> Add support for the 6 GHz channel 2 with center frequency
> 5935 MHz and operating class 136 per IEEE Std 802.11ax-2021,
> Table E-4.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

6 patches applied to ath-next branch of ath.git, thanks.

3745d7963cc3 wifi: ath12k: add channel 2 into 6 GHz channel list
c3c84a74bd79 wifi: ath12k: Correct 6 GHz frequency value in rx status
70e3be54bbdd wifi: ath12k: fix survey dump collection in 6 GHz
112dbc6af807 wifi: ath12k: add 6 GHz params in peer assoc command
f0e61dc7ecf9 wifi: ath12k: refactor SMPS configuration
97b7cbb7a3cb wifi: ath12k: support SMPS configuration for 6 GHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240508173655.22191-2-quic_pradeepc@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


