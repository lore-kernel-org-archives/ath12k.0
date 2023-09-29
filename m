Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C52E71D2D
	for <ath12k@archiver.kernel.org>; Fri, 29 Sep 2023 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nog0tAPc91cDYxMlMB9pLOROQC7OqRXTgZ5XEeC7rMc=; b=R4EK3KXU5mkWAZ
	khWxnvWftQEN2vIoRaKgBntTI81EIg3oIobqzScKMxC8LDFyR3dxfaDwuBur4wxNuz3MW/MfRE0Ly
	ODpkvNzxkXZ9o+606BL8kwOl2xdSoFXblny4Qmis/3jOd+/VXfALkVlBwpHO/3Ma1s1FJ6GrjSuX0
	VjMQfprzA3sY5xb1b+5DczsCqPH09mYl/NkSK5b87Ituw1yDI0kQYR4dgNUKEHctTy85D6OHl6tZd
	aibLeaGheCgu7itZwDZ7+qU1RIEOzyEc3zwYaSbzM/v9hrNFy5nR7HQwT7u884oPxa9FcQ2KfCSzw
	elYOv4XbTsGa60aA/XEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDJy-007wVS-2h
	for ath12k@archiver.kernel.org;
	Fri, 29 Sep 2023 13:14:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDJv-007wUV-2v
	for ath12k@lists.infradead.org;
	Fri, 29 Sep 2023 13:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 767C9CE2426;
	Fri, 29 Sep 2023 13:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040A2C433C7;
	Fri, 29 Sep 2023 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695993252;
	bh=O4hzLS/XuHCuydKsZZsYUqjM14D+1V27EczXw7yQidU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SpibCTxRqp2m8Lv8cYeJ5//+XeQf8rBn7jatf5XDCLrhkUOxBPaPO5uepJDbkf6Rz
	 Es3uNhrVKhCPrK87ZJHxzs1g5jerVAsd/Ei+7s9nC6t48rqTT1WPhr/OZMNQdFz1JK
	 G4s8X2uWuIA5I+1hB6A3f9wsWitGpYowYEuonfnEvhQjGjBXzUtykSkHZLBAKjtKko
	 CAzj9A6wtdtByV7u5VWAp4DOWxt6QTpGs1pYOny+C1EA0cGjYbHxOLbJBpJ3EnA/Uh
	 GqF+BYayhylPbYAFYCIGKiZghwUbq7xPuAqyaAKu03KgdTioHkmdMefhZiadpy5ycJ
	 g0ArRX2xsVf8A==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: add read variant from SMBIOS for download
 board data
References: <20230905105637.10230-1-quic_wgong@quicinc.com>
Date: Fri, 29 Sep 2023 16:14:09 +0300
In-Reply-To: <20230905105637.10230-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Tue, 5 Sep 2023 06:56:37 -0400")
Message-ID: <87pm216s0u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_061416_109213_BAED369C 
X-CRM114-Status: UNSURE (   7.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> writes:

> This is to read variant from SMBIOS such as read from DT, the variant
> string will be used to one part of string which used to search board
> data from board-2.bin.
>
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

This had a trivial conflict in core.h, fixed in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e19165609e6c2823e74ca1a1517f9213b3a540ae

No need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
