Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9D0CA5FC7
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iIJSTnMOWRTOmbXm6u7wig5eFrazUxV6Fl/xrS/ZMY=; b=UQYRBkFzqc55v9WnLX2nwaTxW1
	m7EfrWUoeHzHUEXtg9zSVtI0D4Ao+aAAjLWvDL9OKAojy+OOCQyYq5r4tCv844d4+U1rrWDMtAA/b
	j6J4ZBJxZrWJTdHGC7RFqPL+3zTwaffX81KPhUblcxube7ylk22yliIE/bY+MTX4hwOr7IaczKf6o
	gss7MES0IU54Bvm8unk5dOwJDUi7mU6+QLhX60zFS65Mu3o36zr2S20n/64jSLW4E9QWgFCfVrZii
	YVdTFkyGjHZ8XLvSmsbouijG9HbYyYYxOTQtvNmpLgs0bI99wiwmq688Eofq7Xdzowp9SYu6PfQuj
	h8kPLEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvNO-00000006KJ6-1tdl;
	Wed, 30 Sep 2026 14:33:42 +0000
Received: from mail.holtmann.org ([81.169.141.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvNJ-00000006KIK-1OTQ;
	Wed, 30 Sep 2026 14:33:39 +0000
Received: from smtpclient.apple (p5b0a9ac0.dip0.t-ipconnect.de [91.10.154.192])
	by mail.holtmann.org (Postfix) with ESMTPSA id 85DF3FF100;
	Wed, 30 Sep 2026 16:33:33 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
Date: Wed, 30 Sep 2026 16:33:22 +0200
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
Message-Id: <0A4EB216-06E0-4A7D-A0FD-821DD371773B@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
 <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
 <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_073338_546748_1664B3DE 
X-CRM114-Status: GOOD (  13.98  )
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

>>>> I'm still willing to submit a new version of that patchset =
originally by
>>>> Denis, if the kernel devs so decide that it's the way. For example, =
the
>>>> "radix tree of radix trees" approach could be replaced with a hash
>>>> table.
>>>>=20
>>>> There was also some criticism about a layering violation in storing =
the
>>>> endpoint id to mhi controller. However, maybe that could be reduced =
by
>>>> providing a correct abstraction around it, so that other code =
doesn't
>>>> touch the mhi controller structure directly.
>>>>=20
>>>> Other criticism for that patchset by Denis was its overt =
complexity.
>>>> Yes, it has more lines of code changed.
>>>>=20
>>>> This dual-card setup needs to be handled somehow, either by Denis's
>>>> patchset or by Manivannan's patchset.
>>>>=20
>>>=20
>>> I wish to go ahead with my series as it is simple and tested across =
the
>>> multi-WLAN setups. For concern around exposing the nid to userspace, =
I'll
>>> implement it in next version, thanks!
>>=20
>> actually no. Seems you have no plan on how to address the userspace =
problem.
>>=20
>> It would be useful to actually review the endpoint_id concept =
introduced by Denis since it has a userspace facing API. What is your =
plan? Are you planning to break all existing userspace code?
>=20
> Well, in defense of Manivannan's patchset it currently works for =
PCI+AHB
> setups better than the last version of that by Denis/Mihai/me =
(although=20
> I could easily fix that), and it may be simpler for userspace to
> continue using nid than having to bind to an endpoint, which requires
> more changes in userspace code.
>=20
> The userspace just needs to know the nid.

and existing userspace? You can _NOT_ break existing userspace.

Don=E2=80=99t you need to re-write all existing QRTRIPC packets to =
actually even make this work?

Regards

Marcel



