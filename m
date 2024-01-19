Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2ACC4725D
	for <ath12k@archiver.kernel.org>; Fri, 19 Jan 2024 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ5PYkT4RKUrwX7YB4vCY9uAiA4MuDuGqi1ElflzC5M=; b=KQcV5WYFp7cJKCWcI4ghHTegpq
	dr1x+dEn2WMb13e4qBMbioQOvAkPZtcS44fZYWvpTbRAVkaAMbVS1BxGf+Z9jHq/t6zcpTBY2FLee
	T8wuhM5DCB7bBtZojNY7ir8ctGfz8+G0COa521lQthWm3cW8ALB1hJVwB4TzH59vASWGtv8+Lv5qS
	1AlZrnVsMW3/RiDfdRmzpu4S0O0QxGMwXN46yO4h1mzwNdixG3oAEvgv0r2fneihzk4d9j2SglHMk
	EPH/hJdD8U0YPVjPwdhAua0a7wUHBIZ5a85oCSG63ged/VYCjPPGNSBhyYiwjxxV1HUulk0USshbt
	lYGE/XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsrJ-006IC5-0h
	for ath12k@archiver.kernel.org;
	Fri, 19 Jan 2024 17:40:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsrG-006IBm-0B
	for ath12k@lists.infradead.org;
	Fri, 19 Jan 2024 17:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AACC5B81C55;
	Fri, 19 Jan 2024 17:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDA4C433F1;
	Fri, 19 Jan 2024 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705686044;
	bh=9ZC5lpAq+brLDF9QYvgZJodAtrcRqMAVlasT0Wxje4g=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mPrpfTnxTa2gdl00xoW4NfwBCP1Tlq463XSwhCmZ67K+e8sSHMNYQH6lrK6xjH0qu
	 M68JN7BpA9IUghZCQ3VnSuTAdwmGq2T4CqER0ISE/SKWB3Hx+N9UqFZIcjASGBefNV
	 pc4IJnw0Ly77mAGf5bXpgNE251di6mC5P7J3XZ2HFAkzEvkX049rFWn5T1h8vkoQet
	 /xWGXT31Buaaus6NEB8doG4xwjMQOR9YmrOQwjGaAmk1z4QzehF3qvjveWulDawn5b
	 OYDNp1HhJgxxwpAHbQS2grzr8f6fDvLM6BvsGClZmHTDHdpz9kz4Rwooh4LlI7qECh
	 dcTEtLBHwb4QQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: add support for collecting firmware log
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240115023726.2866-1-quic_bqiang@quicinc.com>
References: <20240115023726.2866-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170568604129.3232677.2722276055685320027.kvalo@kernel.org>
Date: Fri, 19 Jan 2024 17:40:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_094046_266476_A683A424 
X-CRM114-Status: UNSURE (   9.28  )
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

> Currently there is no way to collect firmware log because firmware
> does not send it to host. Also host does not handle WMI_DIAG_EVENTID
> which is used by firmware to upload firmware log.
> 
> So add support for it by firstly enabling firmware log upload via a
> QMI message, and secondly processing WMI DIAG event to expose it to
> userspace via trace event.
> 
> This change applies to both WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9f9df1a2535f wifi: ath12k: add support for collecting firmware log

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240115023726.2866-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


