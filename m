Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692FC982D7
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFniBaOSSNu6ZtH5eqeRT+EniF5CxizeWe0To5zvrfE=; b=1L4C0IGWLgG03XoKCuqOaVggQn
	oXwtGwtux7DQYK65RWiRwaej29jjWOt771nPXaDoeukpwGk4Fri5k11Uw9gRbqs8Dj6P/RHJWwnqG
	H2xsb4bcwY8b9HucxfCzNF4KVol8XmH2JGRS4EM5MGrzKdmqyUl0eStn7Ub1wKpUZ6y0K4NWJjl5L
	h+X1pSkFWmGvS97QrlfSKKkqUdfaF2mgi7myYY0Qhd4sOyY46lLtempi8LQ9jnOfM8Itfv/WVE02C
	dUHHRoIqlscwsFsp+4BFb7s/se9CS/wLoZR5YC+wMRECekURyxPnw0X8t+UThnmpl8Bo78I9jWXwJ
	ap7bHt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bom-0000000F5Ux-32Z1;
	Fri, 18 Sep 2026 16:52:08 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bok-0000000F5UE-06JQ;
	Fri, 18 Sep 2026 16:52:07 +0000
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hmdvL4tQ9z10xl;
	Fri, 18 Sep 2026 19:51:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789750319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFniBaOSSNu6ZtH5eqeRT+EniF5CxizeWe0To5zvrfE=;
	b=VhzfLo5S4zh0u9wc0N2akvtg+8LkLb2zV7g+rlnt1F7jJA5M8VLZsTXxBiVTtkjH3y7Vbi
	CtDGuE+/A0BS22iS/1wWAjk85WsBSDObsV3pH5gj2i0x+FonDkvIOmZEqfpCx3dN9cjaag
	jBZwLfdXE5l6f+fULYigxLHimm2mJuc=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789750319;
	b=S0I0hwUNMpd7V2MfAi17dTDR6Sll29moaKL2IysYVw4MkmDD4bkPcNnAogQIGfNdVd1uc6
	LQANxPhXS7LmKpMp6Gn75bEe/BuBO2nCrFwSrTKZ0heCwBtS4NusLgpADlXodgJ0uW/nen
	xmjw2wsmy2iRJs+8bcgpIuuqrtS6N34=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789750319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFniBaOSSNu6ZtH5eqeRT+EniF5CxizeWe0To5zvrfE=;
	b=QIktM2zi8H0JXvJzWz+bR7zDbMa/pGmgZOoZfFaHYuvzEilfQZ5s+zGiHGFR4vbwEFx00+
	yLYbDM6scLow6FXE0beGVqOhAjY850Xfwfp8mvNrc2TGN33YHJtC1vrGcnf5WY95RDjPuj
	gmXUyrs402doWlGJoR9MgNuQ2LyDM7c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B1C91198004A;
	Fri, 18 Sep 2026 12:51:57 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 12:51:57 -0400
X-ME-Sender: <xms:KmytapBsr5nVa4ZmIXQgAUHhnxcugE7AYvX-BVSdRtLb2oVUesP23w>
    <xme:KmytaiVtidsR99LVGcbNAtdXQAYhwkcUG4u0grycuuQ5FPvFVWSMTBGw4_ZU8T3fh
    HAkUljZQ7wbGcNEJyIUYUTqIkJt-xYLCBl6z2yXoGXwnFfDEO1ZH4it>
X-ME-Proxy-Cause: dmFkZTGNcKeUoS6p/UeL/gMh5UWUFiVWwbx7ey0te+Xw5EsHIe1Jj1XU6ZjsITNOQ19Y+i
    VO3vGx9rSUSiH+cpHXFrz3vu5iYTny/gJtxLwbH/A9AzR8Y28HIgvPhmGgZWvPjbakCjL2
    N/asmkHvVR55YKiLvZhYMa8ulw8RrSp1bwaZQ30gIZBNOnaBO72XfV+QAA8qyaai2JgJ6j
    v1WuIKrPMLrpJoYn143VO76r03KpZy6s4dklI1gj6XxQpxS3xtcj5UTJEoXyFvpBZHDbXa
    saeU1eyzCus1XNzSNAQA2h6HR/HsRioTLJRfR9X/K7Fq0YTCvlqOn8VfTbE6/UOJBs8fcv
    NIonDAHwo64bLyPRkOI1KQ3Elyb7xUBnKjpoOAB1+IXONZETBHmbVEJ0QTzk7jRt8qR8yQ
    Z+U9yeeqKDFVw28zEXiQZd6qMN/w2modqQAR1FbHCE+FhfALnZ1WhwIzLQlEeitZJ1019k
    Ei2/mry44zBMp0IhyvZw95OZZshGs5VmrpXbBEuOcmbhjvu8Dx4VN5LfsJaq2+foI6E6HN
    DRXvPJkx24Ux1HGcZLPYjw6cRrWCIMnpYoaY17rorTQQ5WNW55oWBw1er3EuiwsZLuuL86
    OkSR4QXXmiH/HG3sQA6sppP8DKHzFFSOKec3AO/BSFgp3+ZvqWbxmvdJhv/Q
X-ME-Proxy: <xmx:LWytatbbSBa4wPl4UqfeGYn_EY5mEACuxOWO7uyDWJQM8F1Nn23bSA>
    <xmx:LWytaggNcoj0hVvts8pFL-SuQYlbvb0qK--o2GnDbvFPgdccSR69wQ>
    <xmx:LWytarwI76vUO6slFD6xsrxkI9YGluJ7sKm9vpfcVGz8GcOf1N593g>
    <xmx:LWytak87TJ9aR6FgmiM4xxz-EUtbf1jjkplUArwf7nReTCSfdJA4Dg>
    <xmx:LWytaozrkHyLbHBVUwu8yvRvxRwP-4_cmsNp0JVTE5oTWW_uyvTY24GF>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5863EF80089; Fri, 18 Sep 2026 12:51:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbqzItSRZteg
Date: Fri, 18 Sep 2026 19:51:33 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>, "Mihai Moldovan" <ionic@ionic.de>,
 david@3adesign.co.uk, nakonechnij.sergsj@gmail.com
Message-Id: <cb6766f8-54b9-435f-a69a-e712727dabdb@app.fastmail.com>
In-Reply-To: <20260918-qrtr-multi-ep-v1-4-8a06caa368d3@oss.qualcomm.com>
References: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
 <20260918-qrtr-multi-ep-v1-4-8a06caa368d3@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] wifi: ath12k: Connect to the QMI server belonging to the
 device owned by this driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095206_248683_4874D2E8 
X-CRM114-Status: GOOD (  14.19  )
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

On Fri, Sep 18, 2026, at 19:28, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

CC'ing Mihai. He is known to have a platform with two ath12k cards,
but he said he's been busy recently, so his testing input is uncertain.

Also David and Serhii have found the bug at Bugzilla and may
be able to help with testing. (CC'ing them too)

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218480

Here's the patchset in an easier-to-access format:
https://github.com/Mani-Sadhasivam/linux/commits/qrtr-multi-ep/

Also, I have suggested that at $DAYJOB we'd switch to a newer LTS kernel
with better ath12k support. This may take some time, but there is a
possibility I'll be able to finally get ath12k cards working. This might
allow me to test this with ath12k cards, porting the patches to 6.12 or
6.18 kernel. But that will take time (the kernel switch; backporting is
easy for such simple patches).

BR, Juha-Matti

