Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C21ED0E6CF
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTNlr877KnHmlM0nJXagH1U3MsU9FE+C1CjlxiQ0TNc=; b=x/9+mDYVzJue2XfYVbDAdDtbNH
	I0+1iT2CaLpHh50GXBnRG2pgbgQBv7LCqXCRHk7ZL6CrgDKQkToP2c0qYZhs9soR1XyP9HGffwM3g
	oFkntPJJjM2o66fjweV5/Q65LZMZISUbvlB1aeGOSB1Axd4+iwyxjbe1cadA1kpPPR/WIJ6l2BuqM
	5zDF7M1OXBr4kdb4pqcPjJrxLY/RG1yhbrFe00/q+htLY58K3mQHXriy7GZWseAkfN8RYNa8LLT2g
	w4Z49S2w63phIurbym22n4d2m3iE7NPfuad+5cMWAc1D0OIL2AIRX9kGF2KQDDI1MVORerHlPQ2s8
	Qsjd1RhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o5D-00000006c33-0iUZ
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 08:48:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o52-00000006c14-1KrW
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 08:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E6555C5B8C;
	Mon, 21 Oct 2024 08:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37EBC4CEC3;
	Mon, 21 Oct 2024 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729500479;
	bh=cNwlbFurWCK9ZSSwu60b/PoTHLWGOoTV9tFHS1xUCIo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=E2ejQqu1tEQfpK4p+T7d1yHXpF1S4Am3sFToz+5yeVbKmDEzxprYvkpwv4fiaFuAw
	 kJzwt06Iuw8goC9niaUn1fl0i8qlEYann53cU+nrJGlSBCN2fztKtXn4QOZTlYczeA
	 BcKNGP0r530CB55p3CJTBmX9l4DQp4rH3dpUCcGttg7y74tyt4NnJB3xt+SmbsAYaW
	 nXFb3GJcg8TeSBbTpLm5LZV7Seg+F5+1zFSailXoXLNcTWrmIqn53ZigITng0lKZYY
	 OmQUjd+/rsWFq+Ej2dRG0uklrFUAdI5Ck7MKUTTdOioDTE37swnhmWI83ffitKm84G
	 gw6UsPQWky0oQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 11/11] wifi: ath12k: delete mon reap timer
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
	<20241016065700.1090-12-quic_kangyang@quicinc.com>
Date: Mon, 21 Oct 2024 11:47:56 +0300
In-Reply-To: <20241016065700.1090-12-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Wed, 16 Oct 2024 14:57:00 +0800")
Message-ID: <87wmi1q1tv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_014800_418557_BF443533 
X-CRM114-Status: UNSURE (   7.55  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> Currently mon reap timer is not used, and it is not needed anymore.
>
> So remove related code.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Same question, does it fix a known issue or is just cleanup? Always
answer to the question 'why?'.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

