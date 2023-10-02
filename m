Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB5E743C3
	for <ath12k@archiver.kernel.org>; Mon,  2 Oct 2023 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0mUgqmlkh+jYr1AXCdk3YCncTYUdLqAOKDJ7lUIOYY=; b=wiLMAB8udUCTk+
	xzAi1lTJpCJeSkK7W6XV/wrMwK6kwVwZTYUySLSYBr9HLcHPVd/xoDohtprQxLr2FaackpsDTf7s4
	DwrIoxmviMQwz9zZ4hSID3+N8t3VFncNdQqsY23ZhRXytlcMHLJJFcgBCywD9oYgTiyhga6SVz2Ow
	VMki9vc1zU3PFLRxNAurAqt6H1Py1De/L7H9IHRMR3mZzwJyd0J/hqYLrKvONFZdw0YdODloSYAjt
	dtcb4Lfb5C2sOavtkULdw0QetqgkxCG9lFoDDVQ5FQcbANo9q7PyX+FtWfaBR8YTUTLZrSRGZYjY0
	1a6fPhGoSWpCbZwy9V8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLYg-00D3MS-1t
	for ath12k@archiver.kernel.org;
	Mon, 02 Oct 2023 16:14:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLYd-00D3Ka-04
	for ath12k@lists.infradead.org;
	Mon, 02 Oct 2023 16:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F92060F6D;
	Mon,  2 Oct 2023 16:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F6C433C8;
	Mon,  2 Oct 2023 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696263246;
	bh=MYOcq/f37Tq8zr3wS1nmV9Ey9mP0nvdOGbnwCPOj3us=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GNwgRm0r7jmfum3leufEBafPwyYNDz167/l+uHgvFczF8zshQbHEOQm1FyhqWRf6m
	 WUvowLKez2k1F1+lHdeoXMhnKgEVqUom0C/n8MfiycQAddXzDSXYQSck8Rppus6bf5
	 bWukMlKW6CYr0T7er60YH4Che0fs9raCQWuc68wSTT+NNoWNS0UGu4C8bUalsypQOu
	 ntrWAdz9E9AAkpVZ7JQHZYoQPYYefVW13wjeIgIPIe0DvfaN6Q8Xyr7jj6luR8REmV
	 18GFscmhjmYWJjOYcg/p16H9OUsI135ih7M0YuYKWMiwZYY6ZOjTwOs1GdbEvY56tN
	 p7fd18a14EIyw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: add read variant from SMBIOS for download
 board
 data
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230905105637.10230-1-quic_wgong@quicinc.com>
References: <20230905105637.10230-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626324327.3936351.13611584406343769411.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:14:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_091407_104616_611B50B6 
X-CRM114-Status: UNSURE (   6.10  )
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

> This is to read variant from SMBIOS such as read from DT, the variant
> string will be used to one part of string which used to search board
> data from board-2.bin.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7d9832e3b538 wifi: ath12k: add read variant from SMBIOS for download board data

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230905105637.10230-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
