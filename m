Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2FEE7B61F
	for <ath12k@archiver.kernel.org>; Thu,  5 Oct 2023 06:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPvLTZiq2u++bDwx2Pv7UMTN4DV0or3M06Q1H6eICMM=; b=IBQNRDDGk1PZK/
	C3oxttVqWg93K42HahBnpsr/EIjD51QC7029utvp2Jt2TOFvJu1D9yOuMTL8T2d0yMCnhbItagOw/
	VzlTykNSuwHbN870Zm9cZGKVcFP7sBqd95S0ttqmsZFi5k0ojll+5Hk1T92St/qAQL96aAkW99mhQ
	XHnb4oj00BiBhkAnLwnM7N40IzOSLslTANt35PorSwjAHu3uIoC51m2lC6XPfzbRXaIpmmevOr9o3
	jaHl0lUWfGy2MEOSj1uxlXjrLNtJWjMO2I70svhmV/5oFAwGisb9iH3/RMhJ0SMYewpZWdIsj0scO
	4lJ4Cic7zFSt/YOVUsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHme-001W39-0V
	for ath12k@archiver.kernel.org;
	Thu, 05 Oct 2023 06:24:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHmb-001W2D-1s
	for ath12k@lists.infradead.org;
	Thu, 05 Oct 2023 06:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB8A7CE1DDD
	for <ath12k@lists.infradead.org>; Thu,  5 Oct 2023 06:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE5EC433AB;
	Thu,  5 Oct 2023 06:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696487063;
	bh=yzON0/8AzdJNaPS9HT17ZwhuFj1fWIAt4MvZ47s8buw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=sItvzO2qI36HAyZ/ml0DUgZDqxB5P3WoYpvmYVF+TQnoVwtaSniu/fBPEf9YcLgIj
	 MlWtQN8y8m+uYlZHGrUS9W9CyqM9AeK7w08w0Gp00LFo1VlP+ySoBPQ0Kv4r29mcgH
	 VkLZTHPOupRFiTRGT/dCBJSSSJ7uAoKbeJV6Q1kcEQjpQqzGcifyIBtUuw6r1MNAf6
	 C7BuxsZb/0QQ8ERyuAthmu/jNrGJm9TlyfVVI2AdIiUL0e2rXzi59y6B/dwja0TREY
	 srC6MwJKnXLoEDu6nSQy8xD8f0Bj8mhVmI7RyS2007V1shs8BTs9ZBki8EfWr9motz
	 9kZGFmbTWN5ag==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix debug messages
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231003150132.187875-1-kvalo@kernel.org>
References: <20231003150132.187875-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169648706024.444191.15030535746469071290.kvalo@kernel.org>
Date: Thu,  5 Oct 2023 06:24:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_232425_800875_78C3CD01 
X-CRM114-Status: UNSURE (   9.90  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> In ath12k the debug messages were broken, no matter setting what value to the
> debug_mask module parameter would not get the debug messages printed. The issue
> is that __ath12k_dbg() uses dev_dbg() to print the debug messages which requires either enabling
> CONFIG_DYNAMIC_DEBUG or DEBUG symbol in the driver.
> 
> ath12k is supposed to use debug_mask module to control whether debug messages
> are printed or not. Using both CONFIG_DYNAMIC_DEBUG and debug_mask parameter
> does not make any sense so switch to using dev_printk(), just like ath11k does.
> Now it's enough just to debug_mask module parameter to get the debug messages.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

453a62a3ee65 wifi: ath12k: fix debug messages

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231003150132.187875-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
