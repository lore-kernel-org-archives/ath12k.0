Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6884D1039B
	for <ath12k@archiver.kernel.org>; Wed, 26 Nov 2025 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j+jbzOlKqdDHKKPf+IwztOjhFfj+0D9HMObucyXHpg=; b=AFHsaEMt0TO74ckJM+Xc9iIKWV
	A10E+cyJfPFLn3tEB7WDB+Wf3wt6eud7Yg6OuCf3opncskjiAsIy6ixJHcmqJNFeEq+inqTP1SfD0
	BDc+14AUeiVDx213ixpi+pptOIb3SFMpSmxRxEgGoCtGh5zrEZJxBFqiRabhfcNj9JH26sFBoTQ3C
	OpglbkPCH2B+ZTcsMZuiDrNjd3KYZbDUnuKfQpkdv87tGKSZxkMAHd8gso5/ztTDJa0r5+OgTWupl
	8F2CCbkzEp/+S79LeF/eEcDYMfzK6MUCUP3FHfch/RTbMyYSj0iKuHDM6z6cd22T+HRkOBSAnUCvo
	/AXrwOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIvO-0000000FMNC-1tTe;
	Wed, 26 Nov 2025 17:03:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIvM-0000000FMN4-2eYO
	for ath12k@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6j+jbzOlKqdDHKKPf+IwztOjhFfj+0D9HMObucyXHpg=; b=Ulzv0QnbMcP7o3L5KJ68/P36S6
	ihtMpN3HZx89LKaACnN/KGdZIinQ+lALJfJPLOiZyCFQ9FjlT0+xMg/drraevisyNcik/HWCDUVLv
	ML6J6GLa3ZjRZSSfLqcCIK4Wub9uKWLT9DxzA46782HpXn8PBe77e2IeTtyQBoyD4w7jcjDnS6LEL
	9qzmF5dle1Xi2+ps5KMa3q8URv1s0LjC3zx+YKwy+Ytg89UXPxLU5uA2WbRLqv6QW5VyTaWf1aFJs
	5RJOvCt1GaqkUJpdlQt1MPhRVwD/RxwkZzFOLLFxsIzyTvBUAsGPQp5Ts0y9r+IbaCAYhkDEEenv3
	/6a5IgZg==;
Received: from mail-43103.protonmail.ch ([185.70.43.103])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI3j-00000008SoP-1F9x
	for ath12k@lists.infradead.org;
	Wed, 26 Nov 2025 16:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764176592; x=1764435792;
	bh=6j+jbzOlKqdDHKKPf+IwztOjhFfj+0D9HMObucyXHpg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MxpdJt6R2VsFFj/eGOSFOZEOaYJimqU8m5RguipikwSm8Wh9lQ1EiLs4sxR85uo6N
	 edxINToGhvHH6rz6c2YkpfUde4G//rVThGY5+1wzLZemyClA5Bif3O/IjzldaaI2Rb
	 /aajEtMvTFBBidyYVhGST6cR+E1xEPbakABu+n+60f7lJuPzZsz7ywavnUTHZC+6Zf
	 vkgoVywBssCPmIkJN9GdnTMbZnWKSqe6bqa/wwarW9mbstZReTa02W1rVWtTQPypzz
	 kNYpoqsR6JyzfJdBmbzxU0O5Y9OKJXLs25ovpysqoNYwc0X/3dWkf3i+pE12jACtgp
	 3NGUWPdhF4E3g==
Date: Wed, 26 Nov 2025 17:03:04 +0000
To: ath12k@lists.infradead.org
From: Alexander Minchev <adminchev@proton.me>
Cc: linux-wireless@vger.kernel.org, Alexander Minchev <adminchev@proton.me>
Subject: [PATCH] wifi: ath12k: remove redundant pci_set_drvdata() call
Message-ID: <20251126170213.27959-2-adminchev@proton.me>
In-Reply-To: <20251126170213.27959-1-adminchev@proton.me>
References: <20251126170213.27959-1-adminchev@proton.me>
Feedback-ID: 99141252:user:proton
X-Pm-Message-ID: 06f2652ddaa9c14676e7e7810369f8a69366e552
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160759_535664_33514D03 
X-CRM114-Status: UNSURE (   9.12  )
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
ath12k_base is fully populated. even though exact placement is
not critical, keeping a single pci_set_drvdata() at the end of
the initialization makes it clearer that drvdata points to a
fully initialized structure and avoids confusion for future changes.

Tested on: WCN7850 hw2.0 PCI
WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

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



