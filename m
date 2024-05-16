Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40004C25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk8e1rFLBBPFCu2RM76H/gUJ13yDq/f7YbdhMUutVdg=; b=1OU7OsHON79PpgfWVcmb4D2SLE
	meomWjsHx6WZNCXT7lHhMTm92BlcgPKvacO5BWJ9TRplBBrq+DSD5f/O0dpvDHtom+J4QG3HlgyPO
	TOeXaO1KhaaqppDzbO7IfjqQt0nuqvWmCv0cVR85hjiuMW4+51HTLIdEPxnyqy+CLtt1laG455uLx
	RQpYI56lbA5pMcIbZVdqK7Zbrww3dWNbs5hk4JeCwvbsDlbNB1lj9sEDE65hvuzdOFtYfHRtYNCVj
	BMYzb9EJnDSoyTQw+dj0x+J6aWojDpE6LKjTCYMfWcUFwu1jPEERm78FiR09LhuqmTXlUCgm8XO4u
	gTMMP6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dUw-00000005Qjh-3X0P
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 15:58:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dUt-00000005Qhx-2C9K
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 15:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2761F61485;
	Thu, 16 May 2024 15:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3112C113CC;
	Thu, 16 May 2024 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715875101;
	bh=GUMoHHGD/pkVQb1m1BnMKO5q1xGRoSbjWCggGFScV3Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mjj9vNuVe1DHj55zBEKyPFmt8OOjJLarq+TF/4S+9fVggt20W1PXv3sA5Lgvz73lS
	 lwyvWJDs3mjs60t0guUSakrHT09jgsQlQceMgN7nuAhhWsLWveortlcH/e3taGsj6W
	 Aj0PdVazSJ2/7SsTqZRTXCPaFldxgQTS1Z+52PCsgg++9HydMiD4+qMJ5sBh3MeZsH
	 V5/id2u/dDswLViFlF3vLAGFz8HXJCTuanPKM8txUbCxMge3JTuk2Bplyy/NXKC0j1
	 KZ7PnY039+1KR7Szyd8oZGOlCrldEzdzL7+K1zoFVDuaEzxVO+uJQVH+ybsCMEQIEH
	 dnvHghB6jNYbQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Lingbo Kong <quic_lingbok@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix the issue that calculation of ack
 signal strength
References: <20240511030917.65811-1-quic_lingbok@quicinc.com>
	<41dd47b4-a1cc-48f5-a91a-1d64150d8c98@quicinc.com>
Date: Thu, 16 May 2024 18:58:18 +0300
In-Reply-To: <41dd47b4-a1cc-48f5-a91a-1d64150d8c98@quicinc.com> (Jeff
	Johnson's message of "Mon, 13 May 2024 17:01:48 -0700")
Message-ID: <87jzjthhph.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_085823_634914_1081234F 
X-CRM114-Status: GOOD (  10.41  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/10/2024 8:09 PM, Lingbo Kong wrote:
>
> Your subject doesn't quite make sense.
>
> Perhaps something like: fix ack signal strength calculation
>
>> Currently, the calculation of ack signal strength is incorrect.
>> 
>> This is because before calculating the ack signal strength, ath12k need
>> to determine whether the hardware and firmware support db2dbm, if the
>
> please split this run-on sentence, s/, if/. If/
>
>> hardware and firmware support db2dbm, do not need to add noise floor,
>> otherwise, need to add noise floor.
>> 
>> Besides, the value of ack_rssi passed by firmware to ath12k should be a
>> signed number, so change its type to s8.
>> 
>> This patch affects QCN9274 and WCN7850 because they have the same issue.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>
> Code LGTM & Kalle can fix my comments in pending so don't respin unless there
> are additional comments.

Fixed Jeff's comments. I also removed both db2dbm variables, I felt that
they were not necessary. Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c7b6d4df1ac8427ac758f35b7c1aa641fa8df75f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

