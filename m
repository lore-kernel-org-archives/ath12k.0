Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F11C48291
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J36FDKkTwwH1zgyIYNp37sB7pVjQQSOEZjvh+EttvmM=; b=svXHHNse2PR4b2EYY9cj2jwM54
	QPr2gErsLYa2Dv8Amf9v17D1L2NKFFrzgpfWsNaWKOnmE/ec8TN5pX83l1ZzT2WQF0o5HFShASdYg
	I4hV0dG7ZJP3czULgtSnPGzG3DnAzE9dmPLELcxILkzb3r7w6Y1rt/aQnyrz5+ceo3V0gyWn03gj7
	uxwBtezACF1XAlcOXW7mLIqfRwCQcr7yRkcbmz963t8Hd6Dmdx2cHHT+3QqmYOF/8F1252v3gncIf
	Tbo+pIAfdNcPIScpUSch1XOkDhuGOHglxXpJbEa+r/CFdD7pcA41o8nVDSyJ1Dk9/1SI+UiHMReSO
	JCnmtB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVtwv-0000000Bf87-0ehJ
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 13:51:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVtws-0000000Bf6x-2mnD
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 13:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0896062254;
	Fri,  2 Feb 2024 13:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C09C433F1;
	Fri,  2 Feb 2024 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706881877;
	bh=2u/xsY1L2si0J2WGbemdiniFW2LPrp7tHa/x+5LzCkQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=j1uldy5EIqxh4o46Mou0yx/SeNrZaUungBmwNQKQa+sRRm/H+O14Cze3NQALUoSY0
	 FXprzXPBbTIr3dbrRgJoJ6mN5o1S9NkkVQhni3KltCcdSb15jeCFbD3YDsRG6E0Gbp
	 abgcyDpaG3HO+QaCeSXn99tV97c5dCOSCiRuizUlg4UmDaLJivV9k1tZ5C977KXAzH
	 7VYKWE5gmk1E54IL/g4ama3BfMqIbibQN/AKnk8xY0xqu8Lwb2Ib+LwQ/+r1/952If
	 U4qRKEsXtm2hY50M0JsjgQUfnkigk7HmFa264O/PEUC+Vx1AhYFfeFFtWpqSr9rTXt
	 dS4gECAAkRM/A==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: enable 802.11 power save mode in station
 mode
References: <20240201035830.2534-1-quic_bqiang@quicinc.com>
Date: Fri, 02 Feb 2024 15:51:15 +0200
In-Reply-To: <20240201035830.2534-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Thu, 1 Feb 2024 11:58:30 +0800")
Message-ID: <875xz7t1nw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_055118_774944_16ED2640 
X-CRM114-Status: GOOD (  10.02  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> To reduce power consumption enable 802.11 power save mode in
> station mode. This allows both radio and CPU to sleep more.
>
> Only enable the mode on WCN7850, other chips don't support it
> for now.
>
> To test that power save mode is running, run below command and
> check there is no NULL Data frame seen by a sniffer:
>         iw dev <inf> set power_save off
>
> And run below command, then check there is a NULL Data frame
> in sniffer:
>         iw dev <inf> set power_save on
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

This had simple conflicts in hw_params, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f776fd9ccb6561c4e4fdf05552a8b57a06686a90

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

