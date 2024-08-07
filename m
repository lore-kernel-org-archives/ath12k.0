Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE91C3DA7F
	for <ath12k@archiver.kernel.org>; Wed,  7 Aug 2024 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7alKFTqBOb7vlebMFbo2utWboivpefC1xrmTNX2ztg=; b=FpOkl7NEwpt2GwZRv+scY5X+lH
	305AGfDqRczjUPNrqLsTWuf0jeArJ8Q4m777UlKelONFSwxgZK9t1eSXpzMsE9oeujoeyZUA57k4O
	vIxmcKUCa8DDOlXEPGEn8wJ46u5uswlBkfuPuXaCi4UZgp/iFYfz/HPWot7F9QjH3bF816PO/LF2r
	uRN1YqY/cW7KHaBdNle0ZOTSXbkg9GcOGAkgjBRjz3A1DyB3QqIcx5Ej+XaHK+a4c/aX7g5KEFJBc
	rDYMDMjO3nrkc/DKaspEA+NgxZt9hnyo7/ipR0xgdMtFx/THbKwZNlRzslP5IyheSQFqjxP8y41Jy
	t4pQ3XFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbpz-00000004KMJ-0e27
	for ath12k@archiver.kernel.org;
	Wed, 07 Aug 2024 08:16:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbpw-00000004KLy-0H3B
	for ath12k@lists.infradead.org;
	Wed, 07 Aug 2024 08:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F43361151;
	Wed,  7 Aug 2024 08:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95A7C32782;
	Wed,  7 Aug 2024 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723018558;
	bh=IzKD6YxQUyCLKl4/bklFjVs9bsFOkoNAaSkZSuGgCSI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oKGrNv7FnTWd9g0u8JUSfAmxGr5h4lL9Dc/jCZQJt7CaHnpR7OcwSatElUQuAmAC2
	 IcKo8f++VuiU9mBD+O6WZ509LbcZu2mcP2Pe80XvWk4UBEsztLPkhXon4Fr1z8HT5G
	 n9jEgZ6SrDR89vhz5GlOwGDhHOa/kqHwfMfgV83mOrDTIXWt9STYmqN8S3r9VoZ+mg
	 9V2J3HXRe7blfZNLxXIP3076O3t5R6hliMN6qx1J6fZUuey/zcEa9SU82sCSfhkqC1
	 S+R/4MesqQl52WSm8xevM4d6g/iEGQYiTloYWrgipSsk1jxKUMeFazNOrvrK/h72W6
	 wItPpq+OuROUw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix invalid AMPDU factor calculation in
 ath12k_peer_assoc_h_he()
References: <20240710021819.87216-1-quic_bqiang@quicinc.com>
	<47d0d6f2-ca36-4e56-8019-ace2304d40bf@quicinc.com>
	<f2fe83b8-d973-401e-942c-11bd9e29e888@quicinc.com>
Date: Wed, 07 Aug 2024 11:15:56 +0300
In-Reply-To: <f2fe83b8-d973-401e-942c-11bd9e29e888@quicinc.com> (Baochen
	Qiang's message of "Tue, 16 Jul 2024 09:50:16 +0800")
Message-ID: <87sevg4ukj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_011600_176186_F22EBE4D 
X-CRM114-Status: UNSURE (   7.72  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 7/16/2024 1:31 AM, Jeff Johnson wrote:
>> On 7/9/2024 7:18 PM, Baochen Qiang wrote:
>>> Currently ampdu_factor is wrongly calculated in
>>> ath12k_peer_assoc_h_he(), fix it.
>> 
>> You have 70+ columns for commit text, use them
>
> Thank you Jeff for pointing this, do I need to respin for it?

No need to respin, I can edit commit messages and fixed it in my pending
branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

