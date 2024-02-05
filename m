Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5E4C4828D
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imZOzBL8Pte2gO7VgvRSdkTyDHlZnHgn8vEranJgPVU=; b=iHtcTNRGHy8naEaOAnYpSkub2v
	5YBRk1nTot4qZE/nhXUDkddRscerlI0BMdEgSemWgaIHOT81pb3ehzwzt81TKdeOYmhHhz1hPdUKp
	s+HAp0jEaI8OR/0m2YAft2aHEh8T3MgVDZacXYF0O2f4reQ5r66KNLJFcxWdoYmmpNZKyHtWcoY9S
	NGJSrMZY4DyB0e2/P4HTt84g6sm6t5LTTApZzQe86EFtmQfsqUPBPFbhzrJ5RuuP7pgIddRxuaHNm
	CvibOcg4RIno7IOJwVvny7Wr/gTIBsjGRC2VCWgb7ocxH7ferMC/qHEdDhHHRe/tAhpWf+MWz48Fk
	/PIO+zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2KF-000000043n3-2myx
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 17:00:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2K9-000000043kK-3Xw5
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 17:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65141CE09E9;
	Mon,  5 Feb 2024 16:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66F6C433C7;
	Mon,  5 Feb 2024 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152397;
	bh=vpH0pYsANN4c00OrUfWi+PZOVMKfI4W7qX0aL1xDh7A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ofx72CcrlNo+iL/kZxDjqIEm8GBLpHfZSms8L6d9cGihyjcKDUlbi+7bnSXb6BeMj
	 KaL3eQaA5hf2mcmZgQyMsxQKpfJGbaKIX0s8ACN12RtaDcE8Ouu8eSuMy3rm8PiiB9
	 kE191GC4pYU7b+te4lYWIhtCtU5C04qNB93LWZVYTQjyfEbZpejG7lpVV7tUjwMjmV
	 /Q9V/SlsTo6730JrBKPo+PZoGxBfaY5/Ypm97qCOVpIhHo5v/40YrqV8wP1EfxsTnx
	 I3f1xqbR4to3u4wPiF2T48AfT0c9cKPgpui2G4SbQsac60egnIcsYhm3RxDA/YjsWy
	 XLeRUoV7FdXQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: enable 802.11 power save mode in station
 mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240201035830.2534-1-quic_bqiang@quicinc.com>
References: <20240201035830.2534-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170715239486.1233901.2285678954428449426.kvalo@kernel.org>
Date: Mon,  5 Feb 2024 16:59:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_090002_154170_F061C34F 
X-CRM114-Status: UNSURE (   8.59  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

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
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

54ca3308a23c wifi: ath12k: enable 802.11 power save mode in station mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240201035830.2534-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


