Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35169CED279
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvGKBMhZDMW4oeX0knao9Wj8IrRJFInNfUY359OFN7o=; b=U2sv5kHMdNS4HQqplAD2fO9+fp
	rM4yP6dX1AUI6F7VZgmEDFPWB9HSMVc4jnwQqSBvo9WtqbuI2AiwccFiqy5REjt46GFEgvvS+fE7I
	pvYk8C5Xa41v55DiyRVcgEgjdIe6PSVfZj3nJpTtvj1lM/9Qi5e9icTMOlM75mduazjnQkzkuzLlB
	d0W3H3/pqBgWcrkTTSaIZPtdhds2hPSIIu2golDt3/q74mUcXUz0KnlivI48+aybO+aA+ivR35AVz
	h83faL81iWx26z1tTvSGbfL1fd3aczvweznF32eH9Cclbkyxo0wL1oDX/mQrRT41zwkYynYI4NB7Y
	4q1Q6rKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4yS-00000004s3I-38D3
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 07:49:40 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4mF-00000004p5v-1olM
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 07:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=XvGKBMhZDMW4oeX0knao9Wj8IrRJFInNfUY359OFN7o=;
	t=1728373022; x=1729582622; b=BY4tcu1khJxc0H6HoiC3W8PO5oTGn80maO3hS42YchU+U74
	cVKoBw8sSV6xSX3dlGqx3yVNpNlhOs/cT7BlgD8L70CQnZWjeKhKENIXSED7EDh1WLhHaeCwirnnF
	mzTfwB1gUm2qch6IGzRv9DbfUVYYlh7RGCWdo0uA49kZw/nYIkB6iFQdoFtVut0tmajjxV9hj9BW0
	vXRnVOIRrGMQC1/xh4Nhrdg2e50XVX5qHNoWEBYIxKqtO2IAPXN75Px+LUocidO3k/vGTkqxsu3aG
	vUYOVdbtW8wcV3KwLty9DEt05TwCuxcSU3qH+vWN90dUl0N0j4NC+iawLmZGN3gg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sy4mB-000000048Tr-0dAa;
	Tue, 08 Oct 2024 09:36:59 +0200
Message-ID: <a66621974d1bdaf4ef9c922907786cf757cb4fac.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: re-order assigning channel in
 activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 08 Oct 2024 09:36:58 +0200
In-Reply-To: <97054998-0793-4c71-a202-dd5167fcc24d@quicinc.com>
References: <20241001085034.2745669-1-quic_adisi@quicinc.com>
	 <93df47a867ee1f8d84cabdbc953707eab2ea3704.camel@sipsolutions.net>
	 <6504caf7-e9d5-49ff-983e-73335f8ee3a1@quicinc.com>
	 <97054998-0793-4c71-a202-dd5167fcc24d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003703_516995_A80E4C9D 
X-CRM114-Status: UNSURE (   7.76  )
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

On Tue, 2024-10-08 at 10:43 +0530, Aditya Kumar Singh wrote:
>=20
>=20
> Is your testing complete? Do you see any issues with this change?

Yeah, it can be made to work, but we're still discussing the best way
with some internals (slowly, due to the holidays in Israel).

I think you can just leave this patch as is, and I'll keep it pending in
patchwork until we figure it out, and then I'll just amend it with the
iwlwifi changes when I merge it.

johannes

