Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C7CFD2F6
	for <ath12k@archiver.kernel.org>; Thu, 27 Nov 2025 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeb16qWV6LdNV6A/VkICMjQSqVLaKQ6xPsy7SacqiaE=; b=S3h4+8FJ0Dvr9efg+heJ16fxmR
	2Y5wg2BU2iekiKEmF/qV1mt0zndUW9g0AnaBarz+oRS/8dhRE8Ktbs2UJsA1cNhYo9bxVOirYjrER
	dPG8wDDUSgyTI+DiCXG/lLhMGKJ5FDMoOro1H96nBgGvpurzPVPoohwEp0nAAPq8NAo5+j3Q3etrr
	l2zsZi35eSuF5qA+US+6JC4dmiz5MGE+5aUTqiM4cD3F9y8OaCkvUAWogvo1Y+ApwDgHXtXk1h1GR
	VjaDQlGDqo3OR/iuwDJ3f3PmHYM6gn8r1PjrdWZxwYj4ApskxelEntfKeEgoqOx45kBED/dmr01+N
	h7N+ectQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWRl-0000000G7UY-0lfg;
	Thu, 27 Nov 2025 07:29:45 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWRj-0000000G7U4-0wSi
	for ath12k@lists.infradead.org;
	Thu, 27 Nov 2025 07:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=yequqnhqivgkdmpuiowybaonaa.protonmail; t=1764228581; x=1764487781;
	bh=aeb16qWV6LdNV6A/VkICMjQSqVLaKQ6xPsy7SacqiaE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FKS5E4IIYGHAg2RTVKv7LIM+zEfefzPah0Bee27NEjMq/odVJdqB0YdBTN87xSXcg
	 B70Tvrt8ZwBIDBEavoPnFiJcfKHg49xQYQMHkxEMgbb9bvd5skBCQ3TCgS0CtzbZxM
	 s59QPhiudEmv9523B9OEMlOyHgfGnMmgnFkEkZy1vcjl2zSFhDQtXsKGjv4FkAr6zk
	 aNT89T+z0NzXDROTjey87wjUgM3EcPpf9lcFoVPPMU6uxwaP5JfBl2pCcja5nKw69c
	 XjkeAg9L9JfY4kKe35Xz8Zz1FlsoFQ/QrZECIEUHvC5p6U8N7UYLorkzMZQOQ2pZT6
	 wgG+gRXGlkVLg==
Date: Thu, 27 Nov 2025 07:29:37 +0000
To: ath12k@lists.infradead.org
From: Alexander Minchev <adminchev@proton.me>
Cc: linux-wireless@vger.kernel.org, Alexander Minchev <adminchev@proton.me>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH v2] wifi: ath12k: remove redundant pci_set_drvdata() call
Message-ID: <20251127072839.14167-2-adminchev@proton.me>
In-Reply-To: <20251127072839.14167-1-adminchev@proton.me>
References: <20251126170213.27959-1-adminchev@proton.me> <20251127072839.14167-1-adminchev@proton.me>
Feedback-ID: 99141252:user:proton
X-Pm-Message-ID: 224bf10dde5090112663872aeb2303fe6d8ab983
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_232943_403616_D0011366 
X-CRM114-Status: UNSURE (   8.59  )
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

pci_set_drvdata() is called twice in ath12k_pci_probe() with the
same pointer. Remove the earlier call so drvdata is set after
ath12k_base and ath12k_pci initialization is complete.

Having two calls might suggest that drvdata needs to be set early for
some reason, even though it is not used until after the 'ab' struct
ath12k_base is fully populated. Even though exact placement is
not critical, keeping a single pci_set_drvdata() at the end of
the initialization makes it clearer that drvdata points to a
fully initialized structure and avoids confusion for future changes.

Tested on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SIL=
ICONZ-1.115823.3

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Alexander Minchev <adminchev@proton.me>
---
 drivers/net/wireless/ath/ath12k/pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/a=
th/ath12k/pci.c
index a12c8379cb46..7bf98618ac1e 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1580,7 +1580,6 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 =09}
=20
 =09ab->dev =3D &pdev->dev;
-=09pci_set_drvdata(pdev, ab);
 =09ab_pci =3D ath12k_pci_priv(ab);
 =09ab_pci->dev_id =3D pci_dev->device;
 =09ab_pci->ab =3D ab;
--=20
2.52.0



