Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AF8CCA463
	for <ath12k@archiver.kernel.org>; Sat, 17 Oct 2026 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32ROnbLRGK5yQqWv4zvyzIZU4X+Kno5K7VF1XhhIYHQ=; b=gxR1/bADlIWlC3aY4Rg7UkEhrh
	+v0Kh28Jkl0wWCvaFzmaVL4h27WU0E8u9EwxQ5Ej89aF1FRgsRrmIEi9QwSnZFbbidxxg/ICzcOj9
	sN+oZlXSu+NKPR0mLTpolun9wsRg0kR7fjRmJHJ3csqzhq37IXQXrjM3WSGCWVW6enEVPt2+12vEl
	qmQm4DypC33Z1z/39Zy7numKHEP6mHuv/jEff5Fk2t52dZRcHvoYG/m+XHsRlK9IuV5Hd5cFk6Bde
	6as1xZ/IANBL70m48G3bN7PBLiS4xjI7xrf/P3s3goqsdnEYVlHWTgTEl2GgchD6Ky2v/ABPYLgiV
	IVBiWb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz1s-00000004XJO-3W37;
	Sat, 17 Oct 2026 07:40:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz1o-00000004XIG-2pwd
	for ath12k@lists.infradead.org;
	Sat, 17 Oct 2026 07:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792222823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32ROnbLRGK5yQqWv4zvyzIZU4X+Kno5K7VF1XhhIYHQ=;
	b=ccTBmje1lDGXxOKWMwuV0VAjuRG7TkUxOYu2gL2X4XbkfocSfAVQ+Ce1VGOOgcnl5sShkF
	pCMk7lMNpgX/wA41Y59KABa4snp9Y0O2Lz6w5MPMZ2Tuj06ltDPFSAa1lgyocOCAjh2e9J
	qTuGKDsZyP+wphDdwGWiD+ratZL6nxU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-n-lOljHTMkm4dNjJEocrPQ-1; Sat,
 17 Oct 2026 07:40:20 +0000
X-MC-Unique: n-lOljHTMkm4dNjJEocrPQ-1
X-Mimecast-MFC-AGG-ID: n-lOljHTMkm4dNjJEocrPQ_1792222818
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C424F1956074;
	Sat, 17 Oct 2026 07:40:17 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 672B53000735;
	Sat, 17 Oct 2026 07:40:14 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: julius@bairaktaris.de,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Sat, 17 Oct 2026 09:40:11 +0200
Message-ID: <20261017074012.35602-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
References: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 14d9UwP8Z_KRlNqRLmZFQOtrhAnPDW4iyvskgQoPo6I_1792222818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_004028_795774_58A62E31 
X-CRM114-Status: UNSURE (   5.71  )
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

Hi Tamizh,

Thanks for the heads-up about Julius's series.

I have reviewed it. Both series replace .wake_tx_queue in ath11k, so
they conflict textually there, but they solve different problems:
mine stops -ENOMEM by checking the ring space before dequeue, his adds
AQL, airtime fairness and a full deficit round-robin scheduler. The
two are complementary.

For ath11k, my series is smaller (4 patches, 7 review cycles) and has
no external dependencies, so it may be simpler to land first. Julius
already offered to rebase onto it in his cover letter [1] and move the
ring check into his scheduling round.

Since there is no conflict in ath12k (Julius's series is ath11k only),
I could split ath11k and ath12k into separate series to try to unblock
both. By the way, any more feedback on the ath12k patches? WDYT?

[1] https://lore.kernel.org/all/20260908135319.754140-1-julius@bairaktaris.de/

Thanks

Best regards
José Ignacio


