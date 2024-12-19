Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F15E7718B
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2c3SmxdjVawFsa/0tHEU3zr0qjBqmdfkDen+avLGFTk=; b=H1q4f7EljmwRKXKZzHkaUNqflg
	anAyh9Mdxt+fEL/K4wL9cd3IJzTTp47pHvhGWtlreLByQlwh6j7lKNaYAp1FpPfoa9FrpmfIFNkZT
	0DnDbozouFVqTujHgso1I3yYmvX0GOCiAcVkwo4oTsfrpoPGxrWVvi7uPZVM4ylEiiz0zB2j56G3p
	6KT0BLH1YH+wQZJuwADrjHub7Rx++/ShXxEIvjIjVmvbPh73U39OgfrCp83SG6scgRbVhqCeV9T79
	pTIRWNLtlNon4aO1IBt1sxClJpOrUpE3XauO2UZo6fSvBVNra7QojuBcq+UU9K9Hyyjjgjsd6uNbU
	vXc2c0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEpL-00000001gRA-1ej5
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:36:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEnZ-00000001gBT-3fb9
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DB115C62B0;
	Thu, 19 Dec 2024 11:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C42C4CECE;
	Thu, 19 Dec 2024 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608073;
	bh=TiZNKQSPnucsT6sKEtG1JgreHsKZgBlc3aNLnD7FvqE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ptOe5SRBS8NkamGgAbIUteaHHo50POZT++qNawJdsGWMB75lgGx5/raiDQZUQvnD+
	 680PI/cwCpEBTDyHyeFhf637CEreM6r2HxRUAZDxg6+C75Ir7Ge5cNPsT5UEEGg5UF
	 a6SMVfkdsQ78CQ65HoieLbZRFoI2r/Lr3bxyY92IAj9SgLUhImgM6tu5X2I6lrJ3SH
	 nfr2Y9F1i9b+kZdcSewpgLUL7D2UdIlVIWBWaNmMJTWPYa9i8Y1sLj1txfPmR0bi5g
	 E1N41Dp5aIq+K8YirifaeYweT7dvEkLO9tazLQitaw/BgAywmV6smFl22PWBvDsMVQ
	 ebfFNqjvAptaw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: ath12k: Refactor Rx status TLV parsing
 procedure argument
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
	<20241219001006.1036495-4-quic_periyasa@quicinc.com>
Date: Thu, 19 Dec 2024 13:34:30 +0200
In-Reply-To: <20241219001006.1036495-4-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 19 Dec 2024 05:40:06 +0530")
Message-ID: <87seqjj48p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033433_951264_B2F0E627 
X-CRM114-Status: UNSURE (   7.94  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, ath12k_dp_mon_rx_parse_status_tlv() takes the TLV tag, TLV data
> and TLV userid as separate arguments from the caller. These argument can
> be fetched from the TLV header itself. Therefore, pass the TLV header and
> retrieve the necessary fields from the header instead of passing them from
> the caller.

The commit message doesn't reply to "why?". Is there a clear benefit in
the future or are you just doing random code cleanup?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

