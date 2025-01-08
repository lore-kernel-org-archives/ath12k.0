Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB33E77199
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQoaI2I8hK0vCJL5Xk0t1rqg9LLvN9K0Gc1DUp9qi20=; b=h69pYpp5EDTYSnSwxdN97WTpjO
	ScfbH58NnB9HadVKLziwVbgp1pMUxh1jtkLREg7fGWoU563XGvT0NS8zo2T2IMoMt6plZldifSY2o
	tS0w8xJgofoVdOzvsSiPhfTIRJQgaInMBbFpSghzWG5Uyd1Iro6KU/Dn2aK8jYnJOY8J0WaiZVAsD
	zDzwsdsi7GZlhRxdYXbLirCGGuNVxHT+fyWKObcj4Mk9NJ4XG72de5PmT0SASxsOxc4ioL9nASYNz
	FwoJtN1Td8X4L0IjKhx26+AMMjZEZPBp91/GszwH5sik6D1RgoNmYDRcaaMa7uQiewXHQVA3D9uKb
	uC99BN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWB-00000007Zdo-2ZVK
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 08:34:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWA-00000007Zc7-0J3e
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JQoaI2I8hK0vCJL5Xk0t1rqg9LLvN9K0Gc1DUp9qi20=;
	t=1736325260; x=1737534860; b=nLeJ/MLVWanlh5i2FhVJP0S/2Z0xGWNIU2hIc5stf46o9ip
	KcHLfS0R2CWn/H1w/Y/ZdJQp89BGRoI9gOx5U7OT+kBq/pXWYgT3IPVtrsKSTJeveM/LgeMXIlUiW
	TBzxQatPwxJR+mrkHyo4wEFVoG4WZm7ef3UvybSfLDAV9xdZ9Fe8s6MDpn0iYwAxWeZiYn8k36wRc
	nVIc6bZo1MvZYZtuHJdW1AhV4+GPXthRa5A7Hzb0ZAexfcoJTrcbreQxQWay71l3mdKydVATHuT2u
	wRClwc2G4YOVEuFfjwsoa13yssSUFY3XWOxtjUK7fjfv3MrYygmzNMEPySxmHJmw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tVRW4-0000000891n-36R0;
	Wed, 08 Jan 2025 09:34:16 +0100
Message-ID: <6f61f6eaf03eec99f0f30d01501bc60f8ead1270.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] wifi: mac80211: update ML STA with EML capabilities
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ramasamy Kaliappan
	 <quic_rkaliapp@quicinc.com>
Date: Wed, 08 Jan 2025 09:34:15 +0100
In-Reply-To: <20250107174802.1793252-3-quic_ramess@quicinc.com>
References: <20250107174802.1793252-1-quic_ramess@quicinc.com>
	 <20250107174802.1793252-3-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003422_118730_8ABCD39C 
X-CRM114-Status: UNSURE (   5.80  )
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

On Tue, 2025-01-07 at 23:18 +0530, Rameshkumar Sundaram wrote:
>=20
> +	if (params->eml_cap)
> +		sta->sta.eml_cap =3D params->eml_cap;
>=20

It would seem to me that 0 is a valid value, so you may need a separate
"was the attribute included and we're changing the value" flag?

johannes

