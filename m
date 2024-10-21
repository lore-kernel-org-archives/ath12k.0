Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DADD0E6D1
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+WY07DNy0hdx1WsFXEQ1sBXpPoPlCfcSL3Tl25mhG4=; b=w2gBVPjj4vfP/paTVb9c2GPhYR
	wrer5B+sJ6aTwavV8YCNdDQ+xbAdcct2d6JOLIGv8Geu6NcC8lDqXnjFZ21I3qi3L6N+q4BEM+l9j
	jWsAGg+UambPGwXua/4uyrUqO3Jh56J/QpMarOpkrV045stnD8glDMD6duOeXhag07aAI9Zee/+3S
	vk32EtVo8DAE1TzD0mbu5ILrtzgPfroM7OKugTN1dMv3DS/uUdWoyIuayw4OOmmDK2jP9P/Oby2DA
	nK1WkD+jfglOJzvmOeOADyhecKLVY0cFWTwMc7phO2YzkzcA2KYBQ2UbcWE41qV3d5bE/e3MkyXj3
	Qz4KD6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o3g-00000006biI-2u2A
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 08:46:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o2E-00000006bD4-3Mxx
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 08:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BD25A41663;
	Mon, 21 Oct 2024 08:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693D9C4CEC7;
	Mon, 21 Oct 2024 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729500305;
	bh=Z531AU+Adzly7NPj2EIT6VlzGOt+N0VIBt+SynIJXQU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QO4Dax31rTnlpqpKSyTAC03AodMTerDhGTEFy5Zb++VvS30BJajRGjPC7nzhgAS4f
	 Rx20xbHL4TABjwyO2UwSb6OCnBDkcBw+n6J29a1PTDG1lTa3Pb0v2Qy1LQUBbIyOE1
	 bQpwVSjqTTpomu7PqnbVxz5wR8CX4fIy/egpqcdtRGnwG70/rJenuaMIk8zu3sCIdX
	 xyY8EX2X7GJxG1pHUp9LkZfxdILlYkfneqBnk3Wudso+WCLyjpMKKnOQrZ3ebpcjCh
	 s4FqlyL1xHeMIpNnnqUePX5dyr4jH2CIo13jBGkmgxo+cfsfMMLlcf6/MC7uZfqAwr
	 yxnh0fGnbsoxQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 03/11] wifi: ath12k: fix struct
 hal_rx_ppdu_end_user_stats
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
	<20241016065700.1090-4-quic_kangyang@quicinc.com>
Date: Mon, 21 Oct 2024 11:45:02 +0300
In-Reply-To: <20241016065700.1090-4-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Wed, 16 Oct 2024 14:56:52 +0800")
Message-ID: <875xplrgj5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_014506_988691_E2D71D8D 
X-CRM114-Status: UNSURE (   7.14  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> Current struct hal_rx_ppdu_end_user_stats in hal_rx.h is not matched
> with hardware descriptor definition.
>
> So update this structure and related code.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

What about QCN9274? The commit message doesn't mention anything about
that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

