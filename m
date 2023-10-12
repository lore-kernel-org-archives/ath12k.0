Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA50DCDB46E
	for <ath12k@archiver.kernel.org>; Thu, 12 Oct 2023 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9z62HRZzFygJAHpLarudCkBjx/xJZMawXKCCVUW/F10=; b=TMOSL5sebDm2Mx
	vUUQAEOb1dmC2WpCd1YB7r4SWmNndl+U+gJXYy4UYKwnVgU8vtlLxkav5y+M666hWfJro3nMoNfQJ
	yM/d5OyRPHKiittNWj0wtWy3D1O3YjMDeYUpEIVBQ2bvO33UeIr3nVRZhH06ghgdPszec+6mfmRo+
	yXQQqetxDiUnU4BHyGqHypbcVioSoGdN1K3+yYLnzHkkn1g7TCsRHEk/Huk0ndqL35oYkFNXq12vU
	kUOSVhTSxLs+r87sLOgsbSYUI7PKHiBumna2w1WmI1gDtTt1pa/yOCd4mexkXIJNIPzHyENYl5Yid
	+C34HcacT51Tf++1yMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyDU-001MTn-1w
	for ath12k@archiver.kernel.org;
	Thu, 12 Oct 2023 16:07:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyDR-001MSb-1d
	for ath12k@lists.infradead.org;
	Thu, 12 Oct 2023 16:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAEDD61E91;
	Thu, 12 Oct 2023 16:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912F4C433C7;
	Thu, 12 Oct 2023 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126832;
	bh=dlhYPohL4/FHPxTIqvDfTZt4Ty9fnbFTNIRlnAQLq+k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=b95L9ti2UPk1D7FzLoja4z3dl+fgywhvXy7DEQgk7f85NUKthMV3iz5phTOTNsTjH
	 fVBXBTeEu3od3PF3a9/1rmFs0Uya66rZ7erF0KqqB8/hyQunYa3KwN5Hinhrh35wHo
	 c9+v9pggmieOtHyT0dNaJN7fttbhLir8GrU2hHcs3OXCiHXEcfBvgLipVDoPVd6Ec8
	 FB85nZtzU07opREVWteWk9lvYCNS3P5UTW9MlzWJCI2uakff6BPczkpgbvF/EFrW0+
	 03KGz2yB+JNRjXnEz8WU3RNoCsiPn/5vfyplS6+3WNw4YXtqmCUY87U3kY7Q1gcqgO
	 GcLIeNIz8dOzQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] wifi: ath12k: configure RDDM size to MHI for
 device
 recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230721055305.20420-2-quic_wgong@quicinc.com>
References: <20230721055305.20420-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712682952.3501995.7267871240531688486.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:07:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090713_586480_38D965CA 
X-CRM114-Status: UNSURE (   7.81  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> RDDM is Ram Dump Debug Module which is used to debug issues when the
> firmware encounters an error. The rddm_size is needed by the firmware
> while MHI goes to the RDDM state. Provide the size to MHI subsystem so
> that the firmware restart works when the firmware crashes.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

ae3ed72020de wifi: ath12k: configure RDDM size to MHI for device recovery
92448f8718ba wifi: ath12k: add ath12k_qmi_free_resource() for recovery
c42c2b8224c4 wifi: ath12k: fix invalid m3 buffer address

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230721055305.20420-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
