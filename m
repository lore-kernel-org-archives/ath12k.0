Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E2C54E67
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 10:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2z9usD0zNldZne9f1EOAxCyD9a1gK24adjmmbV+ekk=; b=KDotSee/5mYyZKLYqRuT0CSe+1
	Sb/jrfuhWYyjfZ1SledtdI4VJzwPe53I0T+HXtrpTbY3cD1RsLct4kmxoK6mDuxkKzv3bpjIjHl9n
	dqwh8i4zyCpF757kU08N7LLa8dEnUNfZj95zz2jOyjMUpPjY2zxcBG80zXIFR7PnjaLN4rVp8MntB
	JgUKsW3yRTJdmNHaevcCwgXmsh9wbm4WhTGqK52xJ5kLdsGuTCmdPHAlO4To/vtsxNGc0pfiQqpm9
	lHJSTDCyy6bjiWdeZJFrG7JIpnVRs2ztBFm/6ZCkWVMz4Rrp2tugWhqFw8KS9GRaogkayM9GkV1My
	8C5vejXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmstq-0000000GfMu-2CPb
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 10:10:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmstn-0000000GfL5-0cn2
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 10:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11562CE10C0;
	Wed, 20 Mar 2024 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA4C433C7;
	Wed, 20 Mar 2024 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710929416;
	bh=gLxblALNIiiN/Cb9xDExB/Z6Irzv5jocK4NDwRzzZJ4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CyM4EW+X9jSj11wlZ5U90FuFWO8Nm1tkpcuwi9NIj0L6NkIqDFt16XP6B9doxYVLh
	 HW6PXQY3bLhibCA+EiYPYnfszksKZ+a7Wd9IKPbMia/N5n3SjWscNc67jE8rsWWUma
	 /cL1fnkcagYJa63+alsRuSHlVPRInTV9uMovTD6HqOhWPt2c4qgDCd1Nml7bMVktzU
	 qbKkthXAXKAZsfor0qDbr5n2tRqszGrdNwycG8fJI2RJXqTsF2ngPm6FyMRgF0W8AG
	 SZ2cp1MGoy5Hr8OXBr+BiKdUIOdxFpr3nb9wZYe+F9u/9juAhtP7mX7UCeNYabqev9
	 qhtCZ/xnknl8A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: remove duplicate definitions in wmi.h
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240314021830.305021-1-quic_kangyang@quicinc.com>
References: <20240314021830.305021-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171092941363.3054175.16306737790680086874.kvalo@kernel.org>
Date: Wed, 20 Mar 2024 10:10:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_031019_564065_2D0FB1B3 
X-CRM114-Status: UNSURE (   4.51  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> There are some duplicate definitions in wmi.h, remove them.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

54a3d0d6684e wifi: ath12k: remove duplicate definitions in wmi.h

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240314021830.305021-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


