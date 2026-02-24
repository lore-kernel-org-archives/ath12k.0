Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD2E9B278
	for <ath12k@archiver.kernel.org>; Tue, 24 Feb 2026 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUA2xBrMwgjxizEd5FMOWlQ8/O1DyXLl0e6CJAyLL2I=; b=IbIOu31SBGJEkY1xSBBXkhCxMs
	YDn0/b1WU6/QGHnCFl8mdVZES3r9EmaeVa5LPY+8g5BbACTP1UxzTYdSmUxguGFILDw+OsB9gULQn
	j0mSbtmC+bl6FAap4VkqS4vA2bzrYYxqFIRFx8q7MU9tMOdmoJ9vlgVkr0B9L5Q8Vu68xkpPmpy3f
	Tyf/EoNjBI4xNoS4upgC3nkrPsccJYR/E/IVCoKNMxAS/YdaBpvbvMmDxgcizioyE4hBA7ujZN4/T
	cXeCXHvvOIMmP68KHWNGsPuJhV84Th5hPVT5lMfx7pFnatgNDqFwf7fiLtZQCj10pasGawNfkzj3T
	xJosKlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvUg-00000002PwS-2bze;
	Tue, 24 Feb 2026 16:42:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvUe-00000002PwA-3Ejb
	for ath12k@lists.infradead.org;
	Tue, 24 Feb 2026 16:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JUA2xBrMwgjxizEd5FMOWlQ8/O1DyXLl0e6CJAyLL2I=;
	t=1771951360; x=1773160960; b=s9950PKEC8NJOoEmjDPcpSJDjHHqN+STNhAWTzc5wlOEL9o
	XAwg6V4i9UIRvzszfI+BNiH9i9MMf7KVKLWNI3KamIYBJDbOr6HSny/1vXjcYmXhxN9NZO9CBtaTb
	mkGqg00G9HRyWduR5lZekTYP722wQt5ei9KiGWB9yPBYsNP97dRUqn3IqmF+478xkoW72zuuP7HmZ
	5nwiV0vOGZzHq+U3NQWsbr+R+6zZyr3MmksIMFmT5D8ovwTwComnmqJqeUqnjAz6HsbzcAwgdc/3z
	sevM0Y+ey631+LnNSHnshQIlnFugluQ4kPJO1zTJKOJO3rux6F6YcxonL35vmRbw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vuvUa-00000000aIt-2UK8;
	Tue, 24 Feb 2026 17:42:36 +0100
Message-ID: <c71a84fe19a632ccd748d0f1fded1a8b1277e0b1.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 24 Feb 2026 17:42:36 +0100
In-Reply-To: <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_084240_832761_A98812F8 
X-CRM114-Status: UNSURE (   8.16  )
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

Oh, another thing

> + * @dbe_params:
> + *	B0-B2 - DBE Bandwidth field is set to indicate
> + *	expanded bandwidth for DBE mode
> + *	Value 0 is reserved.
> + *	Set to 1 to indicate 40 MHz DBE bandwidth.
> + *	Set to 2 to indicate 80 MHz DBE bandwidth.
> + *	Set to 3 to indicate 160 MHz DBE bandwidth.
> + *	Set to 4 to indicate 320-1 MHz DBE bandwidth.
> + *	Set to 5 to indicate 320-2 MHz DBE bandwidth.
> + *	Values 6 to 7 are reserved.
> + *	B3 - DBE Disabled Subchannel Bitmap Present.

Seems we should have an enum for the possible bandwidth values?


And also, it's confusing:

> +/**
> + * enum ieee80211_dbe_bandwidth - DBE Bandwidth

because this one is just "DBE Bandwidth" - I think you should rename
this to "DBE Maximum Supported Bandwidth" or something related, and add
the operational, since there's a 4/5 difference with 320 vs. 320-1/320-2
(the latter in UHR operation)

johannes

