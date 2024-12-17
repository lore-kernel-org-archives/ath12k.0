Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F01DE7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z62Ig4fhhm0y3OV7kK268/8kJt7H4CN0WAoc/lzOeVM=; b=ehJpXYOSfvS89drtxlS7A97AF2
	Gz3ENEgqlWP7EzbLKCQDqoM6aPo+EmVoW1UCt8H5Ny2vi+u9gHrr/AKJgGdb0WiGw72CVgFWWHrc9
	eKu1f5cTvePlpzTwrIi+/HlP4zYf3GYoWI6da+RIk2yQAEmGmIChgd+zlz5kgUcgcuyQV5TuqEKVm
	QT8b77ETkV0TmrhcPtor5Z3QcCJbh1/eRVYTTHfwxjN59hJKsC4ZjTiSth03aNK6ByPedFlkbYeb6
	vqOZRsYRdxfvQlWRTmVNMymJSOoVO5TQIfS0J0u5+5wJIRwg+AA/hPRCgeXbWfBWxd2Yqxvr1iMY7
	9QiJ6kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNddS-0000000Egk5-0O9v
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:53:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNddQ-0000000Egjh-1rMd
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF6E65C475F;
	Tue, 17 Dec 2024 19:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921F4C4CED3;
	Tue, 17 Dec 2024 19:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734465215;
	bh=pj+yxV8FV5mtqrf87VgeRSFczeCBpTFhHO6uGHQ6948=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lcrN1qvw/3o10wYH0pYwHPzj4Zx6SOg0XuNBv+2t6EI/nImPaTq5xmqmBzfF+n3ys
	 JYo1b9c5XKN2rjdEsKaz8xqZWVc6uHAUyKLb5nnsF3CbB7sPl4toYSC37YPjgEmv69
	 VmHzU27UGt1jYpzfOjUgPh63Rx9c3HDNPQv6bK5HhUEcICpP/XDESzfRX4szKnybOe
	 e7jrevrCd4SH9VM7P4EVkiXlLPXOoHGmk9HRY9z9Sdt6sg59mf9hEA3Ok08ONMF+QO
	 xgcStRM3ESRgZ2Od1g4StNnvcE2pQ/lvJ/9ggwXmpRPXKaknmHI1tLCPVOut/pocZs
	 qGl4BrXMWg8Ow==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 5/8] wifi: ath12k: fix incorrect TID updation in DP
 monitor status path
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-6-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:53:32 +0200
In-Reply-To: <20241217084511.2981515-6-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:08 +0530")
Message-ID: <87r066jdc3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_115336_524683_C69B2F63 
X-CRM114-Status: UNSURE (   5.02  )
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

> Currently, an incorrect TID value gets populated in the monitor status Rx
> path due to an incorrect bitmap value given to the ffs() built-in helper
> function. Therefore, avoid the decrement and directly provide the TID
> bitmap to the ffs() built-in helper function for the correct TID update
> in the monitor status Rx path.
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

