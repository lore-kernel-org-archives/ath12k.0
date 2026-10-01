Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994F8CA5FD4
	for <ath12k@archiver.kernel.org>; Thu,  1 Oct 2026 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw1rj845XftbG9SUjyzYpshHEzKeJ159aAiFNfiYTUA=; b=sXyRIHuIyZWCO3PH4VpIKimyp1
	ffH/a/v8ylLEx9u0uSPhCTQs0ncRStJc6KH40hURH0DKIbifvmTkdj/9rWBNHAfkk96WXLVxSv4EV
	9z7oRIzERGpjl75FUi3pVQbd9NRmRVdFRBLT27v5XPOS7HiTNuKwNVsHw+L4RGxYTijlCATQwk2i2
	Mx+NqDwTzNYyv9zMboLnACwKwxNmp4w36AgMwtSFz9Zx43bZQvn7P+2YeeYxshVRI5FEXjBJCB7T2
	PH2kQRLSaMnSlgVsMTrz1uCgyB866Ncm9z/xO2Ukp2o+XM4/x9ACaCiARJNUxAMmYHM04ofikqr2F
	J9+5TjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCItB-00000009ZIP-17te;
	Thu, 01 Oct 2026 15:40:05 +0000
Received: from mail.holtmann.org ([81.169.141.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIt8-00000009ZGr-3hKG;
	Thu, 01 Oct 2026 15:40:04 +0000
Received: from smtpclient.apple (p5b0a9ac0.dip0.t-ipconnect.de [91.10.154.192])
	by mail.holtmann.org (Postfix) with ESMTPSA id A906FFF12A;
	Thu, 01 Oct 2026 17:39:57 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <19433f85-4cf1-4ec1-a26f-0eab7df062df@app.fastmail.com>
Date: Thu, 1 Oct 2026 17:39:47 +0200
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org,
 ath12k@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A709172A-40F7-4986-B7D3-02A422F6584A@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
 <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
 <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
 <0A4EB216-06E0-4A7D-A0FD-821DD371773B@holtmann.org>
 <19433f85-4cf1-4ec1-a26f-0eab7df062df@app.fastmail.com>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084003_070233_F312E80F 
X-CRM114-Status: GOOD (  12.47  )
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

Hi Juha-Matti,

>>> Well, in defense of Manivannan's patchset it currently works for =
PCI+AHB
>>> setups better than the last version of that by Denis/Mihai/me =
(although=20
>>> I could easily fix that), and it may be simpler for userspace to
>>> continue using nid than having to bind to an endpoint, which =
requires
>>> more changes in userspace code.
>>>=20
>>> The userspace just needs to know the nid.
>>=20
>> and existing userspace? You can _NOT_ break existing userspace.
>>=20
>> Don=E2=80=99t you need to re-write all existing QRTRIPC packets to =
actually even make this work?
>=20
> Well, from what I understand this rewriting is the plan.
>=20
> It is true that if someone has a single card, the nid changes, thus
> maybe breaking userspace if the userspace has hardcoded nid.
>=20
> But if someone has multiple cards, the breakage to userspace is less
> with this patch, since userspace can keep on using the same code and
> just change the nid, whereas with the endpoint_id patch, the userspace
> needs code changes to bind to an endpoint.

the general rule for Linux is to _not_ break existing userspace.

Regards

Marcel


