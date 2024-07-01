Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B2C2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQ/0zGbbBGS9K1JOl99JGiFe+SQvcQo/+TETA0zVn3M=; b=aQDwv/KAjo/zWtwwBqEbrElAMA
	X020DBDZ9VcoVrXepUM9rpUCgt0DqWBumYRAbrXxAx25h8O6nC3pUzP0zt1Vj019TJ4cncGuTcE07
	5y8yQboQ19hvncKDaJAqF+Tj6dshDuz2GQ/EP7cj/ORDcqstOJ4KJyadf+3oG7ZomDl8iU/VHxzTs
	WY4ukgH2QY2yCK/UjrEu2rgwZpvFal+JhPbCEkUlr9MSd/HwgdsTJf28nMC/udpF0mS6ip9E2ybsc
	aZXY2+ioPpYKLbRxg+rFoqLqMx0SzT0zcE3ViFKDZQcMIEMFUuSJT5nZmU10+Lcr6ZSphgNNaK+ur
	0+yytYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGGm-00000003GFG-0wI6
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 12:36:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFxO-000000036aJ-27Qi
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 12:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=NQ/0zGbbBGS9K1JOl99JGiFe+SQvcQo/+TETA0zVn3M=;
	t=1719836190; x=1721045790; b=aPGQ7CHFluoasMsETcvmABdkgEoq6RzlG4HhvqV5Gjjfpz+
	c3AUhv+QGKIFdr0zAHuVeCRL3JBjvqcZlinKxKDXM0QUJOjN4hSnV3ftN1ahkbd1JG/ZniVTr25KV
	055yHHVb2oAzqB5lbfvSpK8C5egdWqWj4bQGYKBbYFpVm8/S7JsNWYguOQPgQX1Ol0+To1ZJwcUjh
	PYdRcEuad6ZO3Z2/IE/L8zun5ANcg7gG3s/7pNhr5fkMDKtspfR0YeaSFT25YdSILsEF5e4gyiKyc
	Qo/wLSJ1+1WrdUCt2ssdMVGgtsvZPMfDtchAWnt0KTBNeOb/js6R8ITbNiHO2qvQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sOFxL-0000000277T-1yHa;
	Mon, 01 Jul 2024 14:16:27 +0200
Message-ID: <e58843d62968d9cbdb7768d2ed1d1445402658af.camel@sipsolutions.net>
Subject: Re: [PATCH v2 03/10] wifi: cfg80211: extend interface combination
 check for multi-radio
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Mon, 01 Jul 2024 14:16:26 +0200
In-Reply-To: <533ca7d2d2d6c59dc726b18b1e118270040ca627.1719733819.git-series.nbd@nbd.name>
References: <cover.692a4cf1c6bce46eadecbcbf0f3e9e599099f8c4.1719733819.git-series.nbd@nbd.name>
	 <533ca7d2d2d6c59dc726b18b1e118270040ca627.1719733819.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_051630_561632_B7483A4F 
X-CRM114-Status: UNSURE (   6.71  )
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

On Sun, 2024-06-30 at 09:50 +0200, Felix Fietkau wrote:
>=20
> + * @get_radio_mask: get bitmask of radios in use

I think you should document the (locking) context here - you seem to
assume (later in mac80211) that this is only called in RCU critical
section, but I'm not really sure why? (IOW, I'm not sure that's even
correct?)

Also I suppose could use a note that this may be called within the
context of cfg80211_iter_combinations() so need to be careful about
locking with that, I think. I'm not sure it's *only* called in that
context?

johannes

