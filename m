Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC37C4828D
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xIplKfnmFStKN9Wbh6RYzv7jDMh124i611JVUxnKEQ=; b=VlLMnU1DXiAmw15zfA42xNo003
	Z//z12BkqprwXcrd1xbtQS1aFvy6MSY48fOfsTcJ3S21Ns78OCxj0bkXkXuc4AAE7/1OXPdrK0hYt
	pA5e6ABGyqig3xGE3csb7+Qj4sb3q9ViUFAhmaccTuqoXiR419pi4Wxcl1MBF6DrUMq5II2j3qpmJ
	WH79DDhzCC3fpsgVtxCStr2kXhFrufTst75t0Rz5UAtJdGm6RAAdDFeLgx2SYgCqRvewVN+LVc06O
	PPABFmI57KuHKacLcP53gv1iQmNrxzDpxR2+v5XGRNGMu0psLveJm9WgrHyRvA6yhXP4RJqz389en
	FUdJrCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJBz-00000007Bj2-0JBk
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 11:00:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIC4-00000006qBs-0U7C
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8755F61386;
	Tue,  6 Feb 2024 09:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF79C433C7;
	Tue,  6 Feb 2024 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707213403;
	bh=gO+v1StDHs3ZKhy95kzbKoIFkdFUG/xXc895ghfwFXM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EvUIesS2bpRau95djEH8ck3HzW4qbsmdY52hch655KTXGWyjE5sjqoL2R9bKJMblT
	 17bUEQpev5APEymKp2lBiqdfNcQRMFzs9vV8hJaWpf5t1lOqIRdSLe8C7nnM8yuaxi
	 8LzczCad+L21OiwmJTSHFGTGmQ3QK+x8fu0/rXiyZq14ftnN+v0NxYZ3IeB4oFIGIb
	 rj8+cuDG2F8rx393P6jcmj+iIHvIG9I/qKxTG6Tiks+LCNSRlkiMWu6MYc1OwDKoHA
	 WcDzOydWYVPEfd4ZH84e8LxDnxhtuj0JFBYW8j4BgwoEz7N6Im7AGhBBudHP8TJU/n
	 0E7GrOmVOpuNQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 05/11] wifi: ath12k: implement handling of P2P NoA event
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-6-quic_kangyang@quicinc.com>
	<871q9vt1km.fsf@kernel.org>
	<bc5baff6-83c9-44ec-9beb-a863045194da@quicinc.com>
Date: Tue, 06 Feb 2024 11:56:40 +0200
In-Reply-To: <bc5baff6-83c9-44ec-9beb-a863045194da@quicinc.com> (Kang Yang's
	message of "Tue, 6 Feb 2024 10:21:13 +0800")
Message-ID: <87y1bxrk4n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_015644_219404_23739478 
X-CRM114-Status: GOOD (  14.12  )
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

> On 2/2/2024 9:53 PM, Kalle Valo wrote:
>> Kang Yang <quic_kangyang@quicinc.com> writes:
>> 
>>> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
>>> signal its absence due to power save timing, concurrent operation, or
>>> off-channel scanning. It is also used in the P2P Presence Request-Response
>>> mechanism.
>>>
>>> The NoA attribute shall be present in the P2P IE in the beacon frames
>>> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
>>> or when the CTWindow is non-zero.
>>>
>>> So add support to update P2P information after P2P GO is up through
>>> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
>>>
>>> Create p2p.c and p2p.h for P2P related functions and definitions.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>> This patch 5 had simple conflicts in wmi.c, please check:
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cbcb45c458a93d32a48b9280c13294e0853fa5dd
>> 
>
> Sorry for late reply, I am in Spring Festival holiday.

No worries, enjoy the holidays!

> It seems i have conflict in adding WMI event, because you merge TWT
> patch-set before.

Correct, that's pretty normal as we have several patches in patchwork at
the same time.

> Do i need to send a new version ?

In this case no need to send a new version.

In general I usually try to fix the simple conflicts myself (like here).
If the conflicts are too difficult when I might ask for the author to
fix the conflicts and submit a new version.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

