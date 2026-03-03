Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853BAEC1431
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sANG3WimobWLRM22SiDtmZU3m5NPrQ5WoDvzNGZnOUw=; b=4wYJL8PDgeHnbfANBS93vyVP13
	gxrWPvQoukqdQcvR36obIhpaeuM4wZGLQ4zTA+/imAU9e4PAT8KpXB9vVZZnYQEesE2ORn9S8tFjp
	77Sis7A5ZpmrBHBNWGUQUQVFzsvVAQ0NAZJHZ+tTEr5ijuQjvayHykCRXec7I8utmSqbrQ9l5gttJ
	DgFgDFMHnYpxBYcdKs2YdtKa4uymuCIgsesZ2MLE8ui/L+oUQP3O0UlmgkZTu0nL2oWlKRJSSObh0
	8Qktg0gHBxq5n0t1axN2xahPmG7cb/6cepF7gg4IlQQMqmYix8O0xZ2eE0qu54CJdt7rqUUmvb+Wy
	Jqwepaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOB1-0000000F65a-0pc0;
	Tue, 03 Mar 2026 11:44:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOAy-0000000F64m-1jQI
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 11:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=sANG3WimobWLRM22SiDtmZU3m5NPrQ5WoDvzNGZnOUw=;
	t=1772538272; x=1773747872; b=FOWTCzCMIOgDq5DYC+0RPZGq5WwgWACdRvquTRZWdv9+5ST
	DXiE59BukuB18cxfqZDe8s0PoBubmtiQZ9WchxF7ZrrNxQYdDddgseJCUmRsJZ7j8JkuylO+umMCr
	HTK7JS033osmBvu77DuA8OpjltTU2AkfWE0qhntbcOBAR3+IO5Ouit308SFE4vlyxrNV1W+tPUx+a
	Qmpm0jMNmFGig4yUJRQmXqb7P71Jv/GYv0bIuEiIbqq7BT/tqgXG/1mqRkpng/nRjJpmAAr23VTL1
	bo+5PnAD2qBvXZ03wjuUSZLtqqDxHGQgwlg49QmMgKIu7sGVsA6UUJkWCrAi4Zjg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vxOAs-0000000755l-1W44;
	Tue, 03 Mar 2026 12:44:26 +0100
Message-ID: <042df19bd62ca0f8044c3da496319c8b5fb79bdf.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 03 Mar 2026 12:44:25 +0100
In-Reply-To: <a882918a-0d6f-4eac-ada9-5d4bd748b33c@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260217054731.3667600-3-karthikeyan.kathirvel@oss.qualcomm.com>
	 <d52fdbe5d9a483b5746b7253b512958d1460a9a1.camel@sipsolutions.net>
	 <a882918a-0d6f-4eac-ada9-5d4bd748b33c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_034432_496088_B43CCAEB 
X-CRM114-Status: GOOD (  10.61  )
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

On Tue, 2026-03-03 at 17:11 +0530, Karthikeyan Kathirvel wrote:
> Got it. It looks like this requires a deeper feature-level understanding=
=20
> or a review of the full spec document for each feature.
>=20

Certainly some understanding, but I don't think you have to necessarily
deeply understand each feature - it's specified in the table of
capabilities which are reserved where (though one notable exception is
missing in the table, the update timeout.)

> Instead, I used=20
> AI to simplify this. Below, I=E2=80=99ve pasted the AI output, categorize=
d by=20
> AP/non-AP STA and by bands. Is this approach fine? Shall I go ahead and=
=20
> make the changes based on this?

I can't really say anything on that unless I go cross-check this with
9.4.2.354 UHR Capabilities Element, which you can do just as well as I
can? :)

>    ### UHR MAC capabilities
>=20
>    |              Macro              |         Role tag      | Band tag |
>    |---------------------------------|-----------------------|----------|
>    | IEEE80211_UHR_MAC_CAP0_DPS_SUPP | Both (AP + non=E2=80=91AP STA) | A=
ll |
>    | IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP | Both | All |

Also the table is pretty unreadable anyway.

johannes

