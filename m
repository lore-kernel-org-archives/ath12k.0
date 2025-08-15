Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E00ECA0EE4
	for <ath12k@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vBUeuXNDIqoWiMlVcX7q5VBbBd1IYHnZHLNnL49+N4=; b=xU6w3tIJ+V7HrPq/5yRmkaI74e
	fsORtVRX4k9wWjHe7z5c/3EIqBo8HpDKBMP8XOH91Xlqv+SvI//6CXHngXzkKoJ78TVqHdz4JhzBq
	kflKCj8hYTx7Utl/0W30ujyavIcodLGqvh35II4P4+M4uO0aHBUg4H7zCq4525oA7AdEV9LRSftkq
	gYvXPRg5Nog/77DtK+cl+xbuYz1s2vw9rc05SkcZg986f/DNBCDbCAE5glDXLXzQPe0CyC9abn7du
	qW+6RRdLS+L73vPFeUcn6KZwKKmpqLVOlfWWeTsf8VIN8zWHMCjPJLZvSBbcx+8TMJYvh3mITNZB5
	GVsHFs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGD-00000002Y76-3Dx1;
	Fri, 15 Aug 2025 13:14:21 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umr9e-000000027kW-1Dv3
	for ath12k@lists.infradead.org;
	Fri, 15 Aug 2025 09:55:23 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:36976 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1umr9X-000000002zK-0vox;
	Fri, 15 Aug 2025 11:55:15 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1400_1499 0.000000,
	BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_5000_LESS 0.000000,
	BODY_SIZE_7000_LESS 0.000000, CTE_8BIT 0.000000, DKIM_ALIGNS 0.000000,
	DKIM_SIGNATURE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
	IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
	MSGID_SAMEAS_FROM_HEX_844412 0.100000, MSG_THREAD 0.000000,
	MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000,
	NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000,
	OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000,
	SENDER_NO_AUTH 0.000000, SUSP_DH_NEG 0.000000, USER_AGENT 0.000000,
	__ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
	__BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
	__BULK_NEGATE 0.000000, __CT 0.000000, __CTE 0.000000,
	__CT_TEXT_PLAIN 0.000000, __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000,
	__DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
	__FORWARDED_MSG 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
	__FROM_NAME_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
	__HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
	__HAS_REFERENCES 0.000000, __HEADER_ORDER_FROM 0.000000,
	__IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000, __MIME_BOUND_CHARSET 0.000000,
	__MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
	__MIME_VERSION 0.000000, __MOZILLA_USER_AGENT 0.000000,
	__MSGID_HEX_844412 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
	__MULTIPLE_RCPTS_TO_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
	__OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
	__OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
	__REFERENCES 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000,
	__SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SUBJ_ALPHA_END 0.000000,
	__SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
	__TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
	__TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
	__URI_NO_MAILTO 0.000000, __URI_NO_WWW 0.000000, __USER_AGENT 0.000000,
	__X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2025.8.15.92719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=4vBUeuXNDIqoWiMlVcX7q5VBbBd1IYHnZHLNnL49+N4=;
	b=Rm7iApXJ2z8XcI7Jyc9tKHcV7DuAC+8jeKdrW8aQU+1cCYcnxoTAKsl8rAE0z2C1qhFX+80W38Q7a3NxEtIexf0/u2SBDtlSA97J59oZ9thwU5UnbH3e4Rk8RkJKRT7qmptFHFZhHjE0eKyjIzrjHmI0sCqCnIB7SmqeEayRSqQ=;
Message-ID: <573c76a8-c2a0-4b9c-b5a8-762b8d094b81@dd-wrt.com>
Date: Fri, 15 Aug 2025 11:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: ath12k: REO status on PPC does not work
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1umr9W-000ATi-TP
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1umr9W-000ATi-TP; Fri, 15 Aug 2025 11:55:14 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_025522_493280_79733E78 
X-CRM114-Status: GOOD (  16.62  )
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

i played already with big endian platforms and ath11k (not ath12k) for 
months. there is also a problem with the dma descriptors. the firmware 
simply doesnt support big endian with host communication at the end even 
if there is a endian flag for the firmware.  dont get into this rabit 
hole. (i worked 3 months on it and gave up)
at the end (i was working on a cavium octeon platform at that time) i 
just switched the kernel boot to little endian which is possible on many 
ppc platforms too.

Am 15.08.2025 um 10:13 schrieb Alexander Wilhelm:
> Hello devs,
>
> I'm currently working on getting the 'ath12k' driver running on a big endian
> PowerPC platform and have encountered the following issue.
>
> In the function 'ath12k_dp_rx_process_reo_status', the REO status is determined
> by inspecting memory that the hardware has previously written via DMA.
> Specifically, during the call to 'ath12k_hal_srng_access_begin', the driver
> reads the value of 'hp_addr' for the destination ring (in my case, always with
> ID 21). On the big endian platform, this value is consistently 0, which prevents
> the REO status from being updated.
>
> Interestingly, DMA read/write accesses work fine for other rings, just not for
> this one. What makes the REO status ring so special? I couldn’t find anything in
> the initialization routine that would explain the difference.
>
> Could anyone give me a hint on what I should be looking for?
>
>
> Best regards
> Alexander Wilhelm
>
>

