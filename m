Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C97C77B70
	for <ath12k@archiver.kernel.org>; Mon, 17 Apr 2023 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ej1PP1xkOdkyox/n+KHnYrv0GqtHIbyGUfZtnNyV4iU=; b=cUHk60fsGQdMkq
	6koTqbiliit16NUSkV/bFV1jdxtRXbgB9cm3kEX6L9FWy5zThoj8sR1Bv5xeNvgC+1SVcgIesMzU6
	UbRenWeKFCRAOFbCKTxBvuj19iWEPonQzbBt4KyG/6AkGhje3vGhWsUutb8tKi4/kI37oLYfrtAij
	ucp8grIZy3sy9nB/CImua/snvwAUw+Oyp1c0GLJNa20M0pEEASXfpN8+KY5fFjW1p5xRZN5ckr4gh
	9/ofkCZhEKpgJKVqyW1hIXWyL+mOvZSeLCGO33XjeGAHR9gZmvmAC8BPd5ymKtYtuo5EGErL04DTl
	Ngixy8J0EwFhD2fclMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPH-00GDcI-30
	for ath12k@archiver.kernel.org;
	Mon, 17 Apr 2023 12:56:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOPE-00GDbn-2c
	for ath12k@lists.infradead.org;
	Mon, 17 Apr 2023 12:56:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3275461A0F;
	Mon, 17 Apr 2023 12:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EBBC433EF;
	Mon, 17 Apr 2023 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681736187;
	bh=4C03S7tkBjOO7SnCpEldDUbKLnjxgFdc4gzMvtDUVB8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V0UIPqULyCPUlXr/DnZZqwAuzD9iOa4I+RwFRXWfqMr93g6jBbHPnsdC4zffe0FXF
	 3dUkDJe4NsHJEbVWKrwJmTaIGZv+winXn8BorJFJLLsU4EgdDeuxZbPImSX3wV83Mv
	 d+WBRGYUGmCpHHvXFcKEnKcWeSpbcSOoObJO5rC+F+i/z8ZV0+BSH3zpD7lx8yQws6
	 EHYy1r8ONYQbxSIeIaOfEHRsel21jbswSPMjrSJBCZXbRsuEZ6hj/DZxJRg8mJf1N2
	 dQ+ig9NDqq1xVxxuqsJrV5aq9iQCddgS9sUULzAxTSGCkhrugbTYp1a/RuQRUCanMA
	 +BQeS1mMEdImA==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Karthik M <quic_karm@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: add wait operation for tx management packets for flush from mac80211
References: <20230405054646.7300-1-quic_rgnanase@quicinc.com>
Date: Mon, 17 Apr 2023 15:56:24 +0300
In-Reply-To: <20230405054646.7300-1-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Wed, 5 Apr 2023 11:16:46 +0530")
Message-ID: <87leiqwttz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_055628_893685_F24531A1 
X-CRM114-Status: GOOD (  14.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> From: Karthik M <quic_karm@quicinc.com>
>
> Transmission of management packets are done in a work queue. Sometimes
> the workqueue does not finish Tx immediately, then it lead after the next
> step of vdev delete finished, it start to send the management packet to
> firmware and lead firmware crash.
>
> ieee80211_set_disassoc() have logic of ieee80211_flush_queues() after
> it send_deauth_disassoc() to ath12k, its purpose is make sure the
> deauth was actually sent, so it need to change ath12k to match the
> purpose of mac80211.
>
> To address these issues wait for Tx management as well as Tx data packets.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index a89e66653f04..499b81cd938e 100644

Ramya, how do you submit your patches? Your patches are missing the
"---" line which breaks my scripts. I have asked this already before but
no reply from you:

https://lore.kernel.org/all/87edqot8m4.fsf@kernel.org/

Please do not ignore my questions. If you continue to do that I will
just stop taking patches from you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
