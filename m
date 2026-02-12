Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95F7EE3698
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4llVvf9Mo/wttF0k+pL6UmEXaoAAXFXj72mqESVFoE=; b=s/WbDRT6tOjsS7Mm6f/KvfI5Fy
	fNDt4CwNdKnaSaBrcJavIeOpkssD/QgKga3yVs8dO8VlemViIPvQrkn50yepMl+YckFHCBnV7VOyu
	xwt+45i7EZyH1tdTh0OmwAl2MbK+FkJ+twAsWIbjxhTALje5MvsrOqw3Qu7fisEa00C3ghvP+IHaI
	uR/DoGv6+uqxb/h5XBwnk9jQQPSgL2xT588HL143yCrYkdJabQDOgjHkJnLFerhn2YXroGw0V/45J
	Jr4w2Z1bG0BdcOa1lq2vNPiGKJw90OZN8WcSWbsXez57vJXh4KboGwgViQfXipOtrO7guhzvvldRh
	bcHEGNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqac3-00000002SWj-2VHl;
	Thu, 12 Feb 2026 17:36:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqac0-00000002SWA-0BYf
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 17:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=c4llVvf9Mo/wttF0k+pL6UmEXaoAAXFXj72mqESVFoE=;
	t=1770917779; x=1772127379; b=FA5CQKfwkjdt7iXtXXE8JQ2no2g9VI7EPVKm33AC8Yd3HNL
	6BC6cWtAxy7nAdzbvswM+9Uychrgu/aF6MO5+BcDVFMrwh4EnyZLB2ZHBXUqaQetuEzJv2gLYNqCy
	LA2Jn1XqDRzzcLZGAZOxA4oy7DIBXjSlhq90epHGmdjFRypYm6oLDQDg1XmhYW0NvetRMH0Kp9MWf
	kR/A5IWRDue2023gNp808KAsbud6SaqIlMIGW1sWKVtZsT6d3+2k8l8Gi6ARvSETwdNdyLf+1ivI5
	Zxf0XEN+KrNr9HkgiFk7VxTx3MiMQd0GPsFIl7LBTr57Gp+F0GVYMdB/I4G61aSw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vqabv-00000006Syu-3s3E;
	Thu, 12 Feb 2026 18:36:16 +0100
Message-ID: <c9353b48d4efdcdfcd46553e83a8131869c08b49.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2 00/02] wifi: ieee80211/mac80211: Add
 UHR (802.11bn) Capability and Operation parsing helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Thu, 12 Feb 2026 18:36:15 +0100
In-Reply-To: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_093620_084131_F43746D3 
X-CRM114-Status: UNSURE (   9.10  )
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

On Thu, 2026-02-12 at 22:53 +0530, Karthikeyan Kathirvel wrote:
> This series covers support for UHR capability and operation (11bn)
> parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.
>=20
> The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
> There may be changes in the code to adopt upcoming 11bn spec changes.

Indeed. I hear Qualcomm prefers 8 bits for the NPCA primary channel
rather than the 4 bits for the NPCA primary channel (offset) ;-)

Anyway, I'm sure we'll adjust this all eventually. I just wanted to also
say that I'll try to post the NPCA changes I made soon, where I was also
adding NPCA to UHR capabilities in hwsim, but that doesn't really
matter.

johannes

