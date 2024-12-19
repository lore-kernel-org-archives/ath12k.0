Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C721E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 18:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuTHy6Sga4Nj+SqcfoQb6r7UdN5mHrh19anYGF8A0Z8=; b=ov6GXqAgqjTwl2J6uoSE7F7+Xv
	drltrqTQwwZSPbYWnfu8zimOe3HPMmNY3q0Ecskt70KvhcQ0LEuA0f57r5bIF9k0/aI5na3xGxgh3
	hLzjlGTrtSGt1dUrpX6C2RKnMYNwjl7MndXBnt4Pp+BI1Ds8tzdZ97ZEjjONwpBp8roekQ3ID99sC
	hL7K4GoiCN9LV24Ghmo2GGDnHHY1krU2F/2UinYfrorFZ/2JDFH43//sMPjdNn50M6/xi0bclUl1x
	QkzvEkm8uXLWRDF8MgUuUzIwjM7YmfsxvrloRGtHoSKAs8Bcova3jHB37KUdHktugh110HQTJ21LF
	aHXoHrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLfZ-00000002mY7-0ftJ
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 18:54:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLfW-00000002mXn-20Le
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 18:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F70C5C6152;
	Thu, 19 Dec 2024 18:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D22C4CECE;
	Thu, 19 Dec 2024 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634481;
	bh=a/HOUFNOSb5LHyaR/JPllJIMj9GNdpkNSE399+J4acQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mfkOWAqWdlfkrdttXu+fDVHZUc0fmZWey9TsYPyGAYLVjK9JQOc6BWGgr2iM/OtIs
	 Ceyw/zPGwEYS92l7+zL4OIfx/nshX2axMPUOlrHwjbeAUGGayfCw+JzeispuAgdMws
	 A8IyS5qDIBmsMs0cd+fcUKGQR/KJrArNURdyd1FrrKBftnBMeVXMc8c8mbVHM1Is4+
	 /r0CGvJgzvZvK3qODy7XHAt5sNbhf5CHZzAo6hGs7lA9QpRbZwK9/kasvZEAMsMV/S
	 A2ln8UWiMxjyIHa+iOp3pe3GWZVMI1sJJOTlOyH6l7q8rQpOyqaUBfWx+cmKja6Xmi
	 uHAoU3zmq0niw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: ath12k: Refactor Rx status TLV parsing
 procedure argument
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
	<20241219001006.1036495-4-quic_periyasa@quicinc.com>
	<87seqjj48p.fsf@kernel.org>
	<44bfd319-caf2-7459-f62e-0f61de452a84@quicinc.com>
Date: Thu, 19 Dec 2024 20:54:38 +0200
In-Reply-To: <44bfd319-caf2-7459-f62e-0f61de452a84@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 19 Dec 2024 17:12:26 +0530")
Message-ID: <87wmfvfqq9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_105442_562740_9BC8FFA5 
X-CRM114-Status: GOOD (  10.03  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> On 12/19/2024 5:04 PM, Kalle Valo wrote:
>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>> 
>>> Currently, ath12k_dp_mon_rx_parse_status_tlv() takes the TLV tag, TLV data
>>> and TLV userid as separate arguments from the caller. These argument can
>>> be fetched from the TLV header itself. Therefore, pass the TLV header and
>>> retrieve the necessary fields from the header instead of passing them from
>>> the caller.
>> The commit message doesn't reply to "why?". Is there a clear benefit
>> in
>> the future or are you just doing random code cleanup?
>> 
>
> It benefit in the future for supporting EHT monitor functionality.

How does it help exactly? Having even just one sentence explaining the
motivation in the commit message would help a lot. Otherwise these just
look random changes.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

