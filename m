Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F5C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c7OhdgF4ZNKuujSLaCHc/QIsBkjB8zJBqFHQV947Eo=; b=c8DzdQ/6XVZptZuwSAbA1G0EqL
	7+nmNDE5CtQatzqXh2A7ucpGH/GtX6+XfQgwKt6r39gWHVXHzw2BCQeYt6pOxEOsxMKhWOWoxyfiR
	4hxHXvnYUxI+n2k+QHukTYm6OYxIQYNVdyhFb7P/TcvoZNzf6JXWdSLuKQPLVibi/rPM8pvcQ3LK2
	hU6h2OVXQ7Zv+AtfGtdev8X3jwZX219T39u4qXNTnDfLLo8xuA2ppJQGSXU80A0kywbCnZGmKrGEE
	DSu2omJCTkmeztc5wjQq7los//bH7GII4cgwEajBDHI59rXJoeuwSod1/6BHHz1/pPqAgBClRRvfR
	cB1quCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hvf-0000000AVPv-1pPq
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 10:20:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hvc-0000000AVPO-0Bhl
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 10:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 471ABCE1255;
	Tue,  7 May 2024 10:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869AEC2BBFC;
	Tue,  7 May 2024 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715077205;
	bh=iQRTFLh2yI2uc1laUSTR2ZMOPd4Eqg8Na+Csb1Ap2+A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GD/MYg66nTbSgZnYUjKWzCYZzx4JpGyqnr8PcEGAkAHNsIyvcts1ipaTpC+Jj/tRB
	 QLmIFmVX8gANfr6jkdTAxpIdOVpd4DbWpCmt2lzX8qsEPI5jUhPho1WBGy39wRlyUU
	 DJNV4gYkgeVST7Y2lG6ZE3Mfw1Twex4cZ4/6aydYLcdkN2JfZ6CgrH/iR14WethOvX
	 havSefyGcy3t6jhYsq5xSuObQEej6DEktk/QaakrrirdStyDCtPrXEbF8sSPGEV7bV
	 c+Wi4Yg6eDgfzNtzr7iDZ2SptmYI1ALs9nFFTcQyz0PLrFeIL3M0jg1psrL7fQIEB4
	 39vAwMs0kOaMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/5] wifi: ath12k: remove redundant peer delete
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240429081525.983-5-quic_kangyang@quicinc.com>
References: <20240429081525.983-5-quic_kangyang@quicinc.com>
To: kangyang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171507720282.3827098.15356808712274335251.kvalo@kernel.org>
Date: Tue,  7 May 2024 10:20:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_032008_454171_DBBDDC10 
X-CRM114-Status: UNSURE (   5.75  )
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

kangyang <quic_kangyang@quicinc.com> wrote:

> Firmware will create internal peer for monitor mode. For host no need to
> do peer create and peer delete.
> 
> So remove related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

What about QCN9274? The commit message doesn't mention that at all. Is it safe
to assume that QCN9274 firmware acts the same?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240429081525.983-5-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


