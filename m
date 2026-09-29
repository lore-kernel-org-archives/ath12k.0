Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6840DCA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D76+O3ZMCQadvcJz+XOKNWC2ilHPP4lTIXNv9esP98g=; b=njH2iY3DBnVzzVldWCDeIQ7iJH
	hvqTnG/qMKe8fklAS3T4ZztpdCXxQoVoThD2/WyaTFyNfY9HR8i9n1397Pebhh40gm8xQydCwt/Jj
	M4EmgZ14kpmUVvOtMEpualzy8Kmiyc6Wusv3fL98iRg0aEsZlBowOTz9yo/OYtyUmOJFuleXGBMqa
	JMVJTnHJ0eDPFhHYXALH1eqa/9qM4RgsYN7y2Y3+jP+AYWUX7Ea2TYO9K9eFWCN4z4nmuvwfUKZxh
	7ap4kEoIeOWV3VvrbIGWhMUUB+fxsE1vel+dH7/Va9AK3Zzzyacn+3qKhRcv29nvNA47L+JLhTdnI
	uky0QVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeaJ-00000004W0v-0PHx;
	Tue, 29 Sep 2026 20:37:55 +0000
Received: from mail.holtmann.org ([81.169.141.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeaG-00000004W0D-2m9N;
	Tue, 29 Sep 2026 20:37:54 +0000
Received: from smtpclient.apple (p5b0a9ac0.dip0.t-ipconnect.de [91.10.154.192])
	by mail.holtmann.org (Postfix) with ESMTPSA id 73FF2FF13C;
	Tue, 29 Sep 2026 22:37:44 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
Date: Tue, 29 Sep 2026 22:37:34 +0200
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
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
Message-Id: <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_133752_852299_64FFF6AD 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Mani,

>>>>> +#define QRTR_NODE_HOST_BASE 0x10000u
>>>>=20
>>>> Can it be exposed with include/uapi/linux/qrtr.h also. There are =
user space clients like modem manager
>>>> which need to calculate modified node id to distinguish same =
service from multi modem over mhi.
>>>> This is same as wlan use case.
>>>=20
>>> did anybody actually looked at the proposal that Denis and I came up =
with. It was exactly addressing this properly.
>>>=20
>>> It seems you guys came up with some hot fix and want to run with it. =
After month and month of silence and not bothering to review the =
proposal, you are trying to push your thing?
>>>=20
>>> If you don=E2=80=99t support userspace, your proposal is broken. =
Plain and simple.
>>=20
>> I'm still willing to submit a new version of that patchset originally =
by
>> Denis, if the kernel devs so decide that it's the way. For example, =
the
>> "radix tree of radix trees" approach could be replaced with a hash
>> table.
>>=20
>> There was also some criticism about a layering violation in storing =
the
>> endpoint id to mhi controller. However, maybe that could be reduced =
by
>> providing a correct abstraction around it, so that other code doesn't
>> touch the mhi controller structure directly.
>>=20
>> Other criticism for that patchset by Denis was its overt complexity.
>> Yes, it has more lines of code changed.
>>=20
>> This dual-card setup needs to be handled somehow, either by Denis's
>> patchset or by Manivannan's patchset.
>>=20
>=20
> I wish to go ahead with my series as it is simple and tested across =
the
> multi-WLAN setups. For concern around exposing the nid to userspace, =
I'll
> implement it in next version, thanks!

actually no. Seems you have no plan on how to address the userspace =
problem.

It would be useful to actually review the endpoint_id concept introduced =
by Denis since it has a userspace facing API. What is your plan? Are you =
planning to break all existing userspace code?

Regards

Marcel


