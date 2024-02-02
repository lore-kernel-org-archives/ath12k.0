Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70014C4828E
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsfLzmKplsWJkmQu/aR7gd6KNTDCJhMJr4cwx6ClJnc=; b=IBlhVXplcUiKQHW65oLv/cfEvl
	1pNk5CD+9vJC7crcls3PXGW9aOdejG72rv1mLfOph0waZbMKHR6Ch/pd8o1zkKSd7oaNXw8Prf6Ge
	m6J7rZAT1F+1MHOxGn/502VZl62tBPaz2TP5a0c/QZCUi3ap2K157B/2zeyPiunl/RbGOSUXhA0o8
	oC1EE/USRMPhdXa9t5egoopW08HaHST3nZYgXnvXtV416Ed7MgSvgqINtq1HEu3SHJfvt2IW093J1
	iM4CU3Sc3RBUk/QSebPddhld8iklwth6eePCmxUejytByQ3guIYkNvNvfXG9iNEzlZPCwM9ZJxqos
	fEZdmoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsXW-0000000BSEk-0cEO
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:21:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsXT-0000000BSDP-1VlV
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 12:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 666C8622C0;
	Fri,  2 Feb 2024 12:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E476FC43390;
	Fri,  2 Feb 2024 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876458;
	bh=OaamQbuXmp+aUnngrzGO74ZKOK+42U6K3zZz1020izA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VxHw0oolisN9YC6A9fNC6A1oGfYmbnjyAfYk8qGNA3gVAxj8DLzRGL/nnXSDDjXsm
	 ea9H1J+sGgTh/Hma6p3SvCZR0mmJH7lUJ7N1KQ+8SQ1aLwaiQ2hw6sp0BwDOe9Hm4b
	 rgMdEAhUH4AgHvFqhJQoMjymgRBrvI9/gheHvQF2KTQaI/bP13rgmZw6CWycUyOeLP
	 1w8wk2gP+FaXqalH+lE42LzT1yRo1rzwRl1nxD4euKp386CnA9xaSVY5rHH8dZIVb5
	 7ajD1PwcdybzyLG0kJibiL+ktXHYzh+V3uYfAi88ISOe1OHavZe8e5QymDEegjEF42
	 h2u/F4zmlpXjw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  P
 Praneesh <quic_ppranees@quicinc.com>
Subject: Re: [PATCH v3 05/13] wifi: ath12k: Add logic to write QRTR node id
 to scratch
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
	<20240129065724.2310207-6-quic_rajkbhag@quicinc.com>
	<b7a6ad2c-7f28-4758-921e-f77b56b5190e@quicinc.com>
Date: Fri, 02 Feb 2024 14:20:54 +0200
In-Reply-To: <b7a6ad2c-7f28-4758-921e-f77b56b5190e@quicinc.com> (Jeff
	Johnson's message of "Wed, 31 Jan 2024 13:06:28 -0800")
Message-ID: <87il37t5uh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_042059_468249_1CDC4798 
X-CRM114-Status: GOOD (  10.10  )
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

> On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
>> From: P Praneesh <quic_ppranees@quicinc.com>
>> 
>> Currently only one MHI device is registered successfully on platform
>> having two or more identical MHI devices. This is beacuse QMI service
>> runs with identical QRTR node ID. And, qrtr-lookup cannot register
>> more than one QMI service with identical node ID.
>> 
>> Hence, generate a unique QRTR instance ID from PCIe domain number and
>> bus number. QMI allows node id to be written on scratch register.
>> Add logic to write QRTR node id to the register. It is available for
>> firmware to uniquely identify an instance.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Depends-On: wifi: ath12k: add firmware-2.bin support
>
> I would not expect this information to be part of the final commit text,
> but I suspect Kalle can remove it when it goes into the pending branch

Yes, I removed Depends-On. In the future, please add it to the cover
letter or, if there's no cover letter, after "---" line.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

