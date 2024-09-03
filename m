Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B0CD3420
	for <ath12k@archiver.kernel.org>; Tue,  3 Sep 2024 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mIxV0yaj4AJS/251JR33tvnQbbnW/Q57frWK3lyk4I=; b=hnltm9mrUPQphbLDGAWUoDxBSa
	2oqLvKKKBmP7hCP2WYYhe6u/uYoo+Yflo4Lk7E7XQ9+tCoH17K8wDSEwhppnu/U37uEl+thz9Kt5m
	/d9JyXFWD9+okAWc/CZkLG4o/wcCsorlu69zaDqiSWX7WNRWBsD2VIp+eHJ7wam6badQwc1WCVcpc
	STC5KWRdy9KwDkAIZua7oIwa0onUwW68iOWqtXi1Tsd/JKhMEw4KiuDYonnda7IC56twjq3iF+/sO
	19eMn8mk/MivmipJ8oiPRamwL1P1NhMtlJEpPbfHbNC8+U80VQKz6eEnlXJ2+ZvdON0aMwiTSjoFS
	7e9MzHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQSG-0000000HHqP-0hxX
	for ath12k@archiver.kernel.org;
	Tue, 03 Sep 2024 10:08:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQS0-0000000HHpD-3GWh
	for ath12k@lists.infradead.org;
	Tue, 03 Sep 2024 10:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=/mIxV0yaj4AJS/251JR33tvnQbbnW/Q57frWK3lyk4I=;
	t=1725358072; x=1726567672; b=pzuVIF5INjg9POzIjNY//t/N5KH2lXxWgcOTBMWUzNtzV8W
	KtI7tg5fk1Tt4UL8nnBNC7kKUoOhfIx/OO7cHxTRKjt8hFTSkzzW/KbSTtaoEW5gzkcSKEbD6nz/K
	7X8iGSKKbXakkcGb8LPFPDAxglBvvVazjliswXEmG8BM1etT6zbzrCmL9WWm8efNdQj4CMaI+vK2b
	YFmYGDl06XcOOB9jOvf/rCaV/+9/vjZpBaWha5ghE9HebJh8eo1OCIBahTtUSc8idE0uhX4YAwg0c
	toaC21VmoEMqpFrRC804JT//Lf1eWPJ8qbqS261bkAT88mjQwFjMFER6rGwf72aA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1slQRv-00000002Ciy-1wCq;
	Tue, 03 Sep 2024 12:07:47 +0200
Message-ID: <5bd14f29b58a127ee04d2591a1a59f67b9e44d4d.camel@sipsolutions.net>
Subject: Re: wcn7850 issues
From: Johannes Berg <johannes@sipsolutions.net>
To: Janusz Dziedzic <janusz.dziedzic@gmail.com>, Kalle Valo
 <kvalo@kernel.org>
Cc: david Atkins <david@3adesign.co.uk>, Baochen Qiang
 <quic_bqiang@quicinc.com>,  "ath12k@lists.infradead.org"
 <ath12k@lists.infradead.org>, linux-wireless@vger.kernel.org
Date: Tue, 03 Sep 2024 12:07:46 +0200
In-Reply-To: <CAFED-j=i+jZwtFVzoiqXrVAubmDdxhqqVpAPSCRPMPoa6G_chQ@mail.gmail.com>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
	 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
	 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
	 <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
	 <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com>
	 <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <fb455a66-b29b-4eb0-984c-254f9a1c5626@quicinc.com>
	 <LO0P123MB40578B26075CD4C9C66D144BD6932@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	 <871q21kwk8.fsf@kernel.org>
	 <CAFED-j=i+jZwtFVzoiqXrVAubmDdxhqqVpAPSCRPMPoa6G_chQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_030752_834568_B14F18F4 
X-CRM114-Status: UNSURE (   5.13  )
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

>=20
> Yes, this is AP issue - hostapd fix required - advertise 0x11111 ...
>=20

You probably don't even want 0x11111111, that would require all MCSes,
which some stations might not support.

Since some things are mandatory, I'm not sure I see a lot of value in
advertising anything non-zero, certainly not by default, and only set it
if specifically want to require something in the BSS that's _not_
already otherwise mandatory.

I mean, maybe you do want to require 4 NSS and all MCSes like the
0x44444444 does, so that regular clients cannot connect ;)

johannes

