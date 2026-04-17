Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6129F99C6A
	for <ath12k@archiver.kernel.org>; Fri, 17 Apr 2026 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u2fTv3IiXBB3BEJSoVAs9tglrnbn2oVYpexBCzoUu20=; b=SkjaN2l1Na63T7jmto27yMcDRH
	8w1JVsVKgT3SgUg3QvRzzRcXt3ja7edQgDl1HWUDMkyBKoaq21UdnTv7+s0ZpxT/Pi5hmfVKm5JVc
	LcvCKyo5aLzGOjxuFayHW5rNZY29hbu5Nad67G/5/Er7At+nmIgeuR5g3q4p1M/hQSaNfQUEjYPqd
	Ag5TIbKRnlDtAvcW6iCLk8uZCbZT5bkZSDsCIwArKqi0DC4o1w9WjI7H5AwMnouOWglYiSc4kuoRu
	nn3T49SJUxC4sth3YbLiMQuRon+udV7K7lrkDM2+SH9mWCRYeW48UYIQUBrm60DY/yDeOShOBfGFk
	yweXsEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDr1f-00000004V75-2vcX;
	Fri, 17 Apr 2026 21:46:59 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDr1d-00000004V6m-1J1O
	for ath12k@lists.infradead.org;
	Fri, 17 Apr 2026 21:46:58 +0000
Message-ID: <d464db58-a5cc-4f65-8bb7-3d3eea6ef01a@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1776462406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u2fTv3IiXBB3BEJSoVAs9tglrnbn2oVYpexBCzoUu20=;
	b=Ei2U+dsCu98qfqoXHWdCyiHkPmY+jyygiMZ+hkR8MuHU2n+JoSXUDXKNWNRUXVyz09Sz2A
	4prfIQtwaSH3uSCuW4vEz8NeE6WWYjm1/xqgYCOTpFeQ/Bwne4Q/V262u3U6MV/PxbPVwq
	wyZ4XaID336XfaV0UcpB1DYJGlhjcKVzWh+BxRvHAzM3LnTdfi9nhF+A6mTAyUh1chBKw4
	TUZPINvswbQdlBQnhD6ZxiWfj6CFVUOU8hWwqNplUFVQdUc1mNL2EenvUWbDszfQPUOsCH
	xn4xJHUKRz4wt006GLqkoL/4tky8DG6K4/ClJ/wh7iBA89gIcBEkZrAnEQqElg==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Sat, 18 Apr 2026 00:46:45 +0300
MIME-Version: 1.0
Content-Language: en-US, uk, uk-UA
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Update regulatory database inside firmware
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_144657_559349_3666DDDE 
X-CRM114-Status: UNSURE (   3.07  )
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

Right now the information is significantly outdated.

Many countries have 6 GHz band available now for WiFi, but QCN9274 and probably others refuse to recognize it since the information comes from the firmware rather than kernel's updated regulatory database.
Please publish firmware with updated information.

I'm using WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1, which I believe is the latest one as of right now.

-- 
Sincerely, Nazar Mokrynskyi
github.com/nazar-pc


