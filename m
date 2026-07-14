Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E8C44507
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGj48yemdWauySdVEsdnGgJJ0oT9G63LD8JsctGOIY8=; b=OciBPcGasKgZSWfSKWZRHpo26A
	SwWSwyb38JN6TV7bUY9fvYtcYiYPKJJ/vCPbOH4CJ2IfJyWqu/s+B8XpSsFb5H23Iot8Kq15vUSX1
	SPEBuNHHQTcb0dtz7ZDO2JhrBi3W+qrNjS5XB/HOgp/NIVeV7M57JxMgnCAIPcYEdlMHrCwT4DOBd
	ZA0RNbMfcgVPGjW1QhYPber12iPoVvNdo0DY0Ypc/bof8pMxmEu6FlvyjdaiHfnQxriC6J88Ih/EF
	+QHl1CRzH1qmG9h8O85OKfen8DXrFQPczklPNE25ICK1ReW7+6k0bbVPTCHir3qzRNnEpcDy+5SBP
	52Zr4xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX5z-0000000B6Zi-457w;
	Tue, 14 Jul 2026 06:58:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX5y-0000000B6ZQ-2bHC
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jul 2026 06:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iGj48yemdWauySdVEsdnGgJJ0oT9G63LD8JsctGOIY8=; b=I1HkgjXjoDQEdAKo6jQ2zfvalZ
	4ddMog3CFjvujLkiQtw1j0WdkcdxQM3s2iAm8M/IPbzrWn6LejtUXdQ8IX4ReQo54Y+jJwp0yeO3W
	qRsImEyx8Ey7ma3iynbgkb5VA7Y+0NxqFcrf6zKcIZW0CKO8G2Litaqm4sIf92PXMIbuaPsjMJrNf
	pP+56khMTyBPPbdOzwSOby80lHb1vbhICx14RIiVbx76XYn/Ol6KBCh6TzzJJMb12t0vRJX3idcWg
	UEAif6wONk8d80BSSueWkrbbvaqyzJH0Suw0YuKVe68RQJGwO8FYbI2GixdyNRRETSzxF49ayFqby
	BvJK9OLg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjX5v-0000000CFkj-12E3
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 06:58:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66E6vmvsF1943012, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784012268; bh=iGj48yemdWauySdVEsdnGgJJ0oT9G63LD8JsctGOIY8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=mI76qIyrAvl+Y0uGC+dY+9eJWZZJ88t5FcDyCv2Lk4AnrJmGW7LQ2/z11uKF0FmWn
	 wai2Xkkh87mUdQm6q1MH8SJG6swP+nNuShcb1b8486SiUkB/wBU+RNaGB/ZfqYOI+x
	 7CgEJqQvbiaRgGND++eke8Ks1QQtS9QQjaa9s9I6ficw1bEdwbIt5+BzssFwSIErYN
	 a1XcnF7X4BqTSWlswpxmw3F2Mb8KvoOMrtnTzSGmxd08eeWsbixlCi6oRHrE+cexKU
	 lVVDCKFVaP0mmqbVWLqwE1VrZMBKI4bSi5PgDYFS1mT3NzNgeLPJksHvYXZBAKR3DS
	 6SCofsn5kUhkg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66E6vmvsF1943012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Jul 2026 14:57:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 14 Jul 2026 14:57:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 14 Jul 2026 14:57:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 14 Jul 2026 14:57:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jeff Johnson
	<jjohnson@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH] wifi: ath12k: Constify struct ath12k_dp_arch_ops
Thread-Topic: [PATCH] wifi: ath12k: Constify struct ath12k_dp_arch_ops
Thread-Index: AQHdE1uKB+sp9zTsUkKJ8dFek3N2uLZslSiQ
Date: Tue, 14 Jul 2026 06:57:42 +0000
Message-ID: <2efa694140ce418c8d83a62d3f7b5309@realtek.com>
References: <469d732e2c6f159e1a05e89c7e417c3a10db5fdf.1784010931.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <469d732e2c6f159e1a05e89c7e417c3a10db5fdf.1784010931.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_075819_723118_EDDF2D9D 
X-CRM114-Status: UNSURE (   6.43  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> @@ -139,7 +139,7 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k=
_dp *dp,
>         return tot_work_done;
>  }
>=20
> -static struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops =3D {
> +static  struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops =3D {

Did you miss 'const' here?



