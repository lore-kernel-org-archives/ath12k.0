Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A8C982C1
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlcSCaOgVWAQsVp/37r62Fp85wjLzCNshdQoQFfZFUk=; b=QefMnjOx8RHe3wyTUz/tqae9Lf
	cj0M6Bm4Dr+EVtDhrf0jqckQeyYiSPTiasVHaiq7gw1Vn8hltswMun1LLliWsvSvlreoZqcuFn8LD
	LOB825I3I5Dr5F6+4v886UmghWMlzASuYDDa/o5nBQjjC9vLdU6n2+70gIfUU++1A8sH2SQVIjuWA
	TYz9FIyLjBp03/ZED2Rgv+f2w4Vfj5WRY3/4Y6Lw2MDIhHzFfLepLIarokW0QvJWDboJBkAwjfCWF
	BYubcYewsvJJ62ELiOAAJEU2QEyUtwSqMumDF4YEz3BBrRpbWCfqlbxZXMkZZrhFgE5CvOOCqkSqr
	ptjfORww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75nR-0000000AgHB-0Vib;
	Thu, 17 Sep 2026 06:40:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75nO-0000000AgGR-2pJL
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 06:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789627233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlcSCaOgVWAQsVp/37r62Fp85wjLzCNshdQoQFfZFUk=;
	b=Z7hdh2OTZS0u59NhRrdWAUtNtrR/dlXGUGnZql9++dLSmFA9AfJjivc//sSLT7Lh3OKyEG
	oWUDvv/E+qVEUPxh0rl2i23DN+B2e8aVICa1eaMBESE/Yp5pVdrwQgL5lak4FrlQRyEvku
	fMS/4hs//UvuWtYuhzN0BEU3kep6p9Q=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222-KKCv_-iXOf-U2idK-TwV8w-1; Thu,
 17 Sep 2026 02:40:31 -0400
X-MC-Unique: KKCv_-iXOf-U2idK-TwV8w-1
X-Mimecast-MFC-AGG-ID: KKCv_-iXOf-U2idK-TwV8w_1789627229
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3C9C1954122;
	Thu, 17 Sep 2026 06:40:28 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB82B3003EED;
	Thu, 17 Sep 2026 06:40:25 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	dolinux.peng@gmail.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	toke@toke.dk
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Thu, 17 Sep 2026 08:40:23 +0200
Message-ID: <20260917064024.12175-1-jtornosm@redhat.com>
In-Reply-To: <0bac4c07-6c78-478c-b3ec-1d897cdd8acf@oss.qualcomm.com>
References: <0bac4c07-6c78-478c-b3ec-1d897cdd8acf@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Vd_gbF2iDe-Jihmo4dzXnop5dnxPl6-HwSiUlA1qTFc_1789627229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234034_785528_1630C578 
X-CRM114-Status: UNSURE (   8.56  )
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

Hello Jeff,

Sorry for the late reply, I was on leave as noted in the v6 cover letter.

> I have a fixup for ath9k which does:
>       171 -  ratetbl = rcu_dereference(sta->rates);
>       171 +  ratetbl = rcu_dereference_bh(sta->rates);
>
> Should ath12k also use rcu_dereference_bh()?
I think the ath9k and ath12k situations are different. 

In ath9k, the rcu_dereference(sta->rates) is already inside the
spin_lock_bh(&sc->chan_lock) section, so BH is disabled and switching to
rcu_dereference_bh() directly satisfies lockdep without needing
rcu_read_lock().

In ath12k, narrowing the rcu_read_lock() scope would require changing the 4
existing rcu_dereference() calls inside ath12k_wifi7_mac_op_tx() to
rcu_dereference_bh(), since that function has an existing contract
(/* Note: called under rcu_read_lock() */) and is called from wake_tx_queue.
That is modifying working code beyond the scope of this series. Happy to do
it as a follow-up if you prefer.

Thanks

Best regards
José Ignacio


