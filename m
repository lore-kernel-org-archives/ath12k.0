Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0917606D806
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KeTY4wM8;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HEl6Yioi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wwMXdVcHWj7VNgwLkXURMtAFowP+ywwx/JvFKagWc38=; b=KeTY4wM8svkzkZsEfHTV55kJ1n
	TOSzPWpal4KxjcJjeq9qA7B5wRvjpXfmlwMBu1nQSxUmA71vSIol0fxipFmrEBJvj2huCh2zYrQuX
	NXUSRz28ghch0PCOWsloR4OK8TGjxHg+nOrfvHLOyOvtARnn4ZlZwxsqM5jG6Go/Iko1B9Qg8iE9o
	XPAkQJJ//tLgOqALSMZRA4UdwaAyzGPlLFiK31jsvd9F++zJLevr1eMVz6TNCMmk2DKT2h1uJ2ASW
	SpRL5GcCVkrT8jSpq45C9hAu1qH+VFtUUkr6tc5ge35W9vLXjFe5Rus+ktNcgsfeZuFcZ4gVHg4GZ
	WHPEv9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7gV-00000001BkI-3zEK;
	Tue, 03 Nov 2026 06:07:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7gT-00000001BiW-3n3s
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 06:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wwMXdVcHWj7VNgwLkXURMtAFowP+ywwx/JvFKagWc38=;
	b=HEl6YioiPwf2pDbpM2CSfIgq5jlgfvbDsWjSuFVcG3x72FM0cJu5uKUd9XooIwFuXZ7dMF
	iYFs/Okp05DgAUQ2WEyGOhBw7d5hQDUA8obkSERIninHvy+3NeA8Tra8p4rCDaU6Lm56hd
	j1aAnkjI3olra+7RdLtHa0UlsUJHBTo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-5vqILIpvNNKt6mHTo7xz6g-1; Tue,
 03 Nov 2026 01:07:43 -0500
X-MC-Unique: 5vqILIpvNNKt6mHTo7xz6g-1
X-Mimecast-MFC-AGG-ID: 5vqILIpvNNKt6mHTo7xz6g_1793686061
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D64391956044;
	Tue,  3 Nov 2026 06:07:40 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C013A30000E3;
	Tue,  3 Nov 2026 06:07:35 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: seanjc@google.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jgg@ziepe.ca,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	kwilczynski@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	pbonzini@redhat.com,
	robh@kernel.org,
	vkuznets@redhat.com
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Date: Tue,  3 Nov 2026 07:07:34 +0100
Message-ID: <20261103060734.34199-1-jtornosm@redhat.com>
In-Reply-To: <auilKFwKLjw-BnZM@google.com>
References: <auilKFwKLjw-BnZM@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: oFLSeZ_TXhACD635uoJzQNz0FwuZr__xveA8MoEXJh4_1793686061
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_220750_008603_26195413 
X-CRM114-Status: UNSURE (   5.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sean,

Thanks for the feedback. Understood on both the NAK and the timing,
apologies for the rush.

I am exploring the virtio-msi approach that Jason described, which
would not require any KVM changes.

Best regards
Jose Ignacio


