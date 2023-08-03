Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B89C001DF
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhzvr4SDGk8rILQNTpC5RVkFQ7tFdmspt8ZfyK6jk0M=; b=RV/Zd7a3+9L6hg
	dtdmQW1+/fbAaqOp5kGIF86EtY5JeFFhpQgU32My4M6N20KWCs5gs3tDQBeFGZayLrqPlv63ZGVdY
	Z53+KGTr0tKR64fij6c4Zh3/2y2RyeGhozsoJ0e7TU/ebrwxnGxWkNXi1PpIk0sqzAPZjF6OrJQuc
	AnC5+293fr7Lfu25DwZn8z4rsFUdNz9q/MAx/eiQ59HdGdCPt6g0goEsQDOqsQFuW9b8H9Ap0wRl+
	bUDwv1+8JbonbBqqypmz1frA4+sjZnZBNXEPkFHmggl+DmDeEbqafMAhhExnVAhXFo+jPqRXsnFn6
	PcLnuuVYTswGVUtvK6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUUW-007Acx-0i
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 09:19:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUUT-007AbT-0d
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 09:19:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FCD161CE8;
	Thu,  3 Aug 2023 09:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3338C433C8;
	Thu,  3 Aug 2023 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691054367;
	bh=BBs5xDVfPy4kBjsyiU8qNidPHEPfQ9H3VspFwt1rOwU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LeDu4EEf7QWGBLBKVnIPQRxmIRezvKQOCpHvmRKaNiTW/VOOKhu7MB9ke1nLBfyZ5
	 Bz4/EBK8cmDIpc8FPqbdteBtiKjKqj5kgh+UnDsuM5uIjSKCBS7hE54cXEG1BYK1gO
	 PFlVI6IQPnIWTjD/Sp9S0JYm6FZ8ZQy0xwDVf3qFvjkazRsjWd/wVhcmiANc1vvqTc
	 0Q8EsQGJAG7IFtOTjqChq2JMUFVJNpGFnW3/K6eKkRQQ/Bhpmyo/AcqIeoSf1JRwnu
	 4UvyZNWPlfOlcCEMmR/AnckhGYwYW558+3ksvzaPTuP/1MZEHc9GNBT8suSNH/kxLo
	 5PS8T6UlYI7Hw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: add handler for scan event
 WMI_SCAN_EVENT_DEQUEUED
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230717034457.22162-1-quic_wgong@quicinc.com>
References: <20230717034457.22162-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169105436499.894438.10408926666024994853.kvalo@kernel.org>
Date: Thu,  3 Aug 2023 09:19:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_021929_303898_CE2134FD 
X-CRM114-Status: GOOD (  13.27  )
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

> When wlan interface is up, and 11d scan is sent to the firmware, then
> firmware needs to spend couple of seconds to complete the 11d scan. If
> normal scan from user space arrives to ath12k at this moment, then the
> normal scan request is also sent to the firmware, but the scan started
> event will be reported to ath12k until the 11d scan complete. When timed
> out for the scan started in ath12k, ath12k stops the normal scan and the
> firmware reports WMI_SCAN_EVENT_DEQUEUED to ath12k for the normal scan.
> ath12k has no handler for the event and then timed out for the scan
> completed in ath12k_scan_stop(), and ath12k prints the following error
> message.
> 
> [ 1491.604750] ath12k_pci 0000:02:00.0: failed to receive scan abort comple: timed out
> [ 1491.604756] ath12k_pci 0000:02:00.0: failed to stop scan: -110
> [ 1491.604758] ath12k_pci 0000:02:00.0: failed to start hw scan: -110
> 
> Add a handler for WMI_SCAN_EVENT_DEQUEUED and then complete the scan to
> get rid of the above error message.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9632ea57be65 wifi: ath12k: add handler for scan event WMI_SCAN_EVENT_DEQUEUED

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230717034457.22162-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
