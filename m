Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DE9C25B75
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOU4Cshkszd003EzQOCHeVJfUVoNCzZo0doSzm/lJys=; b=SzTDz9WEqkRI7DA548T6SMszqp
	eMWmRqHIBb5mxanXACP3v1AoaOjxs6pGj5OTYCyKssN5Rw2a0DmzgYaI9+Zgr7VbaxxhejIlslO/Y
	oKo0bGIxFLY63Yv8I9o9XtMIQ5Jm3PIvMn3/Mg/TrXKvgscOjb96CEgeg/773yy/xSLF1/8nDxMOq
	ctA1G3Pct8qqoy5qqSNCb044uFVNGmD/sah1N9OFefsY3jgfC+eDYY4IQLQk5ASLPuPdBuGtIvEMe
	u1SRwwyeLTvEQ89MitYw3mqw8N0rqfdY5PHjK2qIv05Gw8h70tll4MWN736RTCc8rG43JYyyR6Z1d
	H2eicGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2FI-0000000FufL-3UhE
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 07:36:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2FG-0000000FueB-2YPm
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 07:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MOU4Cshkszd003EzQOCHeVJfUVoNCzZo0doSzm/lJys=;
	t=1717400202; x=1718609802; b=c6pb2KT/sxmnHVQsmie7wsOx5ClIzFVQGvD94qXtkNicdiP
	cyekL5R0fyBf9/pY3t27d9qOfr7WOjqP4MOSALFhjodBXrJ5hM2r7RYa1I9aMKtP/+3DqfiDgITMd
	yLf9epgWpBYjdno+aoPBGT1Mzt2Se/UMJOk4x1umGMUIQnGxY2xmGa7NVDo0cbBFkPydPPUfML0+v
	2w8rEe+fkH5LM7zzXLb/osYiJjSX4u/UoEtMA/JSoy85IkZfZYtIHJIOQdN5C1Kwoq5t3wLSxTlN1
	ISpXMbPWAElGCz21/Nm6ZSP4EAysZ1eKpwPfEkC/mB7hWfuFlB4qauXfIZKq+a8Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sE2FD-00000009KjJ-3DFA;
	Mon, 03 Jun 2024 09:36:40 +0200
Message-ID: <43680bd3c444da4c1b4e55b4ee4c7043c1186ccd.camel@sipsolutions.net>
Subject: Re: [PATCH v3 6/8] wifi: ath12k: support ARP and NS offload
From: Johannes Berg <johannes@sipsolutions.net>
To: Baochen Qiang <quic_bqiang@quicinc.com>, Jeff Johnson
	 <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 03 Jun 2024 09:36:38 +0200
In-Reply-To: <af326e49-df6e-4574-9562-44b6aee10abd@quicinc.com>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
	 <20240530072714.25671-7-quic_bqiang@quicinc.com>
	 <ccf9791b-e050-4844-8c37-35873fb3fcaf@quicinc.com>
	 <17721436-19fb-4337-9058-b20f4df2792c@quicinc.com>
	 <af326e49-df6e-4574-9562-44b6aee10abd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_003642_672916_20F31E54 
X-CRM114-Status: GOOD (  13.19  )
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

On Fri, 2024-05-31 at 13:11 +0800, Baochen Qiang wrote:
>=20
> On 5/31/2024 11:42 AM, Baochen Qiang wrote:
> > > > +static void ath12k_wow_prepare_ns_offload(struct ath12k_vif *arvif=
,
> > > > +					  struct wmi_arp_ns_offload_arg *offload)
> > > > +{
> > > > +	struct inet6_dev *idev =3D arvif->idev;
> > > as noted above does it make more sense to get the netdev associated w=
ith the
> > > arvif and then use in6_dev_get(net_device) to get the inet6_dev rathe=
r than
> > > caching the pointer from the ipv6_addr_changed() callback?
> > Ah.. I didn't note that we can get inet6_dev in such a way, just though=
t the only way is to cache it in ipv6_changed() callback.
> >=20
> > will get it using the following in next version:
> > 	struct ieee80211_vif *vif =3D container_of(arvif)
> > 	struct ieee80211_sub_if_data *sub_if_data =3D container_of(vif)
> > 	struct net_dev *ndev =3D sub_if_data->dev
> > 	struct inet6_dev *idev =3D in6_dev_get(ndev)
> Just found that ieee80211_sub_if_data is internal to mac80211, so not pos=
sible to get netdev in this way.
>=20
> any other ideas on how to get netdev?

You can go via the wdev.

johannes

