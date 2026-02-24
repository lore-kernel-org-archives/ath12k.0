Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F53F4BB65
	for <ath12k@archiver.kernel.org>; Tue, 24 Feb 2026 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUaBES1pgfd4UXRN5nydP5AQXLOnuADF+hwkvdTkdYs=; b=jj+gzsVWAs/4Wk6CYD+mAvsrMv
	VvO8qrtgAW2dQBKE+r6p8ZmNDiXTAtyxdTSdP9kY1En5LYgNKE+bbbKNGWOZt3vQk2KcfZdhYf66F
	0WUBAjlzx7snq4hvaX5mzHNEr8AJX0TWhVOLcVop1Hz788WBFAzeryOzAaFrgklNbcrEYOKwQvAdm
	vH5MNTFEOle6oNEre8eImEghg6Hs04xUDo2977ddJ3sPovQbr2YZE9kmdMYTRKG9uQku0KP72I7V/
	9lGM05r3xV25EZj9IBy5ubUoUQ6W8RQRLUNjP+3SPYLVIP+kPdzV/+WaIy5VKEtvcpdjYJYwTY6mD
	OZhczVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwMi-00000002V8G-3kwv;
	Tue, 24 Feb 2026 17:38:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwMg-00000002V7j-2suD
	for ath12k@lists.infradead.org;
	Tue, 24 Feb 2026 17:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=DUaBES1pgfd4UXRN5nydP5AQXLOnuADF+hwkvdTkdYs=;
	t=1771954710; x=1773164310; b=pEIQa51yl0CQTZm5iK2aVLyiOvgxTrxgNPGKxRSsdHCxFR+
	ayOJh0iia1tmAbkojEZ2n4iesF9fFEJSgFcYymAN4A3cnWjWRfiSn6qbywetpWGbFyISFzHtam1je
	BTiVoxdMOUH++P45Y6J227j7uQrat1Bx2rKnsKGK5hK9qnGWMECvfZK9FlDvtxt7BVFMIppR6L1aX
	k5/5CqHyB+Y6KNQiPo8RLmvwXwVgwgbGkOvanmRCtr32i1u6mNDs8B23433YmwGmm5WeHEJuWvHhI
	FtVjFNJdotzn92LzZHLs3J6x+SxtB0G371l4WY4L/4/Eq2Ii0y7kdjgAcc2Bq8sA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vuwMc-00000000bne-2t1G;
	Tue, 24 Feb 2026 18:38:26 +0100
Message-ID: <b2b284785c462961f4801e783e1421c0c9bba398.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 24 Feb 2026 18:38:26 +0100
In-Reply-To: <c71a84fe19a632ccd748d0f1fded1a8b1277e0b1.camel@sipsolutions.net>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
		 <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
	 <c71a84fe19a632ccd748d0f1fded1a8b1277e0b1.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_093830_727826_72CC1A6A 
X-CRM114-Status: UNSURE (   8.63  )
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

On Tue, 2026-02-24 at 17:42 +0100, Johannes Berg wrote:
> Oh, another thing
>=20
> > + * @dbe_params:
> > + *	B0-B2 - DBE Bandwidth field is set to indicate
> > + *	expanded bandwidth for DBE mode
> > + *	Value 0 is reserved.
> > + *	Set to 1 to indicate 40 MHz DBE bandwidth.
> > + *	Set to 2 to indicate 80 MHz DBE bandwidth.
> > + *	Set to 3 to indicate 160 MHz DBE bandwidth.
> > + *	Set to 4 to indicate 320-1 MHz DBE bandwidth.
> > + *	Set to 5 to indicate 320-2 MHz DBE bandwidth.
> > + *	Values 6 to 7 are reserved.
> > + *	B3 - DBE Disabled Subchannel Bitmap Present.
>=20
> Seems we should have an enum for the possible bandwidth values?

How about this?

enum ieee80211_uhr_dbe_oper_bw {
        IEEE80211_UHR_DBE_OPER_BW_40    =3D 1,
        IEEE80211_UHR_DBE_OPER_BW_80    =3D 2,
        IEEE80211_UHR_DBE_OPER_BW_160   =3D 3,
        IEEE80211_UHR_DBE_OPER_BW_320_1 =3D 4,
        IEEE80211_UHR_DBE_OPER_BW_32_2  =3D 5,
};


johannes

