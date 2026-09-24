Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44AC98310
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBy79kRrtx7J2pq9frk0FI5XdRNIhf8VGyWrUuvdG0Q=; b=Zf+PykfmxgRhxVfU1+fjUU8Yeu
	Di9CM367XEh/+QeP5rgb9KKzKvSlMDuhzUQPOhdntaF0YwtKERDpKvDQ6TArTWjUGLSrI7IAVubDI
	Hur8YWAVNVVn9jCM/Y1Aa4ochUrXcCxs77QRKZjf854tgPqCWzc39szTc6cNJP/xDmNTJL5fwih4V
	7dSstyAK3VIa8Wkenx7eK576xC5iLAFE62KJ5osOwaNzPy12RwFIBxAFb9KPi7c+bs3oeYBmojRcO
	dcTuONSlIa942tomf6itwItyquG5Si3p5oU18wrv7WRlrzR3vN+eyG0cxheuLX9xXZrH92gXarSmb
	FTUKW72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ebJ-0000000AOuD-0iKg;
	Thu, 24 Sep 2026 08:14:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ebH-0000000AOtW-0LJB
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 08:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MBy79kRrtx7J2pq9frk0FI5XdRNIhf8VGyWrUuvdG0Q=;
	t=1790237678; x=1791447278; b=hidU1Dcqy4vxhJMqPTvJPe4+0MJ1GPbrtPEgdqnL8nuttoE
	5DeM8SzV35+HQASOi6eWeHaq+e2fXc6j7wX2uG3cG6gK5ppQEv0bkSzDszttj2zlJcx3YdiKwhsF9
	2S0Uil5Im2XLnPDWEQcv1unPlQO7RcR1/tbmbQzU6DGRCXC4ZvIpcDfy4uAr80ojxhF+lS/FLg/m9
	nM60epiPcORTAItu7Bp2z92PNe8+Zp4Y0v2pPJRv+vBwrZotKRagGaVGky0duJ15NvXvhUAuGkWbb
	JLftNxdHs9BVJZ6LioUTNzjxPX/AENWtGisdYK063H1tJIrG5AqyPd0xNCmTTyiw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x9ebC-00000008vSh-10Kg;
	Thu, 24 Sep 2026 10:14:34 +0200
Message-ID: <b76bad90389aad66d9082428f3c969294c6a8d74.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
From: Johannes Berg <johannes@sipsolutions.net>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ganesh Kariganuru Mahabalesh
	 <quic_gkarigan@quicinc.com>
Date: Thu, 24 Sep 2026 10:14:33 +0200
In-Reply-To: <66e6b21e-843a-44ca-bf77-30441a80510e@oss.qualcomm.com>
References: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
	 <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
	 <ddaf2702-b33e-459c-9efd-098feba33243@oss.qualcomm.com>
	 <ee25d1c927d4a618384eb05a210b0f9b2147d055.camel@sipsolutions.net>
	 <66e6b21e-843a-44ca-bf77-30441a80510e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_011439_119630_CD97D0E4 
X-CRM114-Status: UNSURE (   5.86  )
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

On Thu, 2026-09-24 at 12:35 +0530, Aaradhana Sahu wrote:
>=20
> Would it be reasonable to remove NL80211_STA_INFO_BSS_PARAM only from the=
 AP-side station
> information, including AP_VLAN, while retaining it for the STA side?

I think it was added for the STA side, so likely is needed there.

johannes

