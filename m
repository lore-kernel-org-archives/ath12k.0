Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD5C9830D
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02HI3Gd0i3pyIFXxptZviDeo1MkzmKnEOfZytROwY3c=; b=lzHlf4HVo93E6TxOm/UFkNvDWn
	c8Tr0gm0rkvaciYnOifVthbc+q7wBbPTQWL2+GCYGZ9cAGpnx0RfwTdeAnTfSVULXEyQoN8s1HKiA
	noZcCdsKwFY0POrqjvxBOg2Shj2PqGYcPWi1z1e7M43hgxgGXXZgRw6Z/9WP1sTAPLU9ZOTM55Ai9
	cZOSIiG4icp2NkDEPK1CeShTkVdlM+A9lU8qdH4NLhcZQUTUiGNOwSaDX0qqHz4XupVzumym1WzSF
	vl4RKCOclDB8zIAfK+NScObVk7EUFcDjH3Zpc9iR9fBismOetR956gGQbwLElDS2Fq69MTze+/Yrh
	in2NUQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6l5-0000000DYvE-2Q3x;
	Fri, 25 Sep 2026 14:18:39 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6l3-0000000DYtM-2WcU
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 14:18:38 +0000
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hrt8q4hhlz49Q6S;
	Fri, 25 Sep 2026 17:18:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1790345900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02HI3Gd0i3pyIFXxptZviDeo1MkzmKnEOfZytROwY3c=;
	b=sRdtWOvUdps8iNdTexk9Jq2K+C0REedvP1lZJg5vemDnmQMQQ3sm4ygSpOH4s/4m/dE8dw
	mWW/rSfgcrYSB63XOhcFBNKJtCMLixVAjgdfd3q+6n1MuOVT6TBZvdZ4R9U38KVP0pBlin
	clKbKLFHqptt1mAYpCM2CjvZOGC0HuIVv3VnFLYsmoQmy/yvBKLQjvNhMZnCwjNXb5QxnV
	uvf7+2G68dUEyDKd1T9vU6BWvInCfNuaE9dm0ZE0lf8nZh3z5+rNA8hV5v/YU8H+SSJ7t9
	+vCAsiqrQZSkXNEpQy82IsRnkd1N7V6SSjNUpB91PMd0axEo/Kpc0OM6kvCs7w==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1790345900;
	b=jVeOJFmb/3rpM83tVsbhPKYkuRQSq2oeSbq6uvMddooKslwF93tZMdi2KnwfNvjkU9PrCb
	e0OGMFFrT95HSMbkxhavLmrbjVGkManfWULXHPn0DXcN96eoCXfWnP82rCawi+Kmq4bmW2
	qOT20GbKrWo8FbBd9svpRfmd70H/KWjcHpHcB8X3CGvK5m6xo6PKKjZgHOyPoDTcrusdpb
	aDeAqanLcIsjLJty8Jy/irzseaF+71LgtIGCkZPu2sjWRmqycVjdtv8J6wMIY8BkExJr9F
	idFU+bwRpLYIG4hvGBXCaJf75lLQ1edYPQBsRwW7gOSoaliNHyQCbYTfqlDGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1790345900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02HI3Gd0i3pyIFXxptZviDeo1MkzmKnEOfZytROwY3c=;
	b=aZuHH02QzGz95k9jrNduKk1wHj7E6hkA9BNQ8gCg9ceWmOh6IJAHXAt5dAm3QhAELnx1BX
	rqrLAw2IOfa7/ok3Ho880NYFwitTy/HuG1Xhcdd59ihFmxUWkdwi6GRCBqF4XW2ViDT4p3
	+v6HW02jqFxukf8/KNQXbw672wfO1WScE5GmM5kXKdpbJ+0cv9G3euJyP9cycFWL6aEW7P
	r86Wec6UeqlCEJI6AitDasCiSEfsl/QJvykVdgJ6DtprUWChMxj9BIljJ/fbilyXK0JBmq
	xyHxgmAfR77QAD6Vav5W3iKwhxx+eIi6D0KHUs3s7a44tFOs7i7eLYzVWN6fyw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0B9E1198005A;
	Fri, 25 Sep 2026 10:18:19 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 10:18:19 -0400
X-ME-Sender: <xms:qIK2atgsua0tF96b7QKWNDl9lm7R_Dj7V_ETpo4FAqORrOc57AzxRg>
    <xme:qIK2as370NguGk9nUpegTcz18X2SO6MWU2knFNLzN7kPm5J5KoSYeRucqkywoSNBs
    cJI6Q_9CKyS5OstgAm8j1XD4X8CmnsOVWEcfhTKR4RhclKGmKunrKXs>
