Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB87CA0EE0
	for <ath12k@archiver.kernel.org>; Wed, 13 Aug 2025 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPNNyB1CZ0TH0T6qgdc9iTbgIIifTXfh6ZmDQyp+4Ww=; b=gZq/WarAtIl02k1b/fVF4xCvjL
	pbDxzzExyvMsvxNarkm5y4y4M2Tj7sl0UdQHLhwpw8RqHhdawaxTSN2jmLfKUBzgCroMdg1Dlz8aL
	ISxUVxK4IDT1GzlNqdsLBG9Xtpk8WA54gymRZbeyiHI6/irLDEA+OtgRnAOM1RRsB86cNhlXuVzqr
	UdxYpk1oBRXyggK2+DaRadc46TEXxxsib7PYF3EqywKSrvAxHirn8Qix/lkfcgvG1R70JH5Ex3EW/
	DEi/s2Fn5iLFw/z2jqOelHmz3xP+VUABqQiqXJRL2UAgt4w93NG5+WQK8SoMW9QbWqlF0dFDT2jgh
	waA537bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umG1H-0000000EhVe-3GLk;
	Wed, 13 Aug 2025 18:16:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEGp-0000000ENS1-0uQa
	for ath12k@lists.infradead.org;
	Wed, 13 Aug 2025 16:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8398A601E5;
	Wed, 13 Aug 2025 16:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44F7C4CEEB;
	Wed, 13 Aug 2025 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755102250;
	bh=MD6WCoZ1Gvdd/oqFMCSNaXJwQnNQWyh9pTH4uMikq4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3wwanf4AX/iQGKyvzmChuM4YdocLBNai8yUKtWBl3/ToeiaqcC7dU7BpKtA3MoEM
	 nTg6QJXZlhLDLKwi66ATCju6tmVBsRxQ4iyXUDPKconv/DZURUY4cd6ZIcHVNqaR/f
	 34wQIlz0H3NRED+IZsq6bEUHe+dpHDFkTZlyqqbs=
Date: Wed, 13 Aug 2025 18:24:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Kiran Venkatappa <quic_kiranv@quicinc.com>,
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath12k-ng 03/13] wifi: ath12k: Move Wi-Fi 7 WMI
 configuration to dedicated file
Message-ID: <2025081320-coastal-graded-40a2@gregkh>
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
 <20250812-ath12k-mod-v1-3-8c9b0eb9335d@quicinc.com>
 <00a72188-8ac7-4527-8128-352d0882754f@kernel.org>
 <b62af6d9-eea1-41d0-997d-b9585f2a9533@oss.qualcomm.com>
 <f6b046b0-d230-41e6-ab18-686cc7b65f16@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b046b0-d230-41e6-ab18-686cc7b65f16@kernel.org>
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

On Wed, Aug 13, 2025 at 06:00:44PM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2025 17:43, Jeff Johnson wrote:
> > On 8/12/2025 10:52 PM, Krzysztof Kozlowski wrote:
> >> On 12/08/2025 19:09, Kiran Venkatappa wrote:
> >>> +}
> >>> diff --git a/drivers/net/wireless/ath/ath12k/wmi_wifi7.h b/drivers/net/wireless/ath/ath12k/wmi_wifi7.h
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..1514e3e8d4cb65d3d95d95a1c1593a7b66abcf58
> >>> --- /dev/null
> >>> +++ b/drivers/net/wireless/ath/ath12k/wmi_wifi7.h
> >>> @@ -0,0 +1,15 @@
> >>> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> >>> +/*
> >>> + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>
> >> Don't rewrite the copyrights. Original file had different one. GPL FAQ
> >> also EXPLICITLY asks for date in copyrights and does not allow one
> >> without the date.
> >>
> >> (and before you bring internal qcom regulations, let me remind that they
> >> do not matter. we discussed this in other thread)
> > 
> > Wi-Fi team wasn't party to the other thread, and this series was following the
> > legal guidance we were given. I'm circling with the core kernel team and the
> > legal team to make sure your concerns are resolved.
> 
> +Cc Greg,

Oops, I just responded to this issue elsewhere.

> Please follow legal guidance expressed in:
> https://www.gnu.org/licenses/gpl-howto.en.html#copyright-notice
> 
> and the license you agreed by signing of the patch:
> LICENSES/preferred/GPL-2.0:
> 
> "Copyright (C) <year>  <name of author> "
> ...
> "... publish on each copy an appropriate
> copyright notice and disclaimer of warranty;"

Nope, we do NOT force the FSF's legal intrepretation of copyright marks
on any company at all.  It's up to the copyright holders themselves for
how they wish to mark the copyright, if at all.

And really, Qualcomm is a company that is run by lawyers, they know what
they want to do for whatever reason that might be...

> Just to remind - you as author sign off your patch, not your legal team.

Agreed, but in some cases, I have forced legal teams to sign off on
patches, so don't rule that out :)

thanks,

greg k-h

