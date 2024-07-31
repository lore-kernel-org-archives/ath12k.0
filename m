Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F71C3DA7F
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umLAQk7qYpEqcwV1hOOVYw0kMGjAkVVPARKMbpMlbNU=; b=1LwsHJHwpPBQGvZJKvUPuGDjPz
	yIibkZ4wmFUizEE2aH0cyl+T42sc4CRmC1lzXLVG0u8nt+iShlbT7GdlUlehvwViY5EK7t/eM6RW/
	tCVNVnJtZP7oEvyUUTvEwrcTSLupLIoSSvrnD3HdB5UuZMVjWDAUmeIczep287iIQrNC9tF49nItX
	WmdZoOdKXaS+S5qFZiwLRnIB4k652lauiA2UpDgaILwVqsucD+pGK76tViAksdaEsBwDMHzpUfN41
	tZRXgEVSoZmRRlZMEqu8g1vfU8Br54KmNVOVw5BSGkU1WPwq5Jvwcobw/aiciTrqia3vwaqfO+Zx8
	ObaiwfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7Mq-00000000sXv-3vzG
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 11:19:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7Mo-00000000sWk-2IEX
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 11:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AF7762353;
	Wed, 31 Jul 2024 11:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B9DC4AF53;
	Wed, 31 Jul 2024 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722424777;
	bh=onrtjqff1hh2cQljKWEadBWXOvbJbehuEl0q2QesV9w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iO+2jLwx6YlwOfkeP8Rt4jKROpna2x/x5EKTHTJZVmjm/As+u240SqA0DEGZC+HdF
	 ctYY4QBXomhLFoqXKyfHjXkGn2SiRXMh8Twc9N9FNdODkp0J38O/j5/qEjL1r7vmvd
	 rxxZGA236YJHuCXM77hhVDo0b4iCURHsvmOSWC6s17oP+Vc7kB3D5hC6UIqOc+DFW7
	 2GeUn4nZe0jmLp06jh5zTOQaVH1BQyv6Phr2yR4nhTaAjvRXGWX9oD6oLfwcVWhhLG
	 p5uKbeq+XbY8OSN9vTtxUhivqPr2tPUlWBWdl7alt6CvoyblIejR7DBdcn+bI4yN+K
	 kNxYGd7qrSKeQ==
From: Kalle Valo <kvalo@kernel.org>
To: kangyang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 00/11] wifi: ath12k: some fixes and clean up for monitor
 mode
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
Date: Wed, 31 Jul 2024 14:19:35 +0300
In-Reply-To: <20240725120035.493-1-quic_kangyang@quicinc.com> (kangyang's
	message of "Thu, 25 Jul 2024 20:00:24 +0800")
Message-ID: <87ttg5kdvc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_041938_645249_1164EA60 
X-CRM114-Status: UNSURE (   6.97  )
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

kangyang <quic_kangyang@quicinc.com> writes:

> From: Kang Yang <quic_kangyang@quicinc.com>
>
> This patch set does some fixes and clean up for monitor mode.

Please fix your SMTP From header, it's currently:

kangyang <quic_kangyang@quicinc.com>

It should be:

Kang Yang <quic_kangyang@quicinc.com>

When you fix that git won't include the extra From header to the mail body.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