X-ME-Proxy-Cause: dmFkZTFig1SXBo3qZsT1AZhF0+n52ZbYWBdqUb+cbB4VEsPctKu3tj+7Ur8gdha0wgkn4x
    M9PqPAayUqKdrwtN+dKK1879+21cfPasXzF0Ni63A6H4jBPvNXdtUHmDdpjruPG31ws0hQ
    Hik8MYam2jqZb8aox6HCQiqPGisSlnljKyKxu++353GiJDjXq01BAjV3KlWbjExViWIGc/
    aW0tkxYFy1B+ZEOFLBrkkuj2c17Q9sQc/rd3fbopjvYKJ8zK+CX1prIYaSmCd2FsxEgUDl
    2p+2CvxszkDlj5FAxktGXwPnM/wzghJvhVWYfkrdqZ1kzL468jlVtTCi8uG5i1VvKDsYog
    ybUuRfwKvEsDxXFeMykkj3h4d9jCsZ4f1U9UbOaFrUINOaPVih4rpgClDxv9dKkVBy2i/8
    Bqx+B7dsg/bZHxmvEN9ZAkqNONoiWIRT55pfT6e2Ty6FGhjuJRK7Pi6H5S0GEhVLa+22Mf
    eRiHeFh6D7RkxFmnY2+xqaFYP0e+q1bnZD5r8QotSS+GeyqsjTWkFbPQOYuFtcFekRiuzP
    PKzwSjFWbWOwf9A/hjNzaE4ra7Q0ZfawgGeT6qQ9GuJAut6e5ZCFLtiWUog4gzloxIpWCW
    tZn+DZ4hXHMVIqJuBxL92WohpyTzMD29Rehe9RV5AG9mh0qtYCYZx91wV7mg
X-ME-Proxy: <xmx:q4K2auwxnF_GAS3YAlP-aASgfZVe4Rabe_3BadIK83TBdz59T6k1Fg>
    <xmx:q4K2akzxpmLBYZJnEfZjt0jpk2Mq9Gx7ma5FXC1VQeEfMhQbmiLxcA>
    <xmx:q4K2atSiFJ6smI9KsCPKnity4jmkrwxYb8h7ML8Lvwg5Nf7Q1H1AkQ>
    <xmx:q4K2anOT8Odin0qVhGceWX1Q3_biDPyRnVYIPsAXnNl4-6nV5jILvQ>
    <xmx:q4K2aoRdqmJdiZxIx0-44KMJZm9Q61FrGNQKt_Marwgh2kXgOmXZuxmd>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 28752F8008F; Fri, 25 Sep 2026 10:18:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A_PuV4p-mAYk
Date: Fri, 25 Sep 2026 17:17:55 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Youssef Samir" <youssef.abdulrahman@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <73152e3c-fd11-492b-be04-7986f6af03f6@app.fastmail.com>
In-Reply-To: <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
 <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
 <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
 <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_071837_804882_31DF0972 
X-CRM114-Status: GOOD (  19.33  )
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

On Fri, Sep 25, 2026, at 15:46, Youssef Samir wrote:
> On Thu, Sep 24, 2026 at 4:58=E2=80=AFPM Manivannan Sadhasivam <mani@ke=
rnel.org> wrote:
> > On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> > > The chance of collision is slim, but still not impossible.
> >
> > When you mean collision, do you mean node id collision due to bridge=
d nodes?
> > Because, even if the directly connected QAIC devices use 32bit node =
ids, the
> > collision won't affect the functionality.
>
> As in ep_nid of one device matching the nid of another device. In MHI,
> that shouldn't
> really matter since this patch moves away from using QRTR_EP_NID_AUTO =
in node
> assignment, but as you mentioned below, it could clash with TUN and SM=
D EPs that
> are already registered with their ep_nid.
> > Also, there is a collision with SMD and TUN endpoints, but that's ou=
t of scope
> > for this series.
>
> I have not worked on a system that simultaneously uses different types=
 of EPs;
> only MHI EPs. But if there is a real case of that, we can move to
> global ID assignment
> that includes SMD and TUN.

Global ID assigment sounds like a good way to solve these possible
collisions. My patchset had xarray based endpoint id allocation, maybe
that could be reused for nid allocation.

One challenge in MHI is that the two sides, ath11k/ath12k and qrtr_mhi,
need to agree on the endpoint id. If storing it inside MHI controller is
out of the question, then the only way really is to use MHI controller
index to derive it. Maybe something similar could be done for SMD. But
for TUN, this sounds harder. Can ath11k/ath12k use TUN at all?

BR, Juha-Matti

