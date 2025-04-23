Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42C4C369CB
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t0+KPKv/ioJ18JH+ZW9DGQrfj4hDXtsEr67vUFR4CU=; b=z7rSSXiBeHQfcuvmdiBUy0x0k4
	CojXKJVFSnC/P0Qt1GdJTfb0V7ep/XGOmMK/GIhalv3qR+71e5PjBITpi85pW8aJOuwUnTCy6zKeo
	rQ7tYHbjQJwXC/dQXA1tk8joIqo8vRonI1N5ZXMO4m7S9YdX/jt8us1LPWoR7gnPAG4XmMdVbqAKf
	u3q6FV/N0omA/BuHteHA2XaQ9/QI9sXzEIHRpaOywVhxdSbKILCyMShJTE+J+f+lHGTu5Iqn9OwwI
	29WebZf2K9Z8AoM/xMdancwSd7EHYn6CKGJwgpuLPaGLZFrvMMzBj0aB5R7h+rHPBrd7GaRNqueJs
	OiRXuihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7w-0000000BMTM-4C87;
	Wed, 23 Apr 2025 17:43:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7byA-0000000AxWz-32rB
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 15:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8t0+KPKv/ioJ18JH+ZW9DGQrfj4hDXtsEr67vUFR4CU=;
	t=1745421902; x=1746631502; b=ibyCCuxRwhKuBgNycv5HTG3bjLUOyeUBVgDmznpx6dIICLI
	5qVFf9Q5D7XciPFs2YgEh5nv32HOOhSg5uNkv0CVfSGFin9KlfWxb5SAJBU2zSXJ1bUqhw56+IyjT
	nOdzl+Yl0+syXq+o8t8BiTI/hWhoiJsDFBaabqFO13hXVyehv3nQsIZItB+xryy9XRAd6R1U8P2wJ
	HmxQzK9/oIE7ATB4w9rGKnaAMvnAAigbvmlFnmDLxh8cNGIUSWB7W/IVyWBNNlsozOeDuUpTAG2gP
	LUNGmqn37MmDybP91UIPlmfaNxlg7mgEroyVoX+0aCdqaq+AyE8s0BbCPr46H7PA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1u7by7-0000000EmzS-1Orp;
	Wed, 23 Apr 2025 17:24:59 +0200
Message-ID: <9670e31afa60a810d7ae7b786c8815fd5ba178e5.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v5 1/4] wifi: cfg80211: Add support to get
 EMLSR capabilities of non-AP MLD
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ramasamy Kaliappan
	 <quic_rkaliapp@quicinc.com>
Date: Wed, 23 Apr 2025 17:24:57 +0200
In-Reply-To: <20250327051320.3253783-2-quic_ramess@quicinc.com>
References: <20250327051320.3253783-1-quic_ramess@quicinc.com>
	 <20250327051320.3253783-2-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082502_765144_4C6CC302 
X-CRM114-Status: UNSURE (   5.60  )
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

On Thu, 2025-03-27 at 10:43 +0530, Rameshkumar Sundaram wrote:
>=20
> +	/* Reject EMLSR capabilities change after association */
> +	if (statype =3D=3D CFG80211_STA_AP_CLIENT && params->eml_cap_present)
> +		return -EINVAL;
>=20

I changed that to be "statype !=3D AP_CLIENT_UNASSOC" instead, don't think
we should let you do it for TDLS/mesh/etc. Please send a fix if that has
issues.

johannes

