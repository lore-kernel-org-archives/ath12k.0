Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69763C47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsaWpzXnfsxXHeSEpTpMhXRgt93r56Mlnuj+SExSDgI=; b=TpY9hLZuC7SnDl0GDjvD4EbkQF
	M9qgxYu9teesAYo7H8MZRU7eL3iVmw7Zx3xgfK+M9jNREJwkOnOJzccT+B7pIATbdN7hfAbGb0Uwd
	lyKjYGKJCB4lUyQLo3LhBiNHFnfI67iPdiOr3hfsGOj65XFS5WpE4GeBQWNb7fOtsCS+6qws6z5Sy
	1n9JPgGF0iYp1PyriDOYwMbOfMqxLTxOVwONTkL76496x5buxkEpexf+zSlqOd2cR8e3p6lh5X4/z
	vpo7XGoPExMKw1KywbcLl5MisnJrUqz4kd9dftw0KagM2S7/bbMB0x1mKzTvWzdnwxizr5sPJjJfk
	PsM/5TbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVtyq-0000000BfIB-05M6
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 13:53:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVtym-0000000BfHi-2eL3
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 13:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 216AC625F8;
	Fri,  2 Feb 2024 13:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B685C433F1;
	Fri,  2 Feb 2024 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706881995;
	bh=ffgf4Mx5xFtwuyyn3Ymye60l8jdlFrne+PEhj/bjap0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sk2G8BhvELvB4IpzTMDTBmJBlujNFQEKUjuuCYnIIomRGq+YPd+EbqCkxMvbTAGLr
	 y+wxDQou/5LMGELzJ/cg6mBfBz36GE0vStuGkREHhQ+npqaau1PlxUtz0ZDePKmrNC
	 070T0SvaJa2nMwjcnarMaOk3I8bfPDAx2ihOKCTwsPoZxC8ljJr7eTBNyqJ3/bqAOE
	 yhCj5MC/grACmLhE2y0R7Fmbd/odQN9XNoSA+I2Vhs5ltenWIMNCgJJLuTb1RU4qF6
	 omkG87PetLXEBPKYhpVzabGRrMslKlu9avGw/ashUVeU7C8o85S5wpT6gGscbYQKKM
	 ezb4wMa2imuDA==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 05/11] wifi: ath12k: implement handling of P2P NoA event
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-6-quic_kangyang@quicinc.com>
Date: Fri, 02 Feb 2024 15:53:13 +0200
In-Reply-To: <20240130040303.370590-6-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Tue, 30 Jan 2024 12:02:57 +0800")
Message-ID: <871q9vt1km.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_055316_740001_9AD700ED 
X-CRM114-Status: GOOD (  11.12  )
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

> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
> signal its absence due to power save timing, concurrent operation, or
> off-channel scanning. It is also used in the P2P Presence Request-Response
> mechanism.
>
> The NoA attribute shall be present in the P2P IE in the beacon frames
> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
> or when the CTWindow is non-zero.
>
> So add support to update P2P information after P2P GO is up through
> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
>
> Create p2p.c and p2p.h for P2P related functions and definitions.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

This patch 5 had simple conflicts in wmi.c, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cbcb45c458a93d32a48b9280c13294e0853fa5dd

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

