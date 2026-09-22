Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F09C982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCxQ4KNjfukY/T/evl93jcXFaaRTB82E1iGacrS+oP4=; b=BbBCVvQkKrz57ajWe+pNBISqHJ
	bojlFrO6+JMQoGHVRs8h0WczJ8wuCD+oNIjpMTslfeBxCxjJdrRwYxGxRRRXO/Kk/nW8eNvU7jhdl
	MKZQfF5lRJJOa40kbtJIdOjDChqbeEWF0vkOZYS1h1tKQCqLz+WRnrfy4Un1tmVw4lT82bSNs2Gdy
	Ib62Se7LHQJ7qXHXmwvwAHDnsP22OpRTcQDFQVahFa5pt6tbF2UB9/zMtz4x+kteYbba9uE/dLj20
	DFBTUftCVs8VsIa+1tx6gOE2UTAKk3oztx+xT9d+Jc8WfIA2J1F4L1Joqj4+UQ0C3DlBiIGwC7+M2
	AlKSf+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y5g-000000056r0-0iXe;
	Tue, 22 Sep 2026 10:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y5f-000000056qc-00m9
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 10:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JCxQ4KNjfukY/T/evl93jcXFaaRTB82E1iGacrS+oP4=; b=SfM8Ft69HOoIiRuzQPMa/xUe4S
	qEeThLeK2y+bC3AZcXSILV8qC974Gp2b30KpKc5yAZOk7rf2pXd9E5+2YTaUMUo3hpJEd+/UngLbd
	scaukxGJowmFhY0ryh+gnIN8tD5KlUTc0X3EByxvy3A7HUjA6/NMMdjxjNWrzLRCt37Y9cOpyt1w/
	Fz+3Oyxiwl7W1b7EKvVO63MjteM0g24UULVcHsnI7jnKD2S5PxGZ6RExouDKyLitQYC6qP4hPNPbv
	yBudQV9Gq8HtsmFqgmmUazcKZG0EaQYCWuaYoQJYysK0IXTp7Z/tVh5D3Ka4UO+qQW0+G7JwVhjel
	RZvbnQVg==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8y5Y-0000000DSgg-1uNf
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 10:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JCxQ4KNjfukY/T/evl93jcXFaaRTB82E1iGacrS+oP4=;
	t=1790074264; x=1791283864; b=L9kHwbf4xLh7wmMSLh0Qb5N1aq8QoWG8Viqg6cSUl5TR1d/
	5rPn2DTDSUeNJlV9w7SCK6zvtk8Z30HPPmJvrdPBJlO3P4lP3zTChL7+fIh4R0ThQm8+ZJHoAgKeU
	8t0MouCsEWmtX9URR79PvmJAjdwdavFY1HnTCP5Q/9O2ycbjbtd9wJQKyT3ZwC0K9XSYQ/LL+oikT
	J3FVTr/RU8SPxUAHRXOJVfmO1z2rTwv1KnDkd0xq3dGoknd806JF4jUzuSpZK27oPAcMFZRxDKMFo
	yUxnLxLD3uGD5VLiSCNrp/zR5JURE/QJceKAa95884WSyf61D0RMktG0l6bDbzHA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x8y5V-00000006qEw-09J8;
	Tue, 22 Sep 2026 12:51:01 +0200
Message-ID: <ee25d1c927d4a618384eb05a210b0f9b2147d055.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
From: Johannes Berg <johannes@sipsolutions.net>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ganesh Kariganuru Mahabalesh
	 <quic_gkarigan@quicinc.com>
Date: Tue, 22 Sep 2026 12:51:00 +0200
In-Reply-To: <ddaf2702-b33e-459c-9efd-098feba33243@oss.qualcomm.com>
References: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
	 <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
	 <ddaf2702-b33e-459c-9efd-098feba33243@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_115104_813641_8FBE1EA1 
X-CRM114-Status: UNSURE (   8.06  )
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

On Tue, 2026-09-22 at 16:12 +0530, Aaradhana Sahu wrote:
>=20
> Since all these parameters (beacon interval, DTIM period, CTS protection,
> short preamble, and short slot time) are already populated in sta_info an=
d
> are visible through the iw station dump command, I only made changes for =
the
> AP_VLAN case, where these values are currently reported incorrectly.

Fair, but I suspect that they were really only there for 'iw link'?

> I am not sure whether any third-party userspace application relies on the=
se values
> apart from iw. If we remove these parameters from the AP-side station inf=
ormation,
> the iw station dump output will also change. Would that be acceptable?

I don't see why not, if nothing relies on it.

johannes

