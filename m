Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA71ECC6B0E
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeUXwYP8/FNRFS/9a5waWcvU8Fc4oxwHviZo5ZlClWA=; b=gEAhOn2HZxOWVuW6w8o+B6uyAC
	cnRpFCbsHfQgaCPcS88It8JZpFH5RQURaZcuuGOLghH7XfpGSg8ORBOSWcrd2/1JctuBQtm9QiRLP
	UwB9Z0dDk8A/kyl0S8NksQRw9pAhPegi7rEJsFBoBYBV7KN+OUPI+pFlz1mM2Ns8EYgltRyIqG/pk
	9jEdgLwdV3gtv5t0f9TUX0RFL957LXK9XXVannWIoLSbV0SKJGk+1ZSscxuwiSgSnW4HgfLk7FE1o
	qJfAOuCCfeuS7NmCmlh8SKen1GBYodByJGlO8uBQwt7UuA2ZjOTs4/cIrYChPNEIN4zo91jvN8u6A
	A6tpe0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfeO-0000000DaGl-1MgW;
	Tue, 13 Oct 2026 16:46:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfeJ-0000000DaFt-4Aza
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 16:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791910007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AeUXwYP8/FNRFS/9a5waWcvU8Fc4oxwHviZo5ZlClWA=;
	b=Xl00dlmNNBJbJBbbP/d8QCkgnfPpAAUzTwM91ihoBGaSfpicCBQa2wcqZuAqUKWuNQjO7e
	SRc62kVopqx3slhBX/UsXJfOsRDNQnEZDkRr6OpW0JCkjAsGr50arPRFPfAP5YzEDFYHku
	Y872dutiCMWZpwm+c475OcS/AMBbUR8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-IGwXJBi8NjC_dVumhGwqZQ-1; Tue,
 13 Oct 2026 16:46:44 +0000
X-MC-Unique: IGwXJBi8NjC_dVumhGwqZQ-1
X-Mimecast-MFC-AGG-ID: IGwXJBi8NjC_dVumhGwqZQ_1791910002
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BCA2180076D;
	Tue, 13 Oct 2026 16:46:42 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A66B1956095;
	Tue, 13 Oct 2026 16:46:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jtornosm@redhat.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Tue, 13 Oct 2026 18:46:38 +0200
Message-ID: <20261013164639.237064-1-jtornosm@redhat.com>
In-Reply-To: <20260917064825.12747-1-jtornosm@redhat.com>
References: <20260917064825.12747-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: dgFvlbVipKKEq98QqrkJxdQJdlkwj8e41d_gc35i24E_1791910002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_094650_649686_619BF800 
X-CRM114-Status: UNSURE (   7.73  )
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

Hi Jeff,
 
Friendly follow-up on this series. v7 addressed your spin_lock_bh
comment, and I replied to the rcu_dereference_bh question explaining
why ath12k differs from the ath9k case (happy to do it as a follow-up
if you'd like). My results with VMs are much better with the TX control,
and I think it can help baremetal too.

Any feedback on v7, anything else I can do?
At least, would it be acceptable for ath11k?
For ath12k, if the concern is the locking, the rcu_dereference_bh
refactoring would require changes to existing mac_op_tx code. Is that
the direction you want?
 
Thanks
 
Best regards
José Ignacio


