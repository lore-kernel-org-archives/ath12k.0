Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22733CD8C85
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBKR43MBL4MY4PqSfuY1MJ8CjvTvAn+/3f1jFPC1VeY=; b=rWWwY4o4aaBxCXmpRPAQYFxX1e
	MHROqppeUHnym349p5M9tKpIzEjM/8pTxrq3kgW/rMAVH/fNocOCmk9gXQNrvJ04eUI/Fryze4/ez
	WYgAAWQo6MmFjQzD3/tesH2hhlI0jD3RnE/TOuv0AtPdeJG1LTPpymWG8VmSKKp8cXigqymLa1Pyz
	NGxedOGrEwKaMMymUtq/zU7voHJPiuzJS2gWAsnw3H8H6Kjq5atwu+9nTUNQi8Ef81uptEBLH3fAZ
	TCSXHuTc0Y7YI/a6y+3r/gD9PvdfLLzvvsfxCDsigTMvuIV/SdDebtAAztDBYC8yr4LR8rAiIElnD
	iZ2tP+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq8W-00000004tNe-3Ujz;
	Tue, 09 Jun 2026 06:40:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq8T-00000004tM9-0pSf
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 06:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780987226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBKR43MBL4MY4PqSfuY1MJ8CjvTvAn+/3f1jFPC1VeY=;
	b=HKRpVscm7zi4X85/G/DfOGCPXYyj+YRUmllNx4tyDIYiV99bBL6HsRRFeXAzMvnJQFuqZq
	64/doMGcW7Y3h2km2a4kjg2hiHQveSKu6f64wVNhDlflUJbwZqAhUdlNKWGdzhbf6JHG3L
	8ntJKwWepoP1BUXl6xFdjqAQ1BJPQZE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-OswMwogQOBSZEAMPF6MvHg-1; Tue,
 09 Jun 2026 02:40:24 -0400
X-MC-Unique: OswMwogQOBSZEAMPF6MvHg-1
X-Mimecast-MFC-AGG-ID: OswMwogQOBSZEAMPF6MvHg_1780987223
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81C7A1800D9C;
	Tue,  9 Jun 2026 06:40:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.77])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20BEA3653A;
	Tue,  9 Jun 2026 06:40:19 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ath12k: fix NULL pointer dereference in rhash table destroy
Date: Tue,  9 Jun 2026 08:40:16 +0200
Message-ID: <20260609064018.28434-1-jtornosm@redhat.com>
In-Reply-To: <973da9e9-3851-4e00-85d4-28140c039127@oss.qualcomm.com>
References: <973da9e9-3851-4e00-85d4-28140c039127@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: TEMo2Zjaj6ob-Q7ifPjjmM6icW4ak4NT3usmxVIMtN4_1780987223
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_234029_309499_90F73860 
X-CRM114-Status: GOOD (  15.34  )
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

Thank you for the feedback.

> My preference would be to fix the logic so that the deinit is symmetric with
> init, and if any stage of init fails, it should unwind whatever init occurred
> up to that point. So this patch seems to be a bandage instead of an engineered
> fix.
>
> But I'll let the Qualcomm engineering team give their opinion.
I understand the concern about symmetry.
The NULL check approach is intentional here. The ath12k driver has complex
multi-stage initialization, with many potential failure points.
The init/deinit paths are symmetric - destroy is called from the same
cleanup paths as init.
The issue is that init can fail partway through, leaving some components
uninitialized.
The rhashtable pointer itself serves as the initialization state indicator -
it's NULL before init and non-NULL after. Checking it directly is simpler
than adding separate state flags that must be kept in sync.
That said, I'm open to alternative approaches if you see a cleaner way to
handle partial initialization states across the driver's initialization
sequence. Happy to revise if there's a better solution I'm missing.

> not a fan of this pattern.
> if we go with a bandaid solution then i'd want to use guard(mutex) so that
> there isn't a need for a cleanup goto -- we could just return like the patch below
Agreed, guard(mutex) is cleaner. I'll incorporate this in v2 once we align
on the overall approach.

Thanks

Best regards
José Ignacio


