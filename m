Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63DAC4345F
	for <ath12k@archiver.kernel.org>; Wed, 17 Apr 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnBglPSfKymd1NS+My6M4L1hWWc9xi4ZRf0YtCxi5bI=; b=Bj9DrI2fj0f+tCbQRZNPoYAzAW
	Ml/OXaOBpqKrXUy/LI7gqajgPBrQeETwZR2prUv3baP6yu730W9r5qSGKnSPirpzZKWxiXF5aFqou
	BjcVzJFG+yWfPACoorZ8hR4B4fC4ZYQtw20AC3Q/mm/++5oV/IHo3kK+odqNN6Q4JbY31veAQC4Ug
	TUXOUw16u9y7pj6yG1lq/oHye36v0aGCx2vg4n9vMuK8pR3GCig3bfMeWLJ2QSSOWY9bDeO7Ljy3G
	mUuTsSiZb8OOBv2wDGQe/zNpKwsbtItdy3YwBqRsUoeCmX0wC2wWSPJt7JADzmXnv/k3jx9jLa4Lz
	9prvLmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Mn-0000000GMnP-1FSk
	for ath12k@archiver.kernel.org;
	Wed, 17 Apr 2024 14:34:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Mi-0000000GMmm-0eoo
	for ath12k@lists.infradead.org;
	Wed, 17 Apr 2024 14:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0979ECE139E;
	Wed, 17 Apr 2024 14:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0466C2BD11;
	Wed, 17 Apr 2024 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713364459;
	bh=4dl27/OkqOSeMVE3IRLMM5/zvr+ndRE4x0HOsxzXsuE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sHMmR2bZuHDsTUjTW+bOlor67PamgHcCpdcr3ARhfrvIKRkk2iGycyvg+YjzynO8F
	 koCpRAojjJ/MvUEVJ7OwdqdfuClIMO0ActW4Riya3G70dmISwfASufgMjcFN1/BwT6
	 WZvy76qEJ7T4S9g8j1vPopT9s02p0D0FC3wjYh16jSvnTgVht/GcGcb7XmYVE3gRmr
	 rD2dTyV2dXAIG1Txbj9r4UVwzmvBCAuOOTPyFv3FSmL1SE6Lz9A3/seHBaIb6rU6WI
	 XID+s280s7qsp02JQqu7Q3K8qL2NfSqLFTGByp1FwoDtysu0hIsdwrQiusfL2T4DWR
	 4XsrzcDhnlC2Q==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: "kangyang" <quic_kangyang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] wifi: ath12k: add support to handle beacon miss for
 WCN7850
References: <20240412094447.2063-1-quic_kangyang@quicinc.com>
	<D0I2E1O0GLM5.12RQY3BJEOKVY@gmail.com>
Date: Wed, 17 Apr 2024 17:34:16 +0300
In-Reply-To: <D0I2E1O0GLM5.12RQY3BJEOKVY@gmail.com> (Nicolas Escande's message
	of "Fri, 12 Apr 2024 12:16:12 +0200")
Message-ID: <87jzkwvz13.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_073424_398925_C2776735 
X-CRM114-Status: GOOD (  11.58  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:

> On Fri Apr 12, 2024 at 11:44 AM CEST, kangyang wrote:
>
>> From: Kang Yang <quic_kangyang@quicinc.com>
>>
>> When AP goes down or too far away without indication to STA, beacon miss
>> will be detected. Then for WCN7850's firmware, it will use roam event
>> to send beacon miss to host.
>>
>> If STA doesn't handle the beacon miss, will keep the fake connection
>> and unable to roam.
>>
>> So add support for WCN7850 to trigger disconnection from AP when
>> receiving this event from firmware.
>>
>> It has to be noted that beacon miss event notification for QCN9274
>> to be handled in a separate patch as it uses STA kickout WMI event
>> to notify beacon miss and the current STA kickout event is processed
>> as low_ack.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

[...]

> LGTM, you can have my reviewed by if needed.

BTW patchwork adds Reviewed-by tags automatically to the patch, so all
good there, but _please_ edit your quotes. Including the full patch on
your reply makes use of patchwork really annoying, see here:

https://patchwork.kernel.org/project/linux-wireless/patch/20240412094447.2063-1-quic_kangyang@quicinc.com/

There was a trivial conflict in mac.h, I fixed it in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6dae20769f3f600a5ad5ee98b0fec0b14cf07a2f

I haven't seen any warnings yet, so that's good.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

