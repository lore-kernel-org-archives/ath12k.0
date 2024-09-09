Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E678CD4F4C
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 06:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1iUyaGXZrYzWg+8Zzh+Xg4FDb31jqfbUsrskSNw/fEE=; b=sO72i0uXRbjQCa
	PQanLBIuLgDEXxBIM+0Rcz6eh6Og0Vm4BDJEhLGjDlXnwknVxNK5ZJ33V0V/5e0Ug1/W2dANmfhSF
	fJb3cCWqJLBXmx5dMCdnDVrG18t+RikzFGzIv4F7KSNml7H5uH7hggz6nwbl+NF2S1cXXdRKnUJQg
	0VxDGpHQOIlnnDEbrHZSHT31LnQuXRVEfbG7h+swJxzDlN2c5Dhb2e2Rv4ajVA9QLetrcAalMD5C3
	tPwZdg0wXrdWuz5tXuQsZc6OfZqqIkV5Ovy1yxD4ZdIxV89aKeFU0a8MJpjG4czhPs4CmZ6p0wnvD
	qpNHrzSVwcTSszn/Saqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snY7z-00000000fBF-0PGw
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 06:43:59 +0000
Received: from c2202.mx.srv.dfn.de ([194.95.239.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snY7w-00000000fAm-0lO8
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 06:43:57 +0000
Received: from mailout1.hs-ulm.de (mailout1.HS-Ulm.DE [141.59.88.26])
	by c2202.mx.srv.dfn.de (Postfix) with ESMTPS id C427B800BE
	for <ath12k@lists.infradead.org>; Mon,  9 Sep 2024 08:43:51 +0200 (CEST)
Received: from smtp.hs-ulm.de (rz-msx-12.hs-ulm.de [141.59.85.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailout1.hs-ulm.de (Postfix) with ESMTPS id 4D7D2E013B
	for <ath12k@lists.infradead.org>; Mon,  9 Sep 2024 08:43:51 +0200 (CEST)
Received: from rz-msx-11.hs-ulm.de (141.59.85.11) by rz-msx-12.hs-ulm.de
 (141.59.85.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 08:43:51 +0200
Received: from rz-msx-11.hs-ulm.de ([fe80::d7e5:8b45:bbf9:c264]) by
 rz-msx-11.hs-ulm.de ([fe80::d7e5:8b45:bbf9:c264%8]) with mapi id
 15.02.1544.011; Mon, 9 Sep 2024 08:43:51 +0200
From: "Wieland, Jens" <Jens.Wieland@thu.de>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: 
Thread-Index: AQHbAoOc/9cDIlIg1EmG4znykik8AA==
Date: Mon, 9 Sep 2024 06:43:50 +0000
Message-ID: <8868f08b4c0d4ec4bd9c9bf0a3a188e3@thu.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.59.88.111]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_234356_387785_4B2BC87E 
X-CRM114-Status: UNSURE (   4.43  )
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

subscribe=20

